<div align="center">

# asdf-pandoc-crossref [![Build](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/build.yml/badge.svg)](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/build.yml) [![Lint](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/lint.yml/badge.svg)](https://github.com/sys9kdr/asdf-pandoc-crossref/actions/workflows/lint.yml)

[pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Supported versions](#supported-versions)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `xz` support for `tar` on Linux and macOS (the release archives are `.tar.xz`).
- `7z` (7-Zip) on Windows, required to extract the `.7z` and legacy `.zip` release archives.

Architecture support follows the upstream release assets. For example, macOS ARM64 and x86_64 builds are published, while Linux ARM64 is not published as of `0.3.20`.

# Supported versions

The plugin installs the prebuilt binaries published by upstream. In addition to current releases, it supports the legacy asset names used by:

- `0.3.8.0` through `0.3.18.0a`
- `0.3.0.0` through `0.3.7.0a`

Legacy releases only provide x86_64 binaries; Linux ARM64 is rejected with an error. Versions before `0.3.0.0` are not supported: `0.1.5.3` publishes only a source tarball, and `0.2.x` assets are not handled by this plugin. `0.3.0.3` has no release assets, and `0.3.2.0` has no Windows asset. Pre-release tags without a mapped asset (`0.3.0.0-beta*` and `0.4.0.0-alpha*`) are also unsupported. These versions are omitted from `asdf list-all`; explicitly requesting one fails with a clear error.

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
