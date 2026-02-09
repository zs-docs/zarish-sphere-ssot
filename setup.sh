#!/bin/bash

# Zarish Sphere SSOT - Complete Setup Script
# This script will set up your repository and deploy it to GitHub Pages

echo "🚀 ZARISH SPHERE SSOT - COMPLETE SETUP"
echo "========================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get GitHub repository information
echo -e "${BLUE}📝 GitHub Repository Configuration${NC}"
echo ""
read -p "Enter your GitHub username (e.g., 'zs-docs'): " GITHUB_USER
read -p "Enter your repository name (default: 'zarish-sphere-ssot'): " REPO_NAME
REPO_NAME=${REPO_NAME:-zarish-sphere-ssot}

echo ""
echo -e "${YELLOW}Repository will be created at:${NC}"
echo "https://github.com/${GITHUB_USER}/${REPO_NAME}"
echo ""
read -p "Is this correct? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo -e "${RED}Setup cancelled${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✅ Configuration confirmed${NC}"
echo ""

# Step 1: Initialize Git repository
echo -e "${BLUE}📦 Step 1/5: Initializing Git repository...${NC}"
if [ ! -d ".git" ]; then
    git init
    echo -e "${GREEN}✅ Git repository initialized${NC}"
else
    echo -e "${YELLOW}ℹ️  Git repository already initialized${NC}"
fi

# Step 2: Configure Git
echo ""
echo -e "${BLUE}⚙️  Step 2/5: Configuring Git...${NC}"
git config user.name "${GITHUB_USER}" 2>/dev/null || true
git config user.email "${GITHUB_USER}@users.noreply.github.com" 2>/dev/null || true
git branch -M main 2>/dev/null || true
echo -e "${GREEN}✅ Git configured${NC}"

# Step 3: Add all files
echo ""
echo -e "${BLUE}📁 Step 3/5: Adding files to repository...${NC}"
git add -A
echo -e "${GREEN}✅ Files added${NC}"

# Step 4: Create initial commit
echo ""
echo -e "${BLUE}💾 Step 4/5: Creating initial commit...${NC}"
git commit -m "feat: Initial commit - Complete Zarish Sphere SSOT setup

- Complete repository structure
- Jekyll configuration for GitHub Pages
- Automated deployment workflow
- Comprehensive documentation structure
- Health modules organization (22 modules)
- Operations modules (7 modules)
- Forms library setup
- FHIR resources structure
- Country configurations
- API documentation structure

This commit sets up the complete Zarish Sphere SSOT healthcare
information system with automated GitHub Pages deployment.

Repository: https://github.com/${GITHUB_USER}/${REPO_NAME}
Documentation: https://${GITHUB_USER}.github.io/${REPO_NAME}
"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Initial commit created${NC}"
else
    echo -e "${RED}❌ Failed to create commit${NC}"
    exit 1
fi

# Step 5: Set up remote and push
echo ""
echo -e "${BLUE}🌐 Step 5/5: Setting up GitHub remote and pushing...${NC}"
echo ""
echo -e "${YELLOW}⚠️  IMPORTANT: Before proceeding, make sure you have:${NC}"
echo "  1. Created a repository named '${REPO_NAME}' on GitHub"
echo "  2. Repository URL: https://github.com/${GITHUB_USER}/${REPO_NAME}"
echo "  3. GitHub authentication configured (SSH keys or Personal Access Token)"
echo ""
read -p "Have you created the repository on GitHub? (y/n): " REPO_CREATED

if [ "$REPO_CREATED" != "y" ] && [ "$REPO_CREATED" != "Y" ]; then
    echo ""
    echo -e "${YELLOW}📋 Next Steps:${NC}"
    echo "  1. Go to https://github.com/new"
    echo "  2. Create a repository named '${REPO_NAME}'"
    echo "  3. Do NOT initialize with README, .gitignore, or license"
    echo "  4. After creating, run this command:"
    echo ""
    echo -e "${GREEN}     git remote add origin https://github.com/${GITHUB_USER}/${REPO_NAME}.git${NC}"
    echo -e "${GREEN}     git push -u origin main${NC}"
    echo ""
    exit 0
fi

# Add remote
git remote add origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git" 2>/dev/null || \
git remote set-url origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

echo ""
echo -e "${YELLOW}Pushing to GitHub...${NC}"
echo "This may take a moment and will require authentication."
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ Successfully pushed to GitHub!${NC}"
    echo ""
    echo -e "${GREEN}🎉 SETUP COMPLETE!${NC}"
    echo ""
    echo -e "${BLUE}📊 Next Steps:${NC}"
    echo ""
    echo "1. ${YELLOW}Enable GitHub Pages:${NC}"
    echo "   - Go to https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
    echo "   - Source: Deploy from a branch"
    echo "   - Branch: gh-pages (will be created automatically by workflow)"
    echo "   - Folder: / (root)"
    echo "   - Click 'Save'"
    echo ""
    echo "2. ${YELLOW}Monitor Deployment:${NC}"
    echo "   - Go to https://github.com/${GITHUB_USER}/${REPO_NAME}/actions"
    echo "   - Watch the 'Deploy to GitHub Pages' workflow"
    echo "   - Deployment takes ~2-3 minutes"
    echo ""
    echo "3. ${YELLOW}View Your Site:${NC}"
    echo "   - After deployment completes, visit:"
    echo -e "   ${GREEN}https://${GITHUB_USER}.github.io/${REPO_NAME}${NC}"
    echo ""
    echo "4. ${YELLOW}Make Changes:${NC}"
    echo "   - Edit any files locally"
    echo "   - Commit: git add -A && git commit -m 'Your message'"
    echo "   - Push: git push origin main"
    echo "   - Site automatically rebuilds!"
    echo ""
    echo -e "${BLUE}📚 Resources:${NC}"
    echo "   - Documentation: https://${GITHUB_USER}.github.io/${REPO_NAME}"
    echo "   - Repository: https://github.com/${GITHUB_USER}/${REPO_NAME}"
    echo "   - Actions: https://github.com/${GITHUB_USER}/${REPO_NAME}/actions"
    echo "   - Issues: https://github.com/${GITHUB_USER}/${REPO_NAME}/issues"
    echo ""
    echo -e "${GREEN}Thank you for using Zarish Sphere SSOT!${NC}"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Push failed${NC}"
    echo ""
    echo -e "${YELLOW}Common issues:${NC}"
    echo "  1. Repository doesn't exist on GitHub - create it first"
    echo "  2. Authentication failed - check your credentials"
    echo "  3. Branch protection - check repository settings"
    echo ""
    echo -e "${YELLOW}Manual push command:${NC}"
    echo -e "  ${GREEN}git push -u origin main${NC}"
    echo ""
    exit 1
fi
