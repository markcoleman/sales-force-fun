# Salesforce DX Project: Next Steps

[![CodeQL](https://github.com/markcoleman/sales-force-fun/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/markcoleman/sales-force-fun/actions/workflows/codeql-analysis.yml)
[![Security Scan](https://github.com/markcoleman/sales-force-fun/actions/workflows/security-scan.yml/badge.svg)](https://github.com/markcoleman/sales-force-fun/actions/workflows/security-scan.yml)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/markcoleman/sales-force-fun/badge)](https://securityscorecards.dev/viewer/?uri=github.com/markcoleman/sales-force-fun)

## 🔒 Security

This repository implements comprehensive security measures including:

- **Automated Security Scanning**: CodeQL analysis, dependency vulnerability scanning
- **Dependabot**: Automated dependency updates with security focus
- **Secret Scanning**: GitHub Advanced Security features enabled
- **Security Policy**: See [SECURITY.md](SECURITY.md) for our security policy and reporting procedures
- **Continuous Monitoring**: Daily security scans and weekly comprehensive analysis

### Security Features

- ✅ CodeQL code analysis
- ✅ Dependency vulnerability alerts
- ✅ Secret scanning and push protection
- ✅ Automated security updates via Dependabot
- ✅ OpenSSF Scorecard monitoring
- ✅ SARIF security reporting

For security concerns, please review our [Security Policy](SECURITY.md).

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

sf deploy metadata --source-dir force-app --target-org mark389@agentforce.com

sf apex run test --target-org mark389@agentforce.com --wait 30
