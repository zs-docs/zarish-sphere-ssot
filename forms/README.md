# Clinical Forms

Standardized data collection forms for all clinical modules.

## Form Categories

### 1. Clinical Consultation (8 forms)
- General Consultation
- Emergency Triage
- Admission Form
- Discharge Summary

### 2. Domain-Specific (14 forms)
- HIV Testing & Counseling
- ART Initiation & Follow-up
- TB Screening & Treatment
- ANC First Visit & Follow-up
- PNC Assessment
- Child Health Assessment
- GBV Clinical Management
- MAT Enrollment & Monitoring

### 3. Laboratory & Diagnostics (6 forms)
- Lab Request Form
- Lab Results Form
- Radiology Request
- Ultrasound Report

### 4. Operational (5 forms)
- Referral Form
- Patient Registration
- Consent Form
- Feedback Form

## Total Forms: 33

## Schema Location

All form schemas are stored as JSON files in: `schemas/json/`

## Form Structure

Each form follows this JSON schema structure:

```json
{
  "formId": "unique-form-id",
  "formName": "Form Display Name",
  "version": "1.0",
  "status": "active",
  "category": "clinical|laboratory|operational",
  "sections": [
    {
      "sectionId": "section-1",
      "sectionName": "Section Name",
      "fields": [
        {
          "fieldId": "field-1",
          "fieldName": "Field Name",
          "fieldType": "text|number|date|select|checkbox",
          "required": true|false,
          "validation": {},
          "fhirMapping": "FHIR.Resource.element"
        }
      ]
    }
  ]
}
```

## FHIR Integration

All forms are mapped to FHIR R4 resources:
- Patient demographics → Patient
- Clinical observations → Observation
- Diagnoses → Condition
- Medications → MedicationRequest
- Laboratory orders → ServiceRequest
- Results → DiagnosticReport

## Form Manifest

See [FORMS-MANIFEST.json](FORMS-MANIFEST.json) for complete catalog with:
- Form IDs
- Versions
- Status
- Associated modules
- FHIR mappings

---

**Last Updated:** February 2026
