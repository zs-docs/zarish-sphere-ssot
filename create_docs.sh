#!/bin/bash

# Create README files for all sections

# 01-overview
cat > docs/01-overview/README.md << 'EOF'
# System Overview

## Welcome to Zarish Sphere SSOT

This section provides an introduction to the Zarish Sphere healthcare information system.

## Contents

- [Getting Started](getting-started.md) - Quick start guide
- [System Requirements](requirements.md) - Technical requirements
- [Installation Guide](installation.md) - Installation instructions
- [Configuration Guide](configuration.md) - System configuration
- [User Guide](user-guide.md) - User manual

## What is Zarish Sphere?

Zarish Sphere SSOT is an open-source, FHIR-based healthcare information system designed for:
- Healthcare facilities
- Government health programs
- Humanitarian organizations
- Public health initiatives

## Key Features

- **No-Code Platform**: Visual builders for workflows, forms, and dashboards
- **Standards-Based**: FHIR R4, ICD-10, SNOMED CT, LOINC
- **Comprehensive**: 22 clinical + 7 operational modules
- **Open Source**: MIT licensed
- **Easy Deployment**: Single-push deployment via GitHub Actions

## Quick Start

1. Review [System Requirements](requirements.md)
2. Follow [Installation Guide](installation.md)
3. Complete [Configuration](configuration.md)
4. Read [User Guide](user-guide.md)

## Next Steps

- Explore [Architecture](../02-architecture/)
- Review [Health Modules](../03-health-modules/)
- Check [API Documentation](../08-api/)
EOF

# 02-architecture
cat > docs/02-architecture/README.md << 'EOF'
# System Architecture

## Architecture Documentation

This section describes the technical architecture of Zarish Sphere SSOT.

## Contents

- [System Overview](system-overview.md) - High-level architecture
- [Layered Architecture](layered-architecture.md) - Application layers
- [Data Flow](data-flow.md) - Data flow diagrams
- [Deployment Model](deployment-model.md) - Deployment options
- [Security Model](security-model.md) - Security architecture
- [Integration](integration.md) - System integration

## Architecture Principles

1. **Documentation-Driven**: Documentation as single source of truth
2. **Modular Design**: Loosely coupled, highly cohesive modules
3. **Standards-Based**: FHIR, HL7, ICD-10, SNOMED CT
4. **API-First**: RESTful APIs for all operations
5. **Security by Design**: Zero-trust security model

## System Layers

1. **Presentation Layer**: Web UI, Mobile Apps
2. **Application Layer**: Business logic, workflows
3. **Integration Layer**: FHIR server, APIs
4. **Data Layer**: PostgreSQL, document storage
5. **Infrastructure Layer**: Docker, Kubernetes, cloud

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript
- **Backend**: FHIR Server (HAPI/Azure)
- **Database**: PostgreSQL, SQL Server
- **Deployment**: Docker, Kubernetes
- **CI/CD**: GitHub Actions

## Diagrams

See the [diagrams/](../../assets/diagrams/) directory for:
- System architecture diagrams
- Data flow diagrams
- Deployment diagrams
- Security architecture
EOF

# 03-health-modules
cat > docs/03-health-modules/README.md << 'EOF'
# Health Modules Documentation

## Clinical Health Modules

This section documents all 22 clinical health modules organized into 7 groups.

## Module Groups

### 1. Communicable Diseases
- HIV/AIDS Care & Treatment
- Tuberculosis (TB) Program
- Malaria Control
- Infectious Diseases
- COVID-19 Response

[View Details](../../health/01-communicable-diseases/)

### 2. Non-Communicable Diseases
- Diabetes Management
- Hypertension Control
- Mental Health Services
- Chronic Disease Management

[View Details](../../health/02-noncommunicable-diseases/)

### 3. Maternal & Child Health
- Antenatal Care (ANC)
- Postnatal Care (PNC)
- Immunization
- Nutrition
- Growth Monitoring

[View Details](../../health/03-maternal-child-health/)

### 4. Emergency & Surgery
- Emergency Medicine
- Surgical Services
- Trauma Care

[View Details](../../health/04-emergency-surgery/)

