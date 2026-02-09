# Clinical Forms Library

Standardized FHIR Questionnaire and custom Zarish forms for all clinical, laboratory, and operational modules in the Zarish Sphere healthcare platform.

## Overview

- **Total Forms**: 41
- **Clinical Forms**: 31
- **Laboratory Forms**: 3
- **Operational Forms**: 7
- **Standard**: FHIR R5 (HL7 2024-04) & Custom Zarish Format
- **Domain**: https://docs.zarishsphere.com/fhir/

## Form Categories

### 🏥 Clinical Forms (31 total)

**HIV Care (3 forms)**
- HIV Testing & Counseling (HIV-TC-001)
- HIV Testing & Counseling (Legacy) (HIV-TCL-001)
- HIV Enrollment (HIV-ENROLL-001)

**Maternal & Child Health (7 forms)**
- ANC First Visit (ANC-FV-001)
- ANC Enrollment (ANC-ENROLL-001)
- Delivery Care (DEL-001)
- MAT Intake (MAT-INT-001)
- MAT Delivery (MAT-DEL-001)

**Tuberculosis (1 form)**
- TB Enrollment (TB-ENROLL-001)

**Cardiovascular Care (5 forms)**
- CVD Risk Assessment (CVD-RISK-001)
- CVD Risk Estimate (CVD-EST-001)
- CVD Lifestyle Counseling (CVD-LIFE-001)
- CVD Referral Criteria (CVD-REF-001)
- CVD Treatment Protocol (CVD-TX-001)

**Noncommunicable Diseases (3 forms)**
- Diabetes Diagnosis (DIA-DX-001)
- Hypertension Diagnosis (HTN-DX-001)
- NCD Screening (NCD-SCR-001)

**Mental Health (2 forms)**
- Mental Health Assessment (MH-001)
- Mental Health Assessment (Comprehensive) (MH-COMP-001)

**Gender-Based Violence (2 forms)**
- GBV Screening (GBV-001)
- GBV Screening (Comprehensive) (GBV-COMP-001)

**Emergency & Inpatient Care (6 forms)**
- Triage (TRIAGE-001)
- Triage (Comprehensive) (TRIAGE-COMP-001)
- Triage Vitals (TRIAGE-VIT-001)
- IPD Admission (IPD-ADM-001)
- Severe Hypertension (HTN-SEV-001)

**General Clinical Services (6 forms)**
- General Consultation (GEN-CONS-001)
- Clinical Consultation (CLIN-CONS-001)
- Household Visit (HH-VISIT-001)
- Nursing Observation (NURS-001)
- Vital Signs (VS-001)

### 🔬 Laboratory Forms (3 total)
- Lab Order (LAB-ORD-001) → ServiceRequest
- Lab Order (Comprehensive) (LAB-COMP-001) → ServiceRequest
- Lab Results (LAB-RES-001) → DiagnosticReport

### 📋 Operational Forms (7 total)
- Patient Registration (REG-001) → Patient
- Referral (REF-001) → ServiceRequest
- Prescription (PRESC-001) → MedicationRequest
- Prescription (Comprehensive) (PRESC-COMP-001) → MedicationRequest
- Dispensing (DISP-001) → MedicationDispense
- Discharge Summary (DIS-001) → Encounter
- Discharge Summary (Comprehensive) (DIS-COMP-001) → Encounter

## Schema Locations

All form schemas are stored in: [`schemas/json/`](schemas/json/)

### Form Format Overview

**Format 1: FHIR Questionnaire (HL7 R5 Standard)**
- 40 forms using `resourceType: "Questionnaire"`
- URL namespace: `https://docs.zarishsphere.com/fhir/Questionnaire/`
- Naming convention: `zs-form-*.json`
- Extensions: Clinical domain, form category, service levels, validation logic
- Used for: Standardized healthcare interoperability

**Format 2: Custom Zarish Format (Domain-Specific)**
- 1 form (HIV-TC-001 original) with custom structure
- Custom fields: `formId`, `formName`, `sections`, `fieldId`
- Used for: Legacy support and alternative workflows

## FHIR Configuration

All forms are configured per FHIR Questionnaire R5 standard:
- **Publisher**: Zarish Sphere
- **Version**: 2.0.0
- **Date**: 2026-02-09
- **Status**: active

Example FHIR Structure:
```json
{
  "resourceType": "Questionnaire",
  "id": "zs-form-hiv-enrollment",
  "url": "https://docs.zarishsphere.com/fhir/Questionnaire/zs-form-hiv-enrollment",
  "version": "2.0.0",
  "name": "HIV Enrollment",
  "title": "HIV Enrollment Form",
  "status": "active",
  "date": "2026-02-09",
  "publisher": "Zarish Sphere",
  "item": [
    {
      "linkId": "section-demographics",
      "type": "group",
      "text": "Patient Demographics",
      "item": [...]
    }
  ]
}
```

## Comprehensive List

See [FORMS-MANIFEST.json](FORMS-MANIFEST.json) for complete metadata including:
- Form IDs and names
- Module associations
- FHIR profile mappings
- Filenames and categories

## Form Structure

Each form follows this JSON schema structure (FHIR Questionnaire):
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
