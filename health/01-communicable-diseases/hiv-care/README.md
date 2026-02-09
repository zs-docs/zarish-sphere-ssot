# HIV Care & Treatment Module

Comprehensive HIV prevention, testing, treatment, and care services following WHO guidelines.

## Overview

**Status:** Active  
**Version:** 2.0  
**Last Updated:** February 2026  
**Standards:** WHO Consolidated Guidelines on HIV

## Module Components

### 1. Clinical Protocols
- HIV testing & counseling
- ART initiation (Test & Treat)
- Treatment monitoring
- Viral load suppression
- Opportunistic infection management
- PMTCT services

### 2. Clinical Workflows
- New patient enrollment
- ART initiation workflow
- Follow-up visit schedule
- Viral load monitoring
- Treatment failure management
- Lost-to-follow-up tracking

### 3. Data Collection Forms
1. HIV Testing & Counseling Form
2. ART Initiation Form
3. ART Follow-up Form
4. Viral Load Request Form
5. TB Screening Form
6. PMTCT Enrollment Form
7. Partner Notification Form
8. Adherence Counseling Form

### 4. FHIR Profiles
- HIV Patient
- HIV Encounter
- HIV Condition
- HIV Medication (ARV)
- HIV Observation (CD4, VL)
- HIV Procedure (Testing)
- HIV Immunization
- HIV CarePlan
- HIV ServiceRequest
- HIV DiagnosticReport

### 5. Performance Indicators
- Percentage on ART
- Viral suppression rate
- Retention in care (12 months)
- TB screening rate
- PMTCT coverage
- Partner testing rate

### 6. Training Materials
- Clinical protocols handbook
- Job aids for providers
- Patient education materials
- Adherence counseling guides

## Key Features

### Test & Treat Approach
All HIV-positive individuals eligible for immediate ART initiation.

### Viral Load Monitoring
- Baseline VL at ART initiation
- VL at 6 months
- VL annually if suppressed
- VL for suspected treatment failure

### Integration Points
- TB screening at every visit
- STI screening
- Family planning
- Cervical cancer screening
- Mental health screening

## FHIR Implementation

### ARV Medication Example
```json
{
  "resourceType": "Medication",
  "id": "arv-tdf-3tc-efv",
  "code": {
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "429707008",
      "display": "TDF/3TC/EFV combination"
    }]
  },
  "form": {
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "385055001",
      "display": "Tablet"
    }]
  }
}
```

## Clinical Decision Support

### ART Regimen Selection
1. **First-line:** TDF/3TC/EFV or TDF/3TC/DTG
2. **Second-line:** AZT/3TC/ATV/r or AZT/3TC/DTG
3. **Third-line:** Consult specialist

### Treatment Failure Criteria
- Viral load >1000 copies/mL on two consecutive tests
- CD4 decline
- Clinical deterioration
- New opportunistic infections

## Quality Standards

- 90% on ART by 3 months of diagnosis
- 90% viral suppression at 12 months
- 90% retention in care at 12 months
- TB screening at every clinical visit

---

**Module Owner:** Clinical Programs Team  
**Technical Lead:** FHIR Integration Team  
**Review Cycle:** Quarterly