### 5. Specialized Services
- Oncology
- Palliative Care
- Gender-Based Violence (GBV)
- Sexual & Reproductive Health

[View Details](../../health/05-specialized-services/)

### 6. Diagnostic & Pharmacy
- Laboratory Services
- Radiology
- Pharmacy Management

[View Details](../../health/06-diagnostic-pharmacy/)

### 7. Support Services
- Counseling & Psychosocial Support
- Social Work
- Medical Records
- Health Information

[View Details](../../health/07-support-services/)

## Standards & Protocols

All health modules follow:
- **Clinical Guidelines**: WHO, national guidelines
- **FHIR Resources**: Standardized data models
- **ICD-10**: Disease coding
- **SNOMED CT**: Clinical terminology
- **Quality Indicators**: Evidence-based metrics

## Implementation

Each module includes:
- Clinical workflows
- Forms and templates
- FHIR profiles
- Quality indicators
- Training materials
EOF

# Continue creating other sections...
cat > docs/04-operations/README.md << 'EOF'
# Operations Documentation

## Operational Modules

This section covers the 7 operational modules for facility management.

## Modules

### 1. Human Resources
Staff management, scheduling, training, performance management.

### 2. Finance & Budget
Accounting, procurement, donor tracking, budget management.

### 3. Supply Chain
Inventory management, logistics, distribution, stock control.

### 4. Infrastructure
Facility management, maintenance, utilities, space planning.

### 5. Quality & Compliance
Quality assurance, audits, accreditation, compliance.

### 6. Security
Access control, data protection, physical security, incident response.

### 7. ICT
IT infrastructure, system administration, help desk, technical support.

## Related Documentation

- [Architecture](../02-architecture/)
- [API Documentation](../08-api/)
- [Governance](../10-governance/)
EOF

cat > docs/05-forms/README.md << 'EOF'
# Forms Documentation

## Clinical Forms Library

This section documents all clinical and operational forms (33+ forms).

## Form Categories

### Clinical Consultation Forms
- General consultation
- Follow-up visit
- Referral forms

### Domain-Specific Forms
- ANC forms
- HIV care forms
- TB treatment forms
- GBV intake forms
- MAT assessment forms

### Operational Forms
- Triage forms
- Admission forms
- Discharge forms
- Transfer forms

### Laboratory & Diagnostic Forms
- Lab request forms
- Radiology request forms
- Test result forms

## Form Structure

All forms follow JSON Schema format:
- Metadata
- Sections
- Fields
- Validation rules
- Conditional logic

## Form Location

All form schemas: [/forms/schemas/json/](../../forms/schemas/json/)

## Rendering

HTML previews: [.github/pages/forms/](.github/pages/forms/)
EOF

cat > docs/06-fhir/README.md << 'EOF'
# FHIR Documentation

## FHIR Resources & Profiles

This section documents all FHIR R4 resources and profiles used in Zarish Sphere.

## Contents

- FHIR Resources
- Custom Profiles
- Extensions
- Value Sets
- Code Systems
- Implementation Guide

## FHIR Resources

All FHIR resources are defined in: [/domain/json/](../../domain/json/)

## Key Resources

- **Patient**: Patient demographics
- **Encounter**: Clinical encounters
- **Observation**: Vital signs, lab results
- **Condition**: Diagnoses
- **MedicationRequest**: Prescriptions
- **Procedure**: Clinical procedures
- **ServiceRequest**: Service orders

## Custom Profiles

Zarish Sphere defines custom profiles for:
- Country-specific requirements
- Program-specific data elements
- Local terminology
- Workflow requirements

## Standards Compliance

- **FHIR R4**: Latest stable version
- **ICD-10**: Disease coding
- **SNOMED CT**: Clinical terminology
- **LOINC**: Lab observations
- **RxNorm**: Medication coding
EOF

cat > docs/07-countries/README.md << 'EOF'
# Country Configurations

## Country-Specific Documentation

This section provides country-specific configurations and adaptations.

## Active Deployments

### 🇧🇩 Bangladesh
Population: 165 million  
[View Configuration](../../countries/bangladesh/)

### 🇮🇳 India
Population: 1.4 billion  
[View Configuration](../../countries/india/)

