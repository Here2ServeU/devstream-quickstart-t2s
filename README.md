# DevStream QuickStart for T2S Services

A fully bootstrapped project designed to simplify DevOps toolchain automation using DevStream. Ideal for training labs, consulting deployments, or onboarding new DevOps contributors in real-world scenarios.

## STAR Overview

### S – Situation

T2S Services trains and mentors aspiring DevOps professionals and consults for small businesses. Setting up consistent DevOps pipelines, GitOps workflows, and monitoring tools can be complex and time-consuming—especially for new contributors or repeatable environments.

### T – Task

Automate and streamline the deployment of a modern DevOps toolchain (CI/CD, GitOps, Monitoring) using declarative YAML, DevStream plugins, Helm charts, and optional Terraform modules (EKS, GKE, AKS).

### A – Actions Taken

We created this repository to:

- Declare infrastructure and DevOps tools in YAML with DevStream
- Use kind locally for Kubernetes-based lab environments
- Support GitHub Actions and ArgoCD-based deployment models
- Include Helm charts for Jenkins, ArgoCD, and Prometheus
- Offer Terraform modules for AWS, GCP, and Azure

### R – Result

T2S contributors and clients can now set up the entire toolchain in minutes, repeatably, and confidently—whether for local labs or cloud production.

## Project Structure

```
devstream-quickstart-t2s/
├── .github/              # GitHub Actions workflows
│   └── workflows/        # CI/CD and PR merge triggers
├── devstream/            # DevStream main config and plugins
├── docs/                 # Contributor guide and architecture diagram
├── envs/                 # Environment-specific DevStream overrides
├── helm/                 # Helm charts for Jenkins, ArgoCD, Prometheus
├── infra/                # Local Kubernetes setup (kind cluster)
├── scripts/              # Setup and teardown shell scripts
├── terraform/            # Terraform IaC for AWS EKS, GCP GKE, Azure AKS
└── README.md             # Project overview and usage instructions
```

## Prerequisites

- Git
- Docker
- Kubernetes CLI (kubectl)
- DevStream CLI
- Helm
- Terraform (optional for cloud infra)

## Getting Started (Local Setup with kind)

1. Install DevStream

    ./scripts/install-devstream.sh

2. Launch a Local Kubernetes Cluster

    kind create cluster --config infra/kind-cluster.yaml

3. Bootstrap Toolchain with DevStream

    ./scripts/bootstrap.sh

This uses devstream/config.yaml and installs:
- GitHub Actions workflows
- Jenkins via Helm
- ArgoCD for GitOps
- Prometheus/Grafana for observability

## Multi-Environment Setup

You can apply toolchains based on the environment:

    dtm apply --config envs/dev.yaml
    dtm apply --config envs/staging.yaml
    dtm apply --config envs/prod.yaml

## Cloud Provisioning with Terraform

Under terraform/modules/ you’ll find:

- aws-eks/
- gcp-gke/
- azure-aks/

To deploy to AWS EKS:

    cd terraform/modules/aws-eks
    terraform init
    terraform apply

Repeat similarly for GCP or Azure.

## GitHub Actions Workflow

This repo includes:

- .github/workflows/dtm-deploy.yml: Runs DevStream on main branch push
- .github/workflows/pr-merge-apply.yml: Applies toolchain after PR merges

## Contributing

See docs/CONTRIBUTING.md

To add a new plugin:
1. Edit devstream/config.yaml
2. Add plugin-specific config in devstream/plugins/
3. Test locally with dtm apply
4. Submit a pull request

## Future Enhancements

- Add real dashboards for Grafana
- Enable automated cleanup workflows
- Add ArgoCD ApplicationSets
- Enable notifications with Slack or email

---

## Maintained By

**Emmanuel Naweji, 2025**  
**Cloud | DevOps | SRE | FinOps | AI Engineer**  
Helping businesses modernize infrastructure and guiding engineers into top 1% career paths through real-world projects and automation-first thinking.

---

## Places to Find Me

- [LinkedIn](https://www.linkedin.com/in/ready2assist/)
- [GitHub](https://github.com/Here2ServeU)
- [Medium](https://medium.com/@here2serveyou)

---

## Book a Free Consultation

Ready to adopt GitOps or scale your Kubernetes infrastructure?  
[Schedule a free 1:1 consultation](https://bit.ly/letus-meet)

