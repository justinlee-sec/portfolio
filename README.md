![Terraform validate](https://github.com/justinlee-sec/portfolio/actions/workflows/terraform-validate.yml/badge.svg)

# Portfolio: Cloud and DevOps

A personal website that doubles as proof of skills. It is hosted on AWS,
provisioned entirely with Terraform, and deployed through GitHub Actions.

**Live site:** [Portfolio](https://justinleenelson.tech)

> Status: 🚧 Under construction. 

## Goals

- Host a static site on AWS at near-zero cost
- Manage all infrastructure as code
- Deploy automatically with a secure CI/CD pipeline (OIDC, no stored keys)
- Show live GitHub activity and TryHackMe progress on the front page
- Showcase projects grouped by type (Python, IaC, CI/CD, security)
- Showcase badges earned through various platforms (TryHackMe, Credly, AWS, Azure)

## Planned architecture

| Layer      | Choice                                   |
|------------|------------------------------------------|
| Hosting    | S3 (private) behind CloudFront           |
| TLS        | AWS Certificate Manager                  |
| DNS        | ROUTE53                                 |
| IaC        | Terraform                                |
| CI/CD      | GitHub Actions with OIDC                 |
| Site       | Hugo with a terminal-style theme         |
| Extras     | CloudWatch alarms, serverless visitor counter |

## Roadmap

- [x] Phase 0: Repo foundation
- [x] Phase 1: Infrastructure skeleton
- [ ] Phase 2: CI/CD
- [ ] Phase 3: Site
- [ ] Phase 4: Trackers
- [ ] Phase 5: Hardening
- [ ] Phase 6: Visitor counter
- [ ] Phase 7: Polish

## Repository layout

```
.github/workflows/   CI/CD pipelines
infra/               Terraform
site/                Hugo site
docs/                Architecture notes and decision records
```

## Contributing and conventions

See [CONTRIBUTING.md](CONTRIBUTING.md) for commit and branching conventions.

## License

[MIT](LICENSE)