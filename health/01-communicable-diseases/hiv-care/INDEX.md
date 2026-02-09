---
layout: default
title: HIV Care & Treatment Module
permalink: /health/01-communicable-diseases/hiv-care/
---

# HIV Care & Treatment Module

**Status:** Active  
**Version:** 2.0.0  
**Last Updated:** February 9, 2026  
**Standards:** WHO 2024 Guidelines, FHIR R5, ICD-11 QE84

---

## Module Overview

This module provides comprehensive guidance for HIV testing, counseling, care, and treatment in low-resource settings. It covers the complete continuum of HIV services from prevention through advanced disease management.

### Key Objectives

- Increase case finding through systematic testing
- Provide timely ART initiation
- Achieve and maintain viral suppression
- Manage opportunistic infections
- Integrate with maternal health (PMTCT)
- Support treatment adherence and retention

---

## Clinical Workflows

### 1. HIV Testing & Counseling (HTC)

**Indications:**
- All patients with TB (TB-HIV)
- Pregnant women (PMTCT)
- Sexual workers and MSM
- Tuberculosis contacts
- Symptomatic patients with fever, weight loss, diarrhea
- Routine screening (antenatal, STI clinics)

**Workflow:**
```
1. Pre-test counseling → 2. Rapid test/4th gen Ag/Ab → 
3. Confirmatory test → 4. Result disclosure → 5. Linkage to care
```

**Testing Algorithm:**
- First: Rapid test (SD Bioline, Determine, or equivalent)
- Positive → Second rapid test (different antigen)  
- Positive → Western Blot or Viral Load confirmation
- Negative → Document as negative
- Indeterminate → Repeat after 2 weeks

**Forms Required:**
- HIV-TC-001: HIV Testing & Counseling
- Consent form
- Results documentation

**FHIR Mapping:**
- Observation (testing)
- ServiceRequest (lab order)
- Procedure (counseling intervention)

**Performance Indicators:**
- % with negative test documented
- % with positive test linked to care <2 weeks
- % uptake of family planning with testing

---

### 2. ART Initiation

**Eligibility (WHO 2024):**
- CD4 <50 (AIDS-defining regardless of other factors)
- CD4 50-100 with specific conditions (TB extrapulmonary, CNS OIs)
- CD4 100-200 with TB disease
- CD4 >200: Symptomatic (PWP) or high viral load

**First-line Regimens:**

| Regimen | Composition | Use Case | Advantages |
|---------|-------------|----------|-----------|
| **TDF/3TC/DTG** | Tenofovir 300mg + Lamivudine 300mg + Dolutegravir 50mg (OD) | **Preferred** | Integrase preferred. FDC. Good renal tolerance |
| **TAF/3TC/DTG** | Tenofovir alafenamide 25mg + 3TC 300mg + DTG 50mg (OD) | Renal disease, bone loss | Better renal/bone profile, lower dose TFV |
| **AZT/3TC/DTG** | Zidovudine 300mg + Lamivudine 300mg + DTG 50mg (OD) | Pregnancy, renal disease | When TDF/TAF contraindicated |
| **EFV/3TC/TDF** | Efavirenz 600mg + 3TC 300mg + TDF 300mg (OD evening) | Backup option | Widely available, cost-effective |

**Pre-ART Assessment:**
- CD4 count, Viral load
- TB screening (symptom screen, GXP/CXR)
- Kidney function, Liver function
- Pregnancy status
- Opportunistic infection screening
- Comorbidity assessment (HTN, DM, HBV, HCV)

**Baseline Tests (Form ART-INI-001):**
- CD4 count
- Viral load (or use WHO clinical staging)
- FBC, U&E, LFTs
- TB screening  
- HBsAg, HCV antibody
- Pregnancy test (WOCBP)
- Creatinine clearance or eGFR

**Counseling Topics:**
- Adherence importance (>95% to prevent resistance)
- Timing and food requirements  
- Side effects and management
- Sexual transmission despite ART (undetectable = untransmittable)
- Family planning options
- Adherence support strategies

