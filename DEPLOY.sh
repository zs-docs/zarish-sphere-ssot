#!/bin/bash

# Zarish Sphere SSOT - One-Command Deployment Script
# This script sets up and deploys the entire repository to GitHub

set -e  # Exit on any error

echo "🚀 ZARISH SPHERE SSOT - AUTOMATED DEPLOYMENT"
echo "=============================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ ERROR: Git is not installed. Please install git first.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Git detected${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo -e "${RED}❌ ERROR: _config.yml not found. Are you in the zarish-sphere-ssot directory?${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Directory verified${NC}"
echo ""

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing git repository..."
    git init
    echo -e "${GREEN}✅ Git repository initialized${NC}"
else
    echo -e "${YELLOW}ℹ️  Git repository already initialized${NC}"
fi
echo ""

# Configure git if not already configured
if [ -z "$(git config user.name)" ]; then
    echo "⚙️  Configuring git..."
    read -p "Enter your name for git commits: " git_name
    read -p "Enter your email for git commits: " git_email
    git config user.name "$git_name"
    git config user.email "$git_email"
    echo -e "${GREEN}✅ Git configured${NC}"
else
    echo -e "${GREEN}✅ Git already configured${NC}"
    echo "   Name: $(git config user.name)"
    echo "   Email: $(git config user.email)"
fi
echo ""

# Check for remote
REMOTE_URL="https://github.com/zs-docs/zarish-sphere-ssot.git"
if git remote | grep -q "^origin$"; then
    echo -e "${YELLOW}ℹ️  Remote 'origin' already exists${NC}"
    EXISTING_URL=$(git remote get-url origin)
    if [ "$EXISTING_URL" != "$REMOTE_URL" ]; then
        echo -e "${YELLOW}⚠️  Warning: Remote URL is different${NC}"
        echo "   Existing: $EXISTING_URL"
        echo "   Expected: $REMOTE_URL"
        read -p "Do you want to update it? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git remote set-url origin "$REMOTE_URL"
            echo -e "${GREEN}✅ Remote URL updated${NC}"
        fi
    else
        echo -e "${GREEN}✅ Remote URL is correct${NC}"
    fi
else
    echo "🔗 Adding remote repository..."
    git remote add origin "$REMOTE_URL"
    echo -e "${GREEN}✅ Remote added: $REMOTE_URL${NC}"
fi
echo ""

# Create main branch and switch to it
echo "🌿 Setting up main branch..."
if git rev-parse --verify main >/dev/null 2>&1; then
    git checkout main
    echo -e "${GREEN}✅ Switched to main branch${NC}"
else
    git checkout -b main
    echo -e "${GREEN}✅ Created and switched to main branch${NC}"
fi
echo ""

# Add all files
echo "📝 Staging all files..."
git add -A
echo -e "${GREEN}✅ All files staged${NC}"
echo ""

# Show what will be committed
echo "📋 Files to be committed:"
git status --short | head -20
TOTAL_FILES=$(git status --short | wc -l)
if [ $TOTAL_FILES -gt 20 ]; then
    echo "   ... and $(($TOTAL_FILES - 20)) more files"
fi
echo ""

# Create commit
echo "💾 Creating commit..."
COMMIT_MSG="feat: Complete Zarish Sphere SSOT repository setup

- 22 health modules across 7 groups
- 33 clinical and operational forms with JSON schemas
- 5 country deployments (Bangladesh, India, Myanmar, Pakistan, Thailand)
- 12 documentation sections
- Complete FHIR R4 integration
- Automated GitHub Actions deployment workflow
- Comprehensive glossary and terminology
- Jekyll-powered GitHub Pages site

This commit establishes the complete Single Source of Truth (SSOT) 
platform for healthcare documentation and module management."

if git diff --staged --quiet; then
    echo -e "${YELLOW}⚠️  No changes to commit${NC}"
else
    git commit -m "$COMMIT_MSG"
    echo -e "${GREEN}✅ Commit created${NC}"
fi
echo ""

# Push to GitHub
echo "🚀 Pushing to GitHub..."
echo -e "${YELLOW}ℹ️  This may take a moment...${NC}"
echo ""

if git push -u origin main; then
    echo ""
    echo -e "${GREEN}✅ Successfully pushed to GitHub!${NC}"
    echo ""
    echo "🎉 DEPLOYMENT COMPLETE!"
    echo ""
    echo "📋 Next Steps:"
    echo "1. Go to: https://github.com/zs-docs/zarish-sphere-ssot"
    echo "2. Enable GitHub Pages in Settings → Pages"
    echo "   - Source: GitHub Actions"
    echo "3. Wait 2-3 minutes for automatic deployment"
    echo "4. Visit your site at: https://zs-docs.github.io/zarish-sphere-ssot"
    echo ""
    echo "📊 Deployment Status:"
    echo "   Check: https://github.com/zs-docs/zarish-sphere-ssot/actions"
    echo ""
    echo "✅ Your platform is now live and ready!"
else
    echo ""
    echo -e "${YELLOW}⚠️  Push failed. This might be because:${NC}"
    echo "   1. You need to authenticate with GitHub"
    echo "   2. You don't have write access to the repository"
    echo "   3. The repository doesn't exist yet"
    echo ""
    echo "📝 To fix authentication issues:"
    echo "   Option 1: Use GitHub CLI: gh auth login"
    echo "   Option 2: Set up SSH keys: https://docs.github.com/en/authentication"
    echo "   Option 3: Use Personal Access Token"
    echo ""
    echo "After fixing authentication, run:"
    echo "   git push -u origin main"
fi
