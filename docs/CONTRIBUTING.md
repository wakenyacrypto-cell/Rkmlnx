# Contributing to Rkmlnx

Thank you for your interest in contributing to Rkmlnx! This document provides guidelines for contributing.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Respect intellectual property rights
- Follow the GPL-3.0 license terms

## Getting Started

1. Fork the repository
2. Clone your fork locally
3. Create a feature branch
4. Make your changes
5. Submit a pull request

## Development Workflow

### Creating a Feature Branch
```bash
git checkout -b feature/your-feature-name
```

### Commit Messages
- Use clear, descriptive commit messages
- Reference issues where applicable
- Follow conventional commits format: `type(scope): description`

Examples:
```
feat(kernel): add new driver support
fix(drivers): resolve memory leak in GPU driver
docs(bootloader): update UEFI documentation
```

### Code Style

- Follow Linux kernel coding standards
- Use consistent indentation (4 spaces or tabs)
- Comment complex code sections
- Run linting tools before committing

### Testing

- Test your changes thoroughly
- Build all affected components
- Run existing test suites
- Document any new test cases

### Pull Request Process

1. Ensure your fork is up to date with main
2. Push your feature branch to your fork
3. Create a pull request with a clear description
4. Link related issues
5. Wait for review and address feedback
6. Once approved, maintainers will merge

## Contribution Areas

We welcome contributions in:
- **Kernel**: patches, optimizations, new features
- **Drivers**: new hardware support, bug fixes
- **Userland**: new utilities, improvements
- **Documentation**: guides, API docs, examples
- **Testing**: test cases, quality assurance
- **Translation**: localization to other languages

## Reporting Issues

When reporting issues:
1. Use descriptive titles
2. Provide reproducible steps
3. Include system information
4. Attach error logs or screenshots
5. Mention your Rkmlnx version

## Licensing

All contributions must be compatible with the GPL-3.0 license. By submitting code, you agree to license it under GPL-3.0.

## Questions?

Open a discussion or issue if you have questions about the contribution process.

