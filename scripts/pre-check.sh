#!/bin/bash

# Zarish Sphere SSOT - Pre-check Script
# Validates environment and dependencies before setup
# Usage: bash scripts/pre-check.sh

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Zarish Sphere SSOT - Pre-Check Script${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Track overall status
CHECKS_PASSED=0
CHECKS_FAILED=0

# Function to print check result
check_result() {
  if [ $1 -eq 0 ]; then
    echo -e "${GREEN}✓${NC} $2"
    ((CHECKS_PASSED++))
  else
    echo -e "${RED}✗${NC} $2"
    ((CHECKS_FAILED++))
  fi
}

# Check 1: Git installed
echo -e "${YELLOW}Checking system dependencies...${NC}"
if command -v git &> /dev/null; then
  GIT_VERSION=$(git --version | awk '{print $3}')
  check_result 0 "Git installed: v$GIT_VERSION"
else
  check_result 1 "Git NOT installed (required)"
fi

# Check 2: Ruby installed
if command -v ruby &> /dev/null; then
  RUBY_VERSION=$(ruby --version | awk '{print $2}')
  check_result 0 "Ruby installed: v$RUBY_VERSION"
else
  check_result 1 "Ruby NOT installed (required for Jekyll)"
  echo -e "${YELLOW}Install Ruby 3.2+ from https://www.ruby-lang.org${NC}"
fi

# Check 3: Bundler installed
if command -v bundle &> /dev/null; then
  BUNDLER_VERSION=$(bundle --version | awk '{print $3}')
  check_result 0 "Bundler installed: v$BUNDLER_VERSION"
else
  check_result 1 "Bundler NOT installed"
  echo -e "${YELLOW}Install with: gem install bundler${NC}"
fi

# Check 4: Node.js (optional, for future enhancements)
echo -e "\n${YELLOW}Checking optional dependencies...${NC}"
if command -v node &> /dev/null; then
  NODE_VERSION=$(node --version)
  check_result 0 "Node.js installed: $NODE_VERSION"
else
  echo -e "${YELLOW}⊙${NC} Node.js NOT installed (optional)"
fi

# Check 5: Repository structure
echo -e "\n${YELLOW}Checking repository structure...${NC}"
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

if [ -d ".git" ]; then
  check_result 0 "Git repository initialized"
else
  check_result 1 "Not a git repository"
fi

# Check required files
for file in "_config.yml" "index.md" "README.md" "Gemfile"; do
  if [ -f "$file" ]; then
    check_result 0 "Found: $file"
  else
    check_result 1 "Missing: $file"
  fi
done

# Check directory structure
for dir in "fhir" "docs" "health" "forms" "countries" "operations"; do
  if [ -d "$dir" ]; then
    check_result 0 "Directory exists: $dir"
  else
    check_result 1 "Missing directory: $dir"
  fi
done

# Check 6: FHIR R5 resources
echo -e "\n${YELLOW}Checking FHIR R5 resources...${NC}"
FHIR_PROFILES=$(find fhir/profiles -name "*.R5.json" 2>/dev/null | wc -l)
FHIR_EXAMPLES=$(find fhir/examples -name "*.R5.json" 2>/dev/null | wc -l)
FHIR_VALUESETS=$(find fhir/valuesets -name "*.R5.json" 2>/dev/null | wc -l)

if [ "$FHIR_PROFILES" -gt 0 ]; then
  check_result 0 "FHIR R5 Profiles: $FHIR_PROFILES files"
else
  check_result 1 "No FHIR R5 profiles found"
fi

if [ "$FHIR_EXAMPLES" -gt 0 ]; then
  check_result 0 "FHIR R5 Examples: $FHIR_EXAMPLES files"
else
  check_result 1 "No FHIR R5 examples found"
fi

if [ "$FHIR_VALUESETS" -gt 0 ]; then
  check_result 0 "FHIR Value Sets: $FHIR_VALUESETS files"
else
  check_result 1 "No FHIR value sets found"
fi

# Check 7: ICD-11 support
echo -e "\n${YELLOW}Checking ICD-11 support...${NC}"
if [ -f "fhir/ICD11-Mappings.json" ]; then
  check_result 0 "ICD-11 Mappings file exists"
else
  check_result 1 "ICD-11 Mappings file missing"
fi

if [ -f "fhir/codesystems/ICD11-CodeSystem.R5.json" ]; then
  check_result 0 "ICD-11 Code System file exists"
else
  check_result 1 "ICD-11 Code System file missing"
fi

# Check 8: Git configuration
echo -e "\n${YELLOW}Checking Git configuration...${NC}"
GIT_USER=$(git config user.name 2>/dev/null)
GIT_EMAIL=$(git config user.email 2>/dev/null)

if [ -n "$GIT_USER" ]; then
  check_result 0 "Git user configured: $GIT_USER"
else
  check_result 1 "Git user NOT configured"
  echo -e "${YELLOW}Configure with: git config --global user.name 'Your Name'${NC}"
fi

if [ -n "$GIT_EMAIL" ]; then
  check_result 0 "Git email configured: $GIT_EMAIL"
else
  check_result 1 "Git email NOT configured"
  echo -e "${YELLOW}Configure with: git config --global user.email 'your@email.com'${NC}"
fi

# Summary
echo -e "\n${BLUE}========================================${NC}"
echo -e "${BLUE}Pre-Check Summary${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "Checks Passed: ${GREEN}$CHECKS_PASSED${NC}"
echo -e "Checks Failed: ${RED}$CHECKS_FAILED${NC}"

if [ $CHECKS_FAILED -eq 0 ]; then
  echo -e "\n${GREEN}✓ All checks passed! Ready to build.${NC}"
  echo -e "${YELLOW}Next steps:${NC}"
  echo -e "1. Run: ${BLUE}bundle install${NC}"
  echo -e "2. Run: ${BLUE}bundle exec jekyll serve${NC}"
  echo -e "3. Visit: ${BLUE}http://localhost:4000${NC}"
  exit 0
else
  echo -e "\n${RED}✗ Some checks failed. Please resolve issues above.${NC}"
  exit 1
fi
