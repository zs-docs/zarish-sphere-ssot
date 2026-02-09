# Contributing to Zarish Sphere SSOT

Thank you for your interest in contributing to Zarish Sphere SSOT! This document provides guidelines for contributing to the project.

## How to Contribute

### 1. Fork the Repository

Click the "Fork" button at the top right of the repository page.

### 2. Clone Your Fork

```bash
git clone https://github.com/YOUR-USERNAME/zarish-sphere-ssot.git
cd zarish-sphere-ssot
```

### 3. Create a Branch

```bash
git checkout -b feature/your-feature-name
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Test additions/changes

### 4. Make Your Changes

- Follow existing code style and documentation format
- Write clear, descriptive commit messages
- Test your changes locally
- Update documentation as needed

### 5. Commit Your Changes

```bash
git add -A
git commit -m "feat: Add new feature description"
```

Commit message format:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation only
- `style:` - Formatting changes
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

### 6. Push to Your Fork

```bash
git push origin feature/your-feature-name
```

### 7. Create a Pull Request

1. Go to the original repository
2. Click "New Pull Request"
3. Select your fork and branch
4. Provide a clear description of your changes
5. Link any related issues

## Contribution Guidelines

### Documentation

- Use Markdown for all documentation
- Follow existing structure and formatting
- Include examples where helpful
- Keep language clear and concise
- Update table of contents and indexes

### Code

- Follow existing code style
- Comment complex logic
- Write meaningful variable/function names
- Include error handling
- Add tests for new features

### Health Modules

- Follow WHO and national guidelines
- Include references and sources
- Use standard terminology (ICD-10, SNOMED)
- Provide clinical workflows
- Include quality indicators

### Forms

- Use JSON Schema format
- Include validation rules
- Provide field descriptions
- Test with sample data
- Document in forms library

### FHIR Resources

- Follow FHIR R4 specification
- Include all required elements
- Provide examples
- Document extensions
- Validate against FHIR validator

## Testing

### Local Testing

```bash
# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# Visit http://localhost:4000/zarish-sphere-ssot
```

### Validation

- Check all links work
- Verify formatting renders correctly
- Test on different browsers
- Validate FHIR resources
- Test form schemas

## Code Review

All contributions go through code review:

- Maintainers review all pull requests
- Address review comments promptly
- Be open to feedback and suggestions
- Make requested changes
- Re-request review after updates

## Community

- Be respectful and inclusive
- Help others learn and contribute
- Share knowledge and expertise
- Report issues constructively
- Suggest improvements positively

## Recognition

Contributors are recognized in:
- GitHub contributors page
- Project documentation
- Release notes

## Questions?

- Open an [issue](https://github.com/zs-docs/zarish-sphere-ssot/issues)
- Start a [discussion](https://github.com/zs-docs/zarish-sphere-ssot/discussions)
- Email: support@zarishsphere.org

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

Thank you for contributing to Zarish Sphere SSOT!
