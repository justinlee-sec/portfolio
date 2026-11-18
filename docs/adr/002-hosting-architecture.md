# ADR 002: Hosting architecture

Status: Accepted
Date: 2026-11-18

## Context
The site is static and needs low-cost hosting with a custom domain, HTTPS,
and fully reproducible infrastructure that can be deployed from CI.

## Decision
- Private S3 bucket as the origin, with all public access blocked.
- CloudFront in front, using origin access control so only the distribution
  can read the bucket.
- ACM certificate issued in us-east-1 (a CloudFront requirement) and
  validated with DNS records in Route 53.
- Route 53 hosts DNS for the domain, with alias A and AAAA records pointing
  at CloudFront.
- Everything is managed with Terraform.

## Alternatives considered
- **S3 static website hosting:** needs a public bucket and offers no HTTPS
  on a custom domain without CloudFront anyway.
- **Amplify Hosting:** less infrastructure to configure, but shows less and
  gives less control.
- **DNS at the registrar:** free, but covers less of the AWS surface area
  this project is meant to demonstrate.

## Consequences
- The Route 53 hosted zone adds a small fixed monthly cost.
- Directory-style URLs (such as /projects/) will need a CloudFront Function
  to append index.html. This is handled in the site phase.
- Cache invalidation is part of every deploy.
- The AWS Free plan ends after six months, so the account must be moved to
  the Paid plan to keep the site running. See the cost notes in docs.