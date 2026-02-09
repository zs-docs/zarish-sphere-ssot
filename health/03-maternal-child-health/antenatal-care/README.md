# Antenatal Care (ANC) Module

Comprehensive antenatal care services following WHO 8-contact model.

## Overview

**Status:** Active  
**Version:** 2.0  
**Last Updated:** February 2026  
**Standards:** WHO ANC Guidelines (2016)

## ANC Contact Schedule

| Contact | Timing | Key Activities |
|---------|--------|----------------|
| 1 | Up to 12 weeks | First assessment, baseline tests, risk screening |
| 2 | 20 weeks | Ultrasound, anomaly scan, risk reassessment |
| 3 | 26 weeks | BP, proteinuria, fetal growth, anemia check |
| 4 | 30 weeks | BP, proteinuria, fetal presentation |
| 5 | 34 weeks | BP, proteinuria, fetal growth, birth planning |
| 6 | 36 weeks | BP, proteinuria, fetal presentation confirmation |
| 7 | 38 weeks | BP, proteinuria, post-term counseling |
| 8 | 40 weeks | BP, proteinuria, induction discussion |

## Clinical Protocols

### Risk Assessment
- High-risk pregnancy identification
- Pre-eclampsia screening
- Gestational diabetes screening
- Anemia screening and treatment
- HIV, syphilis, hepatitis B testing
- TB screening

### Interventions
- Iron/folic acid supplementation
- Calcium supplementation (1.5-2g/day)
- Tetanus toxoid vaccination
- Preventive anthelminthic treatment
- Insecticide-treated bed nets (malaria endemic)
- Antiretroviral prophylaxis (HIV+)

### Birth Preparedness
- Birth plan development
- Emergency fund savings
- Transport arrangement
- Blood donor identification
- Facility delivery counseling

## Data Collection Forms

1. **ANC First Visit Form**
   - Demographics
   - Obstetric history
   - Medical history
   - Physical examination
   - Laboratory investigations
   - Risk assessment

2. **ANC Follow-up Form**
   - Current pregnancy status
   - Danger signs
   - Physical examination
   - Investigations
   - Interventions
   - Counseling provided

3. **Ultrasound Report Form**
4. **Laboratory Results Form**
5. **Birth Plan Form**
6. **Referral Form**

## FHIR Profiles

### Pregnancy Observation
```json
{
  "resourceType": "Observation",
  "id": "pregnancy-edd",
  "status": "final",
  "code": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "11778-8",
      "display": "Estimated date of delivery"
    }]
  },
  "effectiveDateTime": "2026-02-09",
  "valueDateTime": "2026-09-15"
}
```

## Performance Indicators

### Process Indicators
- % of pregnant women with ≥4 ANC contacts
- % of pregnant women with ≥8 ANC contacts
- % of pregnant women with 1st contact <12 weeks
- % receiving iron/folic acid
- % tested for HIV
- % tested for syphilis

### Outcome Indicators
- % facility deliveries
- % with skilled birth attendant
- Maternal mortality ratio
- Stillbirth rate

## Integration Points

- **HIV:** PMTCT enrollment, ART initiation
- **TB:** TB screening at each contact
- **Malaria:** IPTp (in endemic areas)
- **Nutrition:** Screening and supplementation
- **Family Planning:** Postpartum FP counseling
- **Delivery:** Birth preparedness, facility linkage
- **PNC:** Smooth transition to postnatal care

## Quality Standards

- First ANC contact <12 weeks: >80%
- 8 ANC contacts completed: >60%
- Iron/folic acid coverage: >90%
- Facility delivery: >90%
- Skilled birth attendance: >90%

---

**Module Owner:** Maternal Health Team  
**Technical Lead:** FHIR Integration Team  
**Review Cycle:** Quarterly
