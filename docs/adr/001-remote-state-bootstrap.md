# ADR 0001: Remote state and bootstrap approach

Status: Accepted
Date: 2026-11-14

## Context
Terraform stores state describing the infrastructure it manages. Local state
files are easy to lose, cannot be shared with CI/CD, and risk containing
sensitive values being committed to a public repository. State needs a
remote, versioned, encrypted home. That home is itself infrastructure, which
creates a chicken-and-egg problem: the state bucket cannot be stored in
itself before it exists.

## Decision
- Store state in a dedicated S3 bucket with versioning, server-side
  encryption, and all public access blocked.
- Use S3 native state locking (`use_lockfile`, Terraform 1.10+) instead of
  a DynamoDB lock table, to avoid an extra resource.
- Create the bucket from a small separate configuration in `infra/bootstrap/`
  that uses local state. It is applied once, by hand.
- Keep the bootstrap's local state file out of version control. It holds
  nothing that cannot be recreated or imported.

## Alternatives considered
- **Local state only:** simplest, but not usable from CI and easy to lose.
- **DynamoDB for locking:** the older pattern. Adds a resource and cost
  for no benefit now that S3 locking is supported.
- **Terraform Cloud/HCP:** removes the bootstrap step, but hides the AWS
  side and adds a third-party dependency.
- **Click-ops bucket creation:** quick, but not reproducible or reviewable.

## Consequences
- One manual step is required to set up a new environment.
- The bootstrap state lives only on my machine. If lost, the bucket can be
  recovered with `terraform import`.
- The state bucket is the most sensitive resource in the project, so
  versioning is enabled to allow recovery from bad writes.
- Account access is via an IAM user with MFA for now. Replacing the keys
  with OIDC is planned for Phase 2.