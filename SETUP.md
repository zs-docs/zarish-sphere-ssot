# Setup & Installation Guide - Zarish Sphere SSOT

**Last Updated:** February 9, 2026
**Version:** 2.0.0
**Status:** Production Ready

This guide provides step-by-step instructions for setting up and running the Zarish Sphere SSOT platform locally and deploying it to GitHub Pages.

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Pre-Installation Checks](#pre-installation-checks)
3. [Local Installation](#local-installation)
4. [Building & Testing](#building--testing)
5. [Deployment to GitHub Pages](#deployment-to-github-pages)
6. [Troubleshooting](#troubleshooting)
7. [Technology Stack](#technology-stack)

---

## System Requirements

### Minimum Requirements

- **OS:** macOS, Linux, or Windows (WSL2 recommended)
- **Git:** v2.30+
- **Ruby:** 3.2.x LTS (with RubyGems 3.8+)
- **Bundler:** 2.5+
- **Disk Space:** 500MB free
- **RAM:** 2GB minimum

### Recommended Setup (February 2026)

- **macOS:** Monterey or newer with Homebrew
- **Linux:** Ubuntu 22.04 LTS or comparable
- **Windows:** Windows 11 with WSL2 and Ubuntu 22.04
- **Ruby:** 3.2.x LTS (EOL 2027-03-31)
- **Internet:** Stable connection for gem downloads

---

## Pre-Installation Checks

### Quick Pre-Check

Run the automated pre-check script:

```bash
bash scripts/pre-check.sh
```

This script verifies:
- ✓ Git installation and configuration
- ✓ Ruby and Bundler versions
- ✓ Repository structure and required files
- ✓ FHIR R5 resources present
- ✓ ICD-11 support files
- ✓ All documentation files

### Manual Checks

If the script fails, verify manually:

```bash
# Check Git
git --version  # Should be v2.30+

# Check Ruby
ruby --version  # Should be ruby 3.2.x

# Check Bundler
bundle --version  # Should be 2.5+
```

---

## Local Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/zs-docs/zarish-sphere-ssot.git
cd zarish-sphere-ssot
```

### Step 2: Install Ruby (if not already installed)

#### On macOS (using Homebrew):
```bash
brew install ruby@3.2
echo 'export PATH="/usr/local/opt/ruby@3.2/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
ruby --version  # Verify
```

#### On Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install ruby-full ruby-dev build-essential
ruby --version  # Verify Ruby 3.2+
```

#### On Windows (WSL2):
```bash
sudo apt-get install ruby-full ruby-dev build-essential
ruby --version
```

### Step 3: Install Bundler

```bash
gem install bundler
bundle --version  # Verify
```

### Step 4: Install Ruby Dependencies

```bash
# Install gems from Gemfile
bundle install

# Verify with:
bundle list
```

This installs:
- Jekyll 4.3.3 (static site generator)
- jekyll-feed, jekyll-seo-tag, jekyll-sitemap (plugins)
- minima (theme)
- webrick (web server)

---

## Building & Testing

### Build the Site Locally

```bash
bundle exec jekyll build
```

Output: Generated static files in `_site/` directory

### Run Development Server

```bash
bundle exec jekyll serve
```

Then visit: **http://localhost:4000**

Features:
- Live reload (auto-refresh on file changes)
- Full site preview
- ~270+ pages generated from 190+ source files

### Validate Before Deployment

```bash
bash scripts/validate.sh
```

Checks:
- ✓ JSON files are valid
- ✓ Documentation complete
- ✓ FHIR profiles and examples present
- ✓ Value sets defined
- ✓ ICD-11 resources available
- ✓ No circular symlinks

---

## Deployment to GitHub Pages

### Automatic Deployment (Recommended)

1. **Commit and push to main branch:**

```bash
git add .
git commit -m "feat: Update FHIR R5, ICD-11, and latest tech stack - Feb 2026"
git push origin main
```

2. **GitHub Actions will automatically:**
   - Validate repository structure
   - Build Jekyll site
   - Deploy to GitHub Pages
   - Site live in ~2 minutes

3. **Verify deployment:**
   - Check GitHub repo > Settings > Pages
   - Site URL: https://zs-docs.github.io/zarish-sphere-ssot
   - Workflow status: github.com/zs-docs/zarish-sphere-ssot/actions

### Manual Deployment

If needed for testing:

```bash
# Build site
bundle exec jekyll build --baseurl "/zarish-sphere-ssot"

# Site is now in _site/ folder
# Deploy via FTP, S3, or other hosting
```

---

## File Structure

```
zarish-sphere-ssot/
├── .github/
│   └── workflows/deploy.yml        # CI/CD pipeline (GitHub Actions)
├── fhir/                           # FHIR R5 resources
│   ├── profiles/                   # StructureDefinition profiles (7 files)
│   ├── examples/                   # Example instances (5 files)
│   ├── valuesets/                  # Value sets (2 files)
│   ├── codesystems/                # Code systems (1 file)
│   ├── ICD11-Mappings.json         # ICD-11 to FHIR mappings
│   └── README.md
├── docs/                           # Documentation (12 sections)
├── health/                         # Health modules (22 modules)
├── forms/                          # Forms and schemas (33 forms)
├── countries/                      # Country deployments (5 countries)
├── scripts/
│   ├── pre-check.sh                # Pre-installation validation
│   └── validate.sh                 # Repository validation
├── _config.yml                     # Jekyll configuration
├── Gemfile                         # Ruby dependencies
├── package.json                    # Project metadata
└── README.md                       # Main documentation
```

---

## Technology Stack (February 2026)

### Core Platform
| Component | Version | Status | Purpose |
|-----------|---------|--------|---------|
| Jekyll | 4.3.3 | Production Ready | Static site generator |
| Ruby | 3.2.x | LTS (EOL 2027-03) | Server-side runtime |
| Bundler | 2.5+ | Latest Stable | Dependency manager |

### Healthcare Standards
| Standard | Version | Coverage | Purpose |
|----------|---------|----------|---------|
| FHIR | R5 (RI 2024-04) | 7 resource types | Healthcare interoperability |
| ICD-11 | MMS Master Edition | 7+ primary codes | Global disease classification |
| ICD-10 | CM (Current) | Full coverage | Legacy/US compatibility |
| SNOMED CT | Intl. Ed. (Mar 2025) | 400,000+ concepts | Clinical terminology |
| LOINC | 2.77 | 110,000+ codes | Lab observations |
| RxNorm | Jan 2026 | 17,000+ drugs | Medication coding |

### Deployment
| Service | Type | Provider |
|---------|------|----------|
| Hosting | Static Site | GitHub Pages |
| CI/CD | Workflow | GitHub Actions |
| Version Control | Repository | GitHub (Git) |

---

## Key Features & Upgrades (February 2026)

### ✓ FHIR R5 Support
- 7 complete StructureDefinition profiles (Patient, Encounter, Observation, Condition, MedicationRequest, Procedure, ServiceRequest)
- 5 working example instances
- Value sets with ICD-10/11/SNOMED bindings
- Compliant with HL7 FHIR R5 standard

### ✓ ICD-11 Implementation
- Complete ICD-11 MMS Code System definition
- 7+ primary condition mappings
- Bidirectional ICD-10/ICD-11 mappings
- Clinical context and guidance for each code
- Support for status modifiers (e.g., QE84.0 for AIDS)

### ✓ 23 Clinical Modules
- HIV Care & Treatment
- Tuberculosis Management
- Diabetes & NCDs (Cardiovascular, Cancer, Mental Health)
- Maternal & Child Health
- Emergency & Surgical Care
- Specialized Services (GBV, MAT, Palliative)
- Diagnostic & Pharmacy
- Support Services (Logistics, Referral, HIS)

### ✓ 33 Standardized Forms
- Patient registration
- Clinical consultation & assessment
- Vital signs & observations
- Laboratory & imaging orders
- Medication management
- Referral & discharge

### ✓ 5 Country Deployments
- Bangladesh (95 facilities, 816K patients)
- India (Pilot programs)
- Myanmar (Humanitarian response)
- Pakistan (Public health programs)
- Thailand (Migrant health)

---

## Troubleshooting

### Issue: Ruby not found

**Solution:**
```bash
# Install Ruby 3.2+
# macOS: brew install ruby@3.2
# Ubuntu: sudo apt-get install ruby-full

# Add to PATH if needed
export PATH="/usr/local/opt/ruby@3.2/bin:$PATH"
```

### Issue: Bundler fails to install gems

**Solution:**
```bash
# Clear bundler cache
bundle clean --force

# Reinstall
bundle install --verbose
```

### Issue: Jekyll build fails

**Solution:**
```bash
# Clean and rebuild
bundle exec jekyll clean
bundle exec jekyll build --verbose
```

### Issue: GitHub Actions deployment fails

1. Check workflow status: https://github.com/zs-docs/zarish-sphere-ssot/actions
2. View error logs in failing workflow run
3. Common fixes:
   - Ensure main branch is up-to-date
   - Check if repository has GitHub Pages enabled
   - Verify GITHUB_TOKEN permissions (Settings > Actions > General)

### Issue: Site only shows README.md on GitHub Pages

**Solution:**
- Run validation: `bash scripts/validate.sh`
- Check `_config.yml` has correct settings
- Rebuild locally: `bundle exec jekyll clean && bundle exec jekyll build`
- Push again: `git push origin main`

---

## Maintenance & Updates

### Monthly Tasks
- `bundle update` - Update gems to latest versions
- Monitor FHIR, ICD-11, SNOMED updates
- Review GitHub Actions logs for failures

### Version Updates
- Jekyll: Currently 4.3.3 (check for 4.4+)
- Ruby: Currently 3.2.x (plan for 3.3+ in 2026-2027)
- Healthcare standards: Reviewed quarterly

### Security
- Enable GitHub branch protection rules
- Require PR reviews before merge
- Run validation on all PR commits
- Monitor dependencies with Dependabot

---

## Getting Help

### Documentation
- FHIR R5 Guide: [/docs/06-fhir/](./docs/06-fhir/)
- Health Modules: [/docs/03-health-modules/](./docs/03-health-modules/)
- Architecture: [/docs/02-architecture/](./docs/02-architecture/)

### Support
- Issues: https://github.com/zs-docs/zarish-sphere-ssot/issues
- FHIR Community: https://www.hl7.org/about/fhir-community
- ICD-11: https://icd.who.int/

---

## License

MIT License - See [LICENSE](./LICENSE) for details

---

**Last Updated:** February 9, 2026
**Next Review:** May 2026
