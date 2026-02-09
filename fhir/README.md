# FHIR Resources

FHIR R4 resource definitions and profiles for Zarish Sphere SSOT.

## Structure

```
fhir/
├── resources/        # FHIR resource definitions
├── profiles/         # Custom profiles
├── extensions/       # Custom extensions
├── valuesets/        # Value sets
└── codesystems/      # Code systems
```

## Key Resources

- **Patient**: Patient demographics and registration
- **Encounter**: Clinical encounters and visits
- **Observation**: Vital signs, lab results, assessments
- **Condition**: Diagnoses and health conditions
- **MedicationRequest**: Prescriptions and medication orders
- **Procedure**: Clinical procedures and interventions
- **ServiceRequest**: Service orders and referrals

## Standards Compliance

- **FHIR R4**: Latest stable FHIR version
- **ICD-10**: Disease and diagnosis coding
- **SNOMED CT**: Clinical terminology
- **LOINC**: Laboratory observations
- **RxNorm**: Medication coding

## Canonical Source

All FHIR resources are also defined in `/domain/json/`

## Documentation

See [/docs/06-fhir/](../docs/06-fhir/) for FHIR implementation guide.
