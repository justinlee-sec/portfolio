# Contributing and conventions

This is a personal project built in public. These notes keep the history
readable and consistent.

## Branching

- `main` is always deployable and is protected.
- Work happens on short-lived branches named `<type>/<short-description>`,
  for example `infra/add-s3-bucket` or `docs/readme-architecture`.
- Changes reach `main` through pull requests, even when working solo.

## Commit messages

This repo follows [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>: <short summary in the imperative mood>
```

| Type     | Use for                                   |
|----------|-------------------------------------------|
| `feat`   | New site features                         |
| `fix`    | Bug fixes                                 |
| `infra`  | Terraform and AWS changes                 |
| `ci`     | GitHub Actions and pipeline changes       |
| `docs`   | README, ADRs, and other documentation     |
| `content`| Site content such as projects and text    |
| `test`   | Tests                                     |
| `chore`  | Housekeeping and tooling                  |

Guidelines:

- One logical change per commit.
- Summary under about 70 characters, lowercase, no trailing full stop.
- Explain the *why* in the commit body when it is not obvious.

## Pull requests

- Link the related issue with `Closes #<number>`.
- For Terraform changes, include a short summary of the `plan` output.
  Never paste secrets or account IDs.

## Releases

Each completed phase is tagged: `v0.1.0`, `v0.2.0`, and so on, ending
with `v1.0.0` when the project is complete.

## Architecture decisions

Significant choices are recorded as short ADRs in `docs/adr/`.