**FHIR Mapping:**
- MedicationRequest (ART prescription)
- Condition (HIV diagnosis)
- Observation (baseline CD4, VL, labs)
- Procedure (adherence counseling)

**Formulas/Calculations:**
- eGFR (Cockcroft-Gault or CKD-EPI)
- Adherence %: (pills taken / pills given) × 100

---

### 3. ART Follow-up

**Schedule:**
- Week 2: Assess tolerability, adherence
- Week 4: Labs if CD4 <200 (monitor for OI)
- Month 3: Clinical assessment, pharmacy refill
- Month 6: CD4 count, viral load
- Month 12: Repeat baseline labs if CD4 <200

**Monitoring Parameters (Form: ART-FU-001):**

| Parameter | Baseline | Month 3 | Month 6 | Month 12 | Frequency |
|-----------|----------|---------|---------|----------|-----------|
| **CD4 Count** | Yes | If <200 | Yes | Yes | 6-monthly (if suppressed) |
| **Viral Load** | Baseline | - | M6 | M12 | 12-monthly (annual) |
| **Weight, Height** | Yes | Yes | Yes | Yes | Every visit |
| **Vital Signs** | Yes | Yes |  | Yes | Every visit |
| **Adherence** | Yes | Yes | Yes | Yes | Every visit |
| **Pregnancy Status** | WOCBP | Yes | Yes | Yes | As needed |
| **TB Screening** | Yes | If symptoms | If symptoms | Yes | Annual |
| **LFTs** | Yes | If on DTG/EFV | If abnormal | Yes | Annual |
| **U&E/Creatinine** | Yes | If eGFR <60 | If abnormal | If abnormal | 6-12 monthly |

**Clinical Assessment:**
- Weight trend (gain after ART = good sign)
- Immune reconstitution inflammatory syndrome (IRIS) signs
- OI prophylaxis reassessment (CD4 >200 × 3 months = stop)
- Adherence issues (pill count, healthcare worker discussion)
- AF- status

**Failures & Management:**
- Virological failure: VL >200 c/mL on repeat test
- Immunological failure: CD4 not rising despite VL suppression
- Clinical failure: New OI despite ART >3 months

**Actions:**
1. Re-assess adherence
2. Check for drug interactions
3. Evaluate for TB/OI
4. Switch regimen if needed (use IB-based, R/B-based if available)

**FHIR Mapping:**
- Encounter (follow-up visit)
- Observation (CD4, VL, weight, vital signs)
- MedicationRequest (refill/switch)
- Condition (OI management)
- ServiceRequest (lab orders)

---

## Opportunistic Infections Management

### Prophylaxis Indications

| OI | CD4 Threshold | Prophylaxis | Duration |
|----|----|----------|----------|
| **PCP** | <200 | TMP-SMX DS od | Until CD4 >200 × 3mo |
| **TB** | Any (especially <100) | INH + Pyridoxine daily | 6 months |
| **MAC** | <50 | Azithromycin weekly | Until CD4 >50 × 3mo |
| **CMV** | <50 | Valganciclovir | If symptoms |
| **Candida** | <100 | Fluconazole weekly | Until CD4 >100 × 3mo |

### Active OI Treatment

| OI | First-line Treatment | Duration | Notes |
|----|-------|--------|-------|
| **Candida esophagitis** | Fluconazole 400-800mg daily | 14-21 days | No SMX if on TMP-SMX |
| **PCP** | TMP-SMX 20/100 mg/kg daily | 21 days | Add corticosteroids if PaO2 <70 |
| **Toxoplasma encephalitis** | Pyrimethamine + Sulfadiazine + Folinic acid | 6-8 weeks | |
| **TB** | Standard or MDR regimen | 6 or 20 months | Consider IRIS risk |
| **CMV retinitis** | Ganciclovir IV or Foscarnet | Induction 2-3 weeks | Maintenance if CD4 <50 |

**OI Monitoring Form:** OI-MNG-001

---

## Special Populations