### 🇲🇲 Myanmar
Population: 54 million  
[View Configuration](../../countries/myanmar/)

### 🇵🇰 Pakistan
Population: 225 million  
[View Configuration](../../countries/pakistan/)

### 🇹🇭 Thailand
Population: 70 million  
[View Configuration](../../countries/thailand/)

## Configuration Elements

Each country configuration includes:
- National health programs
- Local terminology
- Reporting requirements
- Regulatory compliance
- Language localization
- Cultural adaptations

## Implementation Guide

1. Review base system
2. Select country configuration
3. Customize for local context
4. Test with sample data
5. Deploy and train users
EOF

cat > docs/08-api/README.md << 'EOF'
# API Documentation

## REST API Reference

This section provides complete API documentation for Zarish Sphere SSOT.

## Contents

- API Overview
- Authentication
- Endpoints
- Request/Response Examples
- Error Handling
- Rate Limiting

## API Endpoints

### Patient API
- `GET /api/patients` - List patients
- `POST /api/patients` - Create patient
- `GET /api/patients/{id}` - Get patient
- `PUT /api/patients/{id}` - Update patient
- `DELETE /api/patients/{id}` - Delete patient

### Encounter API
- `GET /api/encounters` - List encounters
- `POST /api/encounters` - Create encounter
- `GET /api/encounters/{id}` - Get encounter

### Observation API
- `GET /api/observations` - List observations
- `POST /api/observations` - Create observation

## Authentication

API uses OAuth 2.0 / JWT tokens:
```
Authorization: Bearer <token>
```

## Base URL

```
https://api.zarishsphere.org/v1
```

## Examples

See [/api/](../../api/) for detailed examples.
EOF

cat > docs/09-no-code/README.md << 'EOF'
# No-Code Platform Documentation

## Visual Platform Guide

This section documents the no-code visual platform for building workflows, forms, and dashboards.

## Platform Components

### 1. Workflow Builder
Drag-and-drop visual workflow designer for clinical pathways.

### 2. Form Designer
Visual form builder with:
- Field types
- Validation rules
- Conditional logic
- Multi-page forms

### 3. Dashboard Creator
Build analytics dashboards with:
- Charts and graphs
- KPI widgets
- Data tables
- Filters

### 4. Report Generator
Create custom reports:
- Report templates
- Data sources
- Scheduling
- Export formats

## Getting Started

1. Access the platform
2. Choose a builder
3. Design your component
4. Test and preview
5. Publish

## Best Practices

- Start with templates
- Test with sample data
- Get user feedback
- Iterate and improve
EOF

cat > docs/10-governance/README.md << 'EOF'
# Governance Documentation

## Policies & Procedures

This section covers governance, policies, and compliance.

## Contents

- Data Governance
- Privacy Policy
- Security Policy
- Quality Standards
- Compliance Requirements
- Standard Operating Procedures

## Data Governance

- Data ownership
- Data quality
- Data lifecycle
- Data security
- Data sharing

## Privacy & Security

- HIPAA compliance
- GDPR compliance
- Local regulations
- Data protection
- Access control

## Quality Standards

- ISO 9001
- WHO standards
- National standards
- Accreditation requirements

## Compliance

- Regulatory compliance
- Audit requirements
- Reporting obligations
- Documentation standards
EOF

cat > docs/11-reference/README.md << 'EOF'
# Reference Documentation

## Additional Resources

This section provides additional resources and references.

## Contents

- Glossary
- Standards & Guidelines
- Best Practices
- External Resources
- Training Materials
- FAQs

## Glossary

See [/glossary/](../../glossary/) for complete terminology reference.

## Standards

- **FHIR**: https://www.hl7.org/fhir/
- **ICD-10**: https://www.who.int/classifications/icd/
- **SNOMED CT**: https://www.snomed.org/
- **LOINC**: https://loinc.org/

## Best Practices

- Clinical guidelines
- Implementation guides
- Technical standards
- Security practices

## Training

- User training materials
- Administrator guides
- Developer documentation
- Video tutorials

## Support

- FAQ
- Troubleshooting
- Contact support
- Community forums
EOF

chmod +x create_docs.sh
./create_docs.sh
echo "Documentation created successfully!"
