# Domain Models

Domain models and data structures for Zarish Sphere SSOT.

## Structure

```
domain/
├── json/              # JSON definitions
│   ├── forms/        # Form schemas
│   ├── fhir/         # FHIR resources
│   └── models/       # Data models
├── diagrams/          # Domain model diagrams
└── README.md         # This file
```

## Contents

### Forms
JSON Schema definitions for all clinical and operational forms.

### FHIR Resources
FHIR R4 resource definitions and profiles.

### Data Models
Core domain models for:
- Patient management
- Clinical workflows
- Operational processes
- Reporting structures

## Standards

All domain models follow:
- **FHIR R4** - Healthcare interoperability
- **JSON Schema** - Form validation
- **ICD-10** - Disease classification
- **SNOMED CT** - Clinical terminology

## Documentation

See [/docs/](../docs/) for detailed documentation on data models.