### 1. TB-HIV Coinfection

**ART Timing (WHO guideline):**
- TB meningitis: Start ART week 2-8
- TB disease (extra-pulmonary): Start ART week 2-8  
- Pulmonary TB with CD4 <50: Start ART week 2
- Pulmonary TB with CD4 50-100: Start ART week 2
- Pulmonary TB with CD4 >100: Start ART week 2-8

**ART Selection:**
- **Preferred:** TDF/3TC/DTG (rifampicin interaction minimal)
- **Alternative:** AZT/3TC/DTG if renal disease
- **Avoid:** EFV with rifampicin (drug interaction)
- **Drug Interaction:** DTG needs spacing with antacids, divalent cations

**TB Drug Interactions:**
- Rifampicin induces DTG metabolism (need DTG 50mg BID)
- TDF/TAF compatible with all TB drugs
- 3TC compatible with all TB drugs

**Form:** TB-HIV-001

---

### 2. Pregnancy & PMTCT

**ART Approach:**
- All pregnant women on/initiate ART (for their health AND prevention)
- Continue through pregnancy and post-partum indefinitely
- VL <50 = no MTCT risk

**Medication Safety:**
- TDF/3TC safe in pregnancy
- DTG: Generally safe, but monitor first trimester
- EFV: Safe (WHO approval)
- Avoid: TDF + protease inhibitors, certain meds

**Counseling:**
- "Undetectable = Untransmittable" (U=U)
- Sexual transmission prevention
- Infant feeding options (EBF vs formula based on context)
- Family planning options

**Form:** PMTCT-INI-001, PMTCT-FU-001

---

## Laboratory Investigations

### Tests Available at Facility Level

- Rapid test (HCT)
- CD4 count (flow cytometry or point-of-care if available)
- FBC, U&E, LFTs (if lab capacity)
- Creatinine/eGFR

### Referral Tests

- Viral load (send to reference lab)
- Western Blot confirmation
- Drug resistance testing
- Genotyping (for switches)
- HCV RNA, HBV DNA quantification

---

## Quality Indicators

### Process Indicators
- % of TB patients tested for HIV
- % of HIV+ with CD4 documented at baseline
- % initiating ART within 2 weeks of diagnosis
- % with suppressed VL at 12 months
- % retained in care at 12 months
- % with adherence support documented

### Outcome Indicators
- Median CD4 rise at 6 months (target: +100-150)
- % achieving VL <50 at 6 months (target: >75%)
- % achieving VL <50 at 12 months (target: >90%)
- % without IRIS
- % without new OI
- Retention at 12 months (target: >90%)

---

## Documentation Requirements

### Essential Forms

1. **HIV-TC-001**: HIV Testing & Counseling
2. **HIV-ART-INI-001**: ART Initiation Assessment
3. **HIV-ART-FU-001**: ART Follow-up Visit
4. **OI-MGMT-001**: OI Management
5. **PMTCT-001**: PMTCT Services (if pregnant)

### FHIR Resources Required

- Patient (demographics)
- Condition (HIV diagnosis, OIs)
- Observation (CD4, VL, labs, vitals, weight)
- MedicationRequest (ART, OI prophylaxis)
- ServiceRequest (lab orders)
- Procedure (testing, counseling, interventions)
- Encounter (clinical visits)

---

## Related Modules

- **TB Management:** TB-HIV coinfection workflows
- **Maternal Health:** PMTCT services
- **Mental Health:** Depression in HIV+ patients
- **Diabetes Management:** Comorbidity
- **Referral System:** Links to other services

---

## References

- WHO Consolidated Guidelines on HIV (2024)
- ICD-11: QE84 (HIV disease)
- FHIR R5: Patient, Condition, Medication Request, Observation
- SNOMED CT: HIV disease concepts
- RxNorm: ART and OI drug codes

---

**Last Reviewed:** 2026-02-09  
**Next Review:** 2026-08-09  
**Maintained by:** Zarish Sphere Clinical Team  
**Contact:** zarishsphere@gmail.com
