# Security Policy

## Supported Versions

We actively support the following versions of this project with security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

We take the security of our Salesforce application seriously. If you discover a security vulnerability, please follow these steps:

### Reporting Process

1. **Do not** create a public GitHub issue for security vulnerabilities
2. Email security concerns to: [markcoleman] (replace with actual contact)
3. Provide detailed information about the vulnerability including:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if available)

### Response Timeline

- **Initial Response**: Within 48 hours of report
- **Status Updates**: Every 72 hours until resolution
- **Resolution Target**: 30 days for critical issues, 90 days for others

### Security Measures

This repository implements several security measures:

#### Automated Security Scanning

- **CodeQL Analysis**: Automated code scanning for security vulnerabilities
- **Dependency Scanning**: Regular dependency vulnerability checks via Dependabot
- **Secret Scanning**: Automated detection of leaked credentials
- **Container Scanning**: Docker image vulnerability assessment (when applicable)

#### Development Security

- **Branch Protection**: Required reviews and status checks
- **Signed Commits**: Encouraged for all contributors
- **Dependency Updates**: Automated via Dependabot
- **Security Audits**: Regular npm/dependency audits

#### Salesforce-Specific Security

- **Apex Security**: PMD static analysis with security rulesets
- **SOQL Injection Prevention**: Parameterized queries and input validation
- **CRUD/FLS Checks**: Field-level and object-level permission validation
- **XSS Prevention**: Output encoding in Lightning Web Components

## Security Best Practices

### For Contributors

1. Keep dependencies up to date
2. Follow secure coding practices
3. Use parameterized queries for SOQL
4. Implement proper input validation
5. Follow principle of least privilege
6. Never commit secrets or credentials

### For Deployment

1. Use separate orgs for dev/staging/production
2. Implement proper CI/CD security gates
3. Regular security testing and code reviews
4. Monitor for security alerts and vulnerabilities
5. Keep Salesforce org security settings current

## Security Features Enabled

- ✅ Dependabot security updates
- ✅ CodeQL code scanning
- ✅ Secret scanning (GitHub Advanced Security)
- ✅ Dependency vulnerability alerts
- ✅ Security policy documentation
- ✅ Automated security testing in CI/CD

## Compliance

This project follows security best practices for:

- Salesforce development security guidelines
- OWASP Top 10 security practices
- GitHub security recommendations
- Industry standard secure coding practices

## Security Contact

For security-related questions or concerns, please contact the repository maintainer through the appropriate secure channels listed above.

---

Last updated: $(date +%Y-%m-%d)
