![GitHub Workflow Status](https://github.com/jbcolin-91/ci-cd-aws-demo/actions/workflows/ci.yml/badge.svg)
![GitHub Workflow Status](https://github.com/jbcolin-91/ci-cd-aws-demo/actions/workflows/deploy.yml/badge.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

## 🌐 Overview

This repository showcases a **DevOps CI/CD pipeline** for a sample Node.js web service.
The pipeline automatically builds, tests, packages, and (optionally) deploys the app using Docker and Terraform.

**Key Highlights**
- Node.js app built with Express and Jest
- Containerized using Docker
- Continuous Integration with GitHub Actions
- Continuous Deployment triggered only on successful builds
- Final Deployment blocked until manual validation
- Infrastructure as Code managed by Terraform
- Compatible with AWS ECS (future step)

## 🏗️ Architecture

```mermaid
flowchart LR
    A[Git Push] --> B[CI Workflow: build & test]
    B --> C[Docker image built & pushed]
    C --> D[Deploy Workflow: Terraform plan/apply]
    D --> E[Infrastructure ready (e.g., ECS)]
    E --> F[App accessible at endpoint]

## ⚙️ CI/CD Workflow Summary

### 🧪 CI – Continuous Integration (`ci.yml`)
- Triggers on each push or PR.
- Steps:
  1. Checkout code
  2. Install dependencies
  3. Run Jest tests
  4. Lint Terraform (`tflint`, `tfsec`)
  5. Upload artifacts (test results, plan files)

### 🚀 Deploy – Continuous Deployment (`deploy.yml`)
- Triggered after a successful CI run on `main`
- Steps:
  1. Build and push Docker image
  2. Run Terraform `plan`
  3. Manual approval
  4. Terraform `apply`
  5. Health check the deployed container

## 🧰 Local Testing with `act`

You can run the full workflow locally using [act](https://github.com/nektos/act):

```bash
brew install act
act workflow_dispatch -W .github/workflows/deploy.yml -v


---

### 8️⃣ Deployment (future or optional section)

```markdown
## ☁️ Deployment (AWS)

Future versions will provision:
- AWS ECS (Fargate)
- AWS ECR for Docker image storage
- S3 bucket for static assets
- CloudWatch for logging and metrics

## 🛠️ Tech Stack

| Category | Tools |
|-----------|--------|
| Language | Node.js, Express |
| CI/CD | GitHub Actions |
| IaC | Terraform |
| Container | Docker |
| Testing | Jest, Supertest |
| Security | tfsec |
| Local Runner | act |

## 👤 Author

**Julian Colin**
DevOps / Site Reliability Engineer
📍 Singapore | 🌏 France
💼 [LinkedIn](https://www.linkedin.com/in/julian-colin-1a1857a9/)

