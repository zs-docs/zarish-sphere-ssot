# 🚀 QUICK START GUIDE

## One-Command Deployment to GitHub

This guide will help you deploy the complete Zarish Sphere SSOT repository to GitHub in just **2 simple steps**.

---

## 📋 Prerequisites

Before you begin, make sure you have:

1. ✅ **Git installed** - [Download Git](https://git-scm.com/downloads)
2. ✅ **GitHub account** - [Sign up for GitHub](https://github.com/join)
3. ✅ **GitHub authentication** - One of these options:
   - GitHub CLI (`gh auth login`)
   - SSH keys configured
   - Personal Access Token ready

---

## 🎯 Deployment Steps

### Step 1: Extract the Archive

You've already done this if you're reading this file! The `zarish-sphere-ssot` directory contains everything you need.

### Step 2: Run the Deployment Script

Open your terminal and run:

```bash
cd zarish-sphere-ssot
./DEPLOY.sh
```

That's it! The script will:
- ✅ Initialize git repository
- ✅ Configure git (if needed)
- ✅ Add all files
- ✅ Create commit
- ✅ Push to GitHub

---

## 📊 What Happens Next?

After pushing, GitHub Actions automatically:

1. **Validates** repository structure (10 seconds)
2. **Builds** Jekyll site with 270+ pages (60 seconds)
3. **Deploys** to GitHub Pages (30 seconds)
4. **Goes Live** at: `https://zs-docs.github.io/zarish-sphere-ssot`

**Total Time:** ~2 minutes

---

## 🔧 Enabling GitHub Pages

After your first push:

1. Go to: `https://github.com/zs-docs/zarish-sphere-ssot`
2. Click **Settings** → **Pages**
3. Under "Source", select: **GitHub Actions**
4. Save

That's it! The site will automatically deploy on every push.

---

## 🎉 What You Get

Your deployed platform includes:

### 📚 Health Modules (22 modules)
- Communicable Diseases (HIV, TB, Infectious diseases)
- Non-Communicable Diseases (Diabetes, CVD, Cancer, Mental health)
- Maternal & Child Health (ANC, PNC, Child health, Nutrition)
- Emergency & Surgery
- Specialized Services (GBV, MAT, Palliative care)
- Diagnostic & Pharmacy
- Support Services

### 📝 Forms (33 forms)
- Clinical consultation forms
- Domain-specific forms (HIV, ANC, TB, GBV, MAT)
- Laboratory forms
- Operational forms

### 🌍 Country Deployments (5 countries)
- 🇧🇩 Bangladesh
- 🇮🇳 India
- 🇲🇲 Myanmar
- 🇵🇰 Pakistan
- 🇹🇭 Thailand

### 📖 Documentation (12 sections)
- Platform overview
- System architecture
- Complete module documentation
- API documentation
- FHIR integration guides

### 🔧 Technical Features
- FHIR R4 integration
- Automated deployment via GitHub Actions
- Jekyll-powered documentation site
- Mobile-responsive design
- Search functionality

---

## 🛠️ Troubleshooting

### Authentication Issues

If git push fails with authentication errors:

**Option 1: GitHub CLI (Recommended)**
```bash
gh auth login
```

**Option 2: SSH Keys**
1. Generate SSH key: `ssh-keygen -t ed25519 -C "your_email@example.com"`
2. Add to GitHub: Settings → SSH Keys → New SSH key
3. Update remote: `git remote set-url origin git@github.com:zs-docs/zarish-sphere-ssot.git`

**Option 3: Personal Access Token**
1. GitHub → Settings → Developer settings → Personal access tokens
2. Generate token with `repo` scope
3. Use token as password when pushing

### Repository Doesn't Exist

If the repository `zs-docs/zarish-sphere-ssot` doesn't exist yet:

1. Create it on GitHub: https://github.com/new
2. Name: `zarish-sphere-ssot`
3. Don't initialize with README (we already have one)
4. Then run `./DEPLOY.sh` again

### Permission Issues

If you get "permission denied" errors:
```bash
chmod +x DEPLOY.sh
./DEPLOY.sh
```

---

## 📞 Next Steps After Deployment

### 1. Monitor Deployment
- Check: `https://github.com/zs-docs/zarish-sphere-ssot/actions`
- Green checkmark = Success!
- Red X = Build failed (check logs)

### 2. Visit Your Site
- URL: `https://zs-docs.github.io/zarish-sphere-ssot`
- Browse health modules
- Explore forms
- Check country configurations

### 3. Make Changes
```bash
# Make your changes
git add .
git commit -m "Your commit message"
git push
# Site automatically rebuilds and deploys!
```

### 4. Customize
- Edit `_config.yml` for site settings
- Modify `index.md` for homepage content
- Add new health modules in `health/` directory
- Create new forms in `forms/schemas/json/`

---

## 📚 Documentation

Full documentation available at:
- **README.md** - Repository overview
- **docs/** - Complete platform documentation
- **health/** - Health module documentation
- **forms/** - Form schemas and documentation
- **countries/** - Country deployment guides

---

## 🤝 Support

- **Issues:** https://github.com/zs-docs/zarish-sphere-ssot/issues
- **Discussions:** https://github.com/zs-docs/zarish-sphere-ssot/discussions
- **Email:** support@zarish-sphere.org

---

## 🎊 Congratulations!

You now have a complete, production-ready healthcare documentation platform that automatically deploys to GitHub Pages with every push!

**Happy documenting! 🏥**

---

*Created: February 2026*  
*Platform: Zarish Sphere SSOT v2.0*
