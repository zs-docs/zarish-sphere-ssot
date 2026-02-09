#!/bin/bash

# Create complete directory structure
mkdir -p .github/workflows
mkdir -p .github/scripts
mkdir -p assets/{css,js,images,diagrams}
mkdir -p docs/{00-index,01-overview,02-architecture,03-health-modules,04-operations,05-forms,06-fhir,07-countries,08-api,09-no-code,10-governance,11-reference}
mkdir -p health/{01-communicable-diseases,02-noncommunicable-diseases,03-maternal-child-health,04-emergency-surgery,05-specialized-services,06-diagnostic-pharmacy,07-support-services}
mkdir -p operations/{infrastructure,clinical-ops,quality,training,monitoring}
mkdir -p countries/{bangladesh,india,myanmar,pakistan,thailand}
mkdir -p forms/schemas/json
mkdir -p fhir/{profiles,examples,valuesets}
mkdir -p domain/{models,json}
mkdir -p api/endpoints
mkdir -p glossary
mkdir -p vision
mkdir -p scripts

echo "✅ Directory structure created"
