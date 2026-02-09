# 🏥 Zarish Sphere SSOT

> Healthcare Documentation Platform - Single Source of Truth for Clinical Modules, Forms, and Operations

[![Deploy to GitHub Pages](https://github.com/zs-docs/zarish-sphere-ssot/actions/workflows/deploy.yml/badge.svg)](https://github.com/zs-docs/zarish-sphere-ssot/actions/workflows/deploy.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Live Documentation:** [https://zs-docs.github.io/zarish-sphere-ssot](https://zs-docs.github.io/zarish-sphere-ssot)

---

## 📖 Overview

Zarish Sphere SSOT is a comprehensive healthcare documentation and module management platform designed for:

- 🏥 **Low-resource healthcare settings**
- 🌍 **Humanitarian and emergency contexts**
- 🏛️ **Government health systems**
- 📊 **Donor accountability and transparency**
- ⚕️ **Clinical excellence in challenging environments**

---

## 🎯 Key Features

### 📚 Comprehensive Health Modules
- **22 Clinical Modules** organized into 7 groups
- Complete coverage from communicable to specialized care
- Standardized workflows and protocols

### 📝 Standardized Forms
- **33 Clinical & Operational Forms**
- JSON schema-based definitions
- FHIR R5 compatible

### 🌍 Multi-Country Support
- Active deployments: Bangladesh, India, Myanmar, Pakistan, Thailand
- Localized configurations
- Country-specific adaptations

### 🔧 Technical Excellence
- FHIR R5 integration (HL7 2024-04)
- ICD-11 MMS primary with ICD-10 compatibility
- SNOMED CT, LOINC, RxNorm standards
- No-code platform with visual workflows
- Automated deployment via GitHub Actions

---

## 📂 Repository Structure

```
zarish-sphere-ssot/
├── .github/
│   ├── workflows/          # Automated deployment
│   └── scripts/            # Build & deployment scripts
├── assets/                 # CSS, JS, images, diagrams
├── docs/                   # Platform documentation (11 sections)
├── health/                 # 22 health modules (7 groups)
├── operations/             # Operational modules
├── forms/                  # 33 form schemas
├── countries/              # 5 country configurations
├── fhir/                   # FHIR profiles & resources
├── glossary/               # Medical & technical terminology
├── vision/                 # Strategic documents
├── _config.yml             # Jekyll configuration
├── index.md                # Site homepage
└── README.md               # This file
```

---

## 🏥 Health Module Groups

1. **Communicable Diseases**
   - HIV Care & Treatment
   - TB Management
   - Infectious Diseases

2. **Non-Communicable Diseases**
   - Diabetes Management
   - Cardiovascular Disease
   - Cancer Care
   - Mental Health

3. **Maternal & Child Health**
   - Antenatal Care (ANC)
   - Postnatal Care (PNC)
   - Child Health & Nutrition

4. **Emergency & Surgery**
   - Trauma & Emergency Care
   - Essential Surgical Care

5. **Specialized Services**
   - Gender-Based Violence (GBV)
   - Medication-Assisted Treatment (MAT)
   - Palliative Care

6. **Diagnostic & Pharmacy**
   - Laboratory Services
   - Pharmacy & Drug Management

7. **Support Services**
   - Logistics & Supply Chain
   - Referral Systems

---

## 🌍 Country Deployments

| Country | Status | Population Served | Key Features |
|---------|--------|-------------------|--------------|
| 🇧🇩 Bangladesh | Active | 170M | Rohingya response, maternal health |
| 🇮🇳 India | Active | 1.4B | TB program, diabetes management |
| 🇲🇲 Myanmar | Active | 54M | Conflict zones, emergency care |
| 🇵🇰 Pakistan | Active | 230M | Polio eradication, maternal health |
| 🇹🇭 Thailand | Active | 70M | Migrant health, TB/HIV |

---

## 🚀 Quick Start

### For Users (View Documentation)

1. Visit the live site: [https://zs-docs.github.io/zarish-sphere-ssot](https://zs-docs.github.io/zarish-sphere-ssot)
2. Browse health modules, forms, and country configurations
3. Search the glossary for medical terminology

### For Contributors (Local Development)

See **[SETUP.md](SETUP.md)** for comprehensive installation guide.

Quick start (requires Ruby 3.2+):

```bash
# Clone and setup
git clone https://github.com/zs-docs/zarish-sphere-ssot.git
cd zarish-sphere-ssot

# Pre-check system requirements
bash scripts/pre-check.sh

# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# Visit http://localhost:4000/zarish-sphere-ssot
```

---

## 📦 Deployment

This repository uses automated deployment via GitHub Actions. Every push to `main` triggers:

1. **Validation** - Checks for circular symlinks and required files
2. **Build** - Compiles Jekyll site with all 270+ pages
3. **Deploy** - Publishes to GitHub Pages
4. **Verification** - Validates successful deployment

**Timeline:** ~2 minutes from push to live

---

## 🛠️ Technology Stack

Full details: **[TECHNOLOGY-STACK.md](TECHNOLOGY-STACK.md)** | Setup Guide: **[SETUP.md](SETUP.md)**

### Core Platform (February 2026 - Production Ready)
- **Jekyll 4.3.3** - Static site generator
- **Ruby 3.2.x LTS** - Server-side runtime (EOL 2027-03-31)
- **GitHub Pages + Actions** - Hosting & CI/CD
- **2-minute deployment** - From push to live

### Healthcare Standards (Latest Stable)
- **FHIR R5** - Healthcare interoperability (HL7 2024-04)
- **ICD-11 MMS** - WHO disease classification (Master Edition)
- **ICD-10 CM** - Legacy US compatibility
- **SNOMED CT** - International Edition (March 2025) - 400,000+ concepts
- **LOINC** - Version 2.77 - 110,000+ lab codes
- **RxNorm** - January 2026 - 17,000+ medications

---

## 📋 Documentation Sections

1. **Index** - Navigation hub
2. **Overview** - Platform introduction
3. **Architecture** - System design
4. **Health Modules** - Clinical documentation
5. **Operations** - Operational guides
6. **Forms** - Data collection tools
7. **FHIR** - Interoperability specs
8. **Countries** - Deployment configs
9. **API** - Integration documentation
10. **No-Code** - Visual workflow tools
11. **Governance** - Policies & standards
12. **Reference** - Additional resources

---

## 🤝 Contributing

We welcome contributions! Here's how:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit (`git commit -m 'Add amazing feature'`)
5. Push (`git push origin feature/amazing-feature`)
6. Open a Pull Request

### Contribution Guidelines

- Follow existing documentation structure
- Use standardized terminology from glossary
- Include FHIR mappings for clinical content
- Test locally before submitting PR
- Update relevant indexes when adding content

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Built for healthcare systems worldwide, with focus on:

- Low-resource settings
- Humanitarian contexts
- Government transparency
- Donor accountability
- Clinical excellence

Special thanks to all contributors and healthcare workers using this platform.

---

## 📞 Support

- **Documentation:** [https://zs-docs.github.io/zarish-sphere-ssot](https://zs-docs.github.io/zarish-sphere-ssot)
- **Issues:** [GitHub Issues](https://github.com/zs-docs/zarish-sphere-ssot/issues)
- **Discussions:** [GitHub Discussions](https://github.com/zs-docs/zarish-sphere-ssot/discussions)
- **Email:** support@zarish-sphere.org

---

**Maintained by:** Zarish Sphere Team  
**Last Updated:** February 2026  
**Status:** ✅ Active Development
