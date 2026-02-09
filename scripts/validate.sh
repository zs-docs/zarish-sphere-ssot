#!/bin/bash

# Zarish Sphere SSOT - Validation Script
# Validates repository structure and file integrity
# Usage: bash scripts/validate.sh

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Zarish Sphere SSOT - Validation${NC}"
echo -e "${BLUE}========================================${NC}\n"

ERRORS=0

# Function to report error
report_error() {
  echo -e "${RED}✗${NC} $1"
  ((ERRORS++))
}

# Function to report success
report_success() {
  echo -e "${GREEN}✓${NC} $1"
}

# Check 1: JSON files are valid
echo -e "${YELLOW}Validating JSON files...${NC}"
find fhir -name "*.json" -type f | while read file; do
  if python3 -m json.tool "$file" > /dev/null 2>&1; then
    report_success "Valid JSON: $file"
  else
    report_error "Invalid JSON: $file"
  fi
done

# Check 2: Required documentation
echo -e "\n${YELLOW}Checking documentation...${NC}"
if [ -f "DEPLOYMENT_INSTRUCTIONS.md" ]; then
  report_success "Found: DEPLOYMENT_INSTRUCTIONS.md"
else
  report_error "Missing: DEPLOYMENT_INSTRUCTIONS.md"
fi

if [ -f "docs/06-fhir/README.md" ] || [ -f "docs/06-fhir.md" ]; then
  report_success "Found: FHIR documentation"
else
  report_error "Missing: FHIR documentation"
fi

# Check 3: All profiles have examples
echo -e "\n${YELLOW}Checking FHIR profile-example pairs...${NC}"
PROFILES=$(find fhir/profiles -name "*.R5.json" | wc -l)
EXAMPLES=$(find fhir/examples -name "*.R5.json" | wc -l)

if [ "$PROFILES" -gt 0 ] && [ "$EXAMPLES" -gt 0 ]; then
  report_success "FHIR Profiles: $PROFILES | Examples: $EXAMPLES"
else
  report_error "Mismatched FHIR profiles and examples"
fi

# Check 4: Value sets defined
echo -e "\n${YELLOW}Checking Value Sets...${NC}"
VALUESETS=$(find fhir/valuesets -name "*.json" | wc -l)
if [ "$VALUESETS" -gt 0 ]; then
  report_success "Found $VALUESETS value sets"
else
  report_error "No value sets found"
fi

# Check 5: ICD-11 resources
echo -e "\n${YELLOW}Checking ICD-11 resources...${NC}"
ICD11_FILES=$(find fhir -name "*ICD11*" -o -name "*icd-11*" | wc -l)
if [ "$ICD11_FILES" -gt 0 ]; then
  report_success "ICD-11 resources found: $ICD11_FILES files"
else
  report_error "No ICD-11 resources found"
fi

# Check 6: No circular symlinks
echo -e "\n${YELLOW}Checking for circular symlinks...${NC}"
if find . -type l -exec test -e {} \; -print 2>&1 | grep -q "Too many levels"; then
  report_error "Circular symlinks detected"
else
  report_success "No circular symlinks"
fi

# Summary
echo -e "\n${BLUE}========================================${NC}"
if [ $ERRORS -eq 0 ]; then
  echo -e "${GREEN}✓ All validations passed!${NC}"
  exit 0
else
  echo -e "${RED}✗ Found $ERRORS validation errors${NC}"
  exit 1
fi
