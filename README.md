
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

### Step 1: Install DevStream

```bash
./scripts/install-devstream.sh
```

This script downloads and installs the latest version of the DevStream CLI (`dtm`), the main automation tool used in this project.

### Step 2: Launch a Local Kubernetes Cluster

```bash
kind create cluster --config infra/kind-cluster.yaml
```

This command uses `kind` (Kubernetes in Docker) to create a lightweight, local Kubernetes cluster for testing and learning. It uses the preconfigured `kind-cluster.yaml` to specify node roles.

### Step 3: Bootstrap Toolchain with DevStream

```bash
./scripts/bootstrap.sh
```

This script runs `dtm apply` with `devstream/config.yaml`, which installs and configures:

- GitHub Actions workflows
- Jenkins (via Helm)
- ArgoCD (for GitOps-style deployment)
- Prometheus/Grafana (for observability)

All installations are done declaratively through DevStream plugins and YAML configuration.

## Multi-Environment Setup

You can deploy environment-specific configurations using:

```bash
dtm apply --config envs/dev.yaml
dtm apply --config envs/staging.yaml
dtm apply --config envs/prod.yaml
```

Each environment file overrides default tool settings, such as namespaces, resource limits, or Git repositories. This enables safe testing in Dev, confidence in Staging, and production-grade enforcement in Prod.

### Example (dev.yaml):

```yaml
tools:
  - name: jenkins
    plugin:
      name: jenkins
      version: v0.1.0
    config:
      namespace: dev-tools
      jobPrefix: dev-
```

### Example (prod.yaml):

```yaml
tools:
  - name: jenkins
    plugin:
      name: jenkins
      version: v0.1.0
    config:
      namespace: prod-tools
      jobPrefix: prod-
```

This structure allows you to manage all your environments with consistent tooling and minimal duplication.

## What is `dtm`?

`dtm` is the command-line interface (CLI) for DevStream — short for DevStream Manager. It allows you to manage your DevOps toolchain using declarative YAML files. With `dtm`, you can install, configure, and maintain CI/CD tools, GitOps pipelines, monitoring stacks, and more — all in a consistent and automated way.

### Common Commands

- `dtm init`: Initializes a new DevStream project in your working directory.
- `dtm apply --config config.yaml`: Applies the toolchain setup defined in your YAML configuration file.
- `dtm destroy`: Uninstalls or removes previously deployed tools and configurations.
- `dtm list`: Displays a list of currently active or managed tools in your project.
- `dtm version`: Prints the current version of the DevStream CLI installed on your machine.

### How it is Installed

When you run the provided `install-devstream.sh` script, it downloads and installs the `dtm` binary from the official DevStream repository using a simple shell command:

```bash
curl -fsSL https://raw.githubusercontent.com/devstream-io/devstream/main/install.sh | bash
```

This places the `dtm` executable in your system so you can start managing DevOps tools right away.

### Under the Hood

- DevStream operates with Go-based plugins that are responsible for setting up each DevOps tool.
- State and metadata about installed tools are managed inside a local `.devstream/` directory.
- DevStream is conceptually similar to tools like Terraform or Helm but is focused specifically on automating DevOps toolchains using a unified configuration.

## Cloud Provisioning with Terraform

Under `terraform/modules/` you’ll find:

- `aws-eks/`
- `gcp-gke/`
- `azure-aks/`

To deploy to AWS EKS:

```bash
cd terraform/modules/aws-eks
terraform init
terraform apply
```

Repeat similarly for GCP or Azure.

## GitHub Actions Workflow

This repo includes:

- `.github/workflows/dtm-deploy.yml`: Runs DevStream on main branch push
- `.github/workflows/pr-merge-apply.yml`: Applies toolchain after PR merges

These workflows help automate toolchain management directly from GitHub events.

## Contributing

See `docs/CONTRIBUTING.md`

To add a new plugin:
1. Edit `devstream/config.yaml`
2. Add plugin-specific config in `devstream/plugins/`
3. Test locally with `dtm apply`
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
