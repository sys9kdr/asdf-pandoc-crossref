#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for pandoc-crossref.
GH_REPO="https://github.com/lierdakil/pandoc-crossref"
TOOL_NAME="pandoc-crossref"
TOOL_TEST="pandoc-crossref --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if pandoc-crossref is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

compare_versions() {
    local IFS=.
    local i version1=($1) version2=($2)

    # Fill empty fields with zeros
    for ((i=${#version1[@]}; i<${#version2[@]}; i++)); do
        version1[i]=0
    done

    for ((i=0; i<${#version2[@]}; i++)); do
        if [[ "${version1[i]}" == "${version2[i]}" ]]; then
            continue  # Versions are equal, check the next component
        elif [[ "${version1[i]}" =~ ^[0-9]+$ && "${version2[i]}" =~ ^[0-9]+$ ]]; then
            # Numeric comparison for components that are both numeric
            if ((10#${version1[i]} > 10#${version2[i]})); then
                return 0   # Version $1 is greater
            else
                return 1   # Version $1 is not greater
            fi
        else
            # Alphanumeric comparison for components that are not both numeric
            if [[ "${version1[i]}" > "${version2[i]}" ]]; then
                return 0   # Version $1 is greater
            else
                return 1   # Version $1 is not greater
            fi
        fi
    done

    return 1   # Versions are equal
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	# TODO: Adapt this. By default we simply list the tag names from GitHub releases.
	# Change this function if pandoc-crossref has other means of determining installable versions.
	list_github_tags
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	# TODO: Adapt the release URL convention for pandoc-crossref
	url="$GH_REPO/archive/v${version}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		# TODO: Assert pandoc-crossref executable exists.
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
