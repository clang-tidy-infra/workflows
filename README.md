# workflows

Reusable GitHub Actions workflows shared across `clang-tidy-infra` repositories.

## Usage

Call a workflow from your repo's own workflow file:

```yaml
jobs:
  code-lint:
    permissions:
      contents: read
    uses: clang-tidy-infra/workflows/.github/workflows/python-code-lint.yaml@v1
```

Available workflows: `github-actions-lint`, `python-code-format`, `python-code-lint`,
`eof-newline-lint`, `file-naming-lint`, `pr-title-lint`, `pyproject-lint`, `yaml-lint`.
