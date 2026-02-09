# FHIR Resources (R5)

FHIR R5 resource definitions and profiles for Zarish Sphere SSOT with full ICD-11 and ICD-10 support.

## Structure

```
fhir/
├── profiles/                    # FHIR R5 StructureDefinition profiles
│   ├── Patient.R5.json
│   ├── Encounter.R5.json
│   ├── Observation.R5.json
│   ├── Condition.R5.json
│   ├── MedicationRequest.R5.json
│   ├── Procedure.R5.json
│   └── ServiceRequest.R5.json
├── examples/                    # FHIR R5 example instances
│   ├── Patient-example-1.R5.json
│   ├── Encounter-example-1.R5.json
│   ├── Condition-HIV-example.R5.json
│   ├── Observation-CD4-example.R5.json
│   └── MedicationRequest-ART-example.R5.json
├── valuesets/                   # HL7 value sets with Zarish coding systems
│   ├── DiagnosisCodes.R5.json
│   └── MedicationCodes.R5.json
├── codesystems/                 # Custom code systems
│   └── ICD11-CodeSystem.R5.json
├── ICD11-Mappings.json          # ICD-11 to FHIR R5 code mappings
└── README.md                    # This file
```

## Key Profiles (FHIR R5)

- **Patient**: Patient demographics and registration
- **Encounter**: Clinical encounters and visits
- **Observation**: Vital signs, lab results, assessments
- **Condition**: Diagnoses with ICD-11 and ICD-10 support
- **MedicationRequest**: Prescriptions and medication orders
- **Procedure**: Clinical procedures and interventions
- **ServiceRequest**: Service orders and referrals

## Standards & Coding Systems (February 2026)

### FHIR Version
- **FHIR R5**: Latest stable version (RI Release 2024-04)

### Disease Classification
- **ICD-11 MMS**: WHO Master Edition - Global standard with 7+ levels of granularity
- **ICD-10 CM**: US clinical modifications - Legacy system compatibility

### Clinical Terminology
- **SNOMED CT**: International Edition (March 2025 release) - Over 400,000 clinical concepts
- **LOINC**: Version 2.77 - 110,000+ lab and clinical observation codes
- **RxNorm**: January 2026 release - 17,000+ medication concepts

### Value Sets
For each diagnosis code, the platform supports:
- ICD-10 CM codes
- ICD-11 MMS codes
- SNOMED CT equivalents
- Extensible binding for local codes

## ICD-11 Implementation

The platform includes:
- **ICD-11 Mapping Document**: Maps 7+ common conditions with ICD-10/ICD-11/SNOMED CT equivalents
- **ICD-11 Code System**: Definition with display names and designations
- **ICD-11 Examples**: Real-world clinical examples using ICD-11 codes
- **HIV Disease**: QE84 with status modifiers (QE84.0 AIDS, QE84.1 HIV no AIDS)
- **Tuberculosis**: CA90 respiratory with local context
- **Non-Communicable Diseases**: Diabetes (5A11.0), Hypertension (BA00), Cancer (CA93)
- **Mental Health**: Depression (6A70.1) with disorder classifications
- **Maternal Health**: Pregnancy (QH84.0) with care stages

## Documentation

See [/docs/06-fhir/](../docs/06-fhir/) for FHIR R5 implementation guide.
