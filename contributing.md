# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test pandoc-crossref https://github.com/sys9kdr/asdf-pandoc-crossref.git "pandoc-crossref --help"
```

Tests are automatically run in GitHub Actions on push and PR.
