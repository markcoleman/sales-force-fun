# GitHub Actions Workflows

This directory contains GitHub Actions workflows for the Salesforce project. These workflows provide continuous integration, deployment, and code quality checks.

## Workflows Overview

### 1. CI (`ci.yml`)

**Triggers:** Push to main/develop, Pull requests to main/develop

**Jobs:**

- **lint-and-test**: Runs ESLint, Prettier checks, and LWC unit tests with coverage
- **security-scan**: Performs npm audit and CodeQL analysis

### 2. Salesforce CI (`salesforce-ci.yml`)

**Triggers:** Push to main/develop, Pull requests to main/develop

**Jobs:**

- **salesforce-validate**: Creates scratch org, deploys source, and runs Apex tests

### 3. Deploy to Production (`deploy-production.yml`)

**Triggers:** Push to main, version tags, manual workflow dispatch

**Jobs:**

- **deploy**: Deploys to production/staging with comprehensive testing

### 4. Code Quality (`code-quality.yml`)

**Triggers:** Push to main/develop, Pull requests, Weekly schedule

**Jobs:**

- **code-quality**: Runs Prettier, ESLint, PMD analysis, and dependency checks
- **sonarcloud**: Performs SonarCloud analysis with test coverage

### 5. Auto Format (`auto-format.yml`)

**Triggers:** Pull request open/sync (only for same repo)

**Jobs:**

- **format**: Auto-formats code with Prettier and commits changes

## Required Secrets

### For Salesforce CI/CD:

- `SALESFORCE_JWT_KEY`: Private key for JWT authentication (Dev Hub)
- `SALESFORCE_CLIENT_ID`: Connected App Client ID (Dev Hub)
- `SALESFORCE_USERNAME`: Username for Dev Hub org
- `SALESFORCE_INSTANCE_URL`: Salesforce instance URL (optional, defaults to login.salesforce.com)

### For Production Deployment:

- `PROD_SALESFORCE_JWT_KEY`: Private key for production org
- `PROD_SALESFORCE_CLIENT_ID`: Connected App Client ID for production
- `PROD_SALESFORCE_USERNAME`: Username for production org
- `PROD_SALESFORCE_INSTANCE_URL`: Production instance URL (optional)

### For Code Quality:

- `CODECOV_TOKEN`: CodeCov token for test coverage reports (optional)
- `SONAR_TOKEN`: SonarCloud token for code analysis (optional)

## Setup Instructions

### 1. Salesforce Connected App Setup

1. Create a Connected App in your Salesforce org
2. Enable OAuth settings and JWT Bearer flow
3. Generate a private key and certificate
4. Add the certificate to the Connected App
5. Store the private key as a GitHub secret

### 2. Dev Hub Configuration

1. Enable Dev Hub in your Salesforce org
2. Ensure the connected app has appropriate permissions
3. Configure scratch org definition in `config/project-scratch-def.json`

### 3. Optional Services Setup

1. **CodeCov**: Sign up at codecov.io and get your token
2. **SonarCloud**: Sign up at sonarcloud.io and configure your project

## Workflow Features

- ✅ **Parallel execution** for faster CI/CD
- ✅ **Caching** for Node.js dependencies
- ✅ **Security scanning** with CodeQL and npm audit
- ✅ **Code quality** with ESLint, Prettier, and PMD
- ✅ **Test coverage** reporting
- ✅ **Scratch org testing** for Salesforce validation
- ✅ **Auto-formatting** for consistent code style
- ✅ **Manual deployment** with environment selection
- ✅ **Artifact retention** for debugging

## Best Practices

1. **Branch Protection**: Set up branch protection rules requiring CI checks
2. **Environment Protection**: Use GitHub environments for production deployments
3. **Secret Management**: Rotate secrets regularly and use least privilege
4. **Monitoring**: Review workflow runs and set up notifications for failures
