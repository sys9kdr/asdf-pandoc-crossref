<div align="center">

# asdf-pandoc-crossref [![Build](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/build.yml/badge.svg)](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/build.yml) [![Lint](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/lint.yml/badge.svg)](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/lint.yml)

[pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `xz` support for `tar` on Linux and macOS (the release archives are `.tar.xz`).
- `7z` (7-Zip) on Windows, required to extract the `.7z` release archive.

Architecture support follows the upstream release assets. For example, macOS ARM64 and x86_64 builds are published, while Linux ARM64 is not published as of `0.3.20`.

# Install

Plugin:

```shell
asdf plugin add pandoc-crossref https://github.com/sys9kdr/asdf-pandoc-crossref.git
```

pandoc-crossref:

```shell
# Show all installable versions
asdf list-all pandoc-crossref

# Install specific version
asdf install pandoc-crossref latest

# Set a version globally (on your ~/.tool-versions file)
asdf global pandoc-crossref latest

# Now pandoc-crossref commands are available
pandoc-crossref --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/sys9kdr/asdf-pandoc-crossref/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Daiki Noda](https://github.com/sys9kdr/)
