# 🚀 QUICK START GUIDE

## Welcome to Zarish Sphere SSOT!

This guide will help you set up and deploy your Zarish Sphere repository in just a few minutes.

---

## 📦 What You Have

This package contains a complete, ready-to-deploy Zarish Sphere SSOT repository with:

- ✅ **Complete directory structure** - All folders organized
- ✅ **Jekyll configuration** - Ready for GitHub Pages
- ✅ **Automated deployment** - GitHub Actions workflow
- ✅ **Documentation** - Comprehensive docs structure
- ✅ **22 Health modules** - Clinical modules organized
- ✅ **7 Operational modules** - Management modules
- ✅ **Forms library** - 33+ form schemas
- ✅ **FHIR resources** - Standard data models
- ✅ **Country configs** - 5 country deployments

---

## 🎯 Quick Setup (2 Commands!)

### Step 1: Extract the Archive

```bash
# Extract to your desired location
unzip zarish-sphere-ssot.zip
cd zarish-sphere-ssot
```

### Step 2: Run Setup Script

```bash
# Make the script executable (if needed)
chmod +x setup.sh

# Run the setup
./setup.sh
```

That's it! The script will:
1. Initialize Git repository
2. Configure Git settings
3. Add all files
4. Create initial commit
5. Set up GitHub remote
6. Push to GitHub

---

## 📋 Prerequisites

Before running setup.sh, make sure you have:

### 1. Git Installed
```bash
git --version
# Should show: git version 2.x.x
```

### 2. GitHub Account
- Create account at https://github.com if you don't have one

### 3. GitHub Repository Created
Go to https://github.com/new and create a new repository:
- Repository name: `zarish-sphere-ssot` (or your preferred name)
- **Important**: Do NOT initialize with README, .gitignore, or license
- Keep it completely empty

### 4. GitHub Authentication
Choose one:

**Option A: SSH Keys (Recommended)**
```bash
# Check if you have SSH keys
ls -la ~/.ssh

# If not, generate SSH keys
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to GitHub:
# 1. Copy the public key
cat ~/.ssh/id_ed25519.pub

# 2. Go to GitHub → Settings → SSH and GPG keys → New SSH key
# 3. Paste your key and save
```

**Option B: Personal Access Token**
```bash
# 1. Go to GitHub → Settings → Developer settings → Personal access tokens
# 2. Generate new token (classic)
# 3. Select scopes: repo (all)
# 4. Copy the token
# 5. Use it as password when pushing
```

---

## 🔧 Setup Process Details

When you run `./setup.sh`, you'll be asked for:

1. **GitHub Username**: Your GitHub username (e.g., `your-username`)
2. **Repository Name**: Your repo name (default: `zarish-sphere-ssot`)
3. **Confirmation**: Confirm the repository URL
4. **Repository Status**: Confirm you've created the repo on GitHub

The script will then:
- Initialize Git
- Configure Git user
- Add all files
- Create initial commit
- Add remote origin
- Push to GitHub
- Show next steps

---

## 🌐 After Setup

### 1. Enable GitHub Pages

After setup completes:

1. Go to your repository on GitHub:
   ```
   https://github.com/YOUR-USERNAME/zarish-sphere-ssot
   ```

2. Click **Settings** tab

3. Click **Pages** in left sidebar

4. Under "Source":
   - Select: **Deploy from a branch**
   - Branch: **gh-pages** (created automatically by workflow)
   - Folder: **/ (root)**
   - Click **Save**

### 2. Monitor Deployment

1. Go to **Actions** tab in your repository
2. You'll see "Deploy to GitHub Pages" workflow running
3. Wait ~2-3 minutes for completion
4. Green checkmark = deployment successful!

### 3. View Your Site

Once deployment completes, visit:
```
https://YOUR-USERNAME.github.io/zarish-sphere-ssot
```

---

## 🎨 Making Changes

After initial setup, you can make changes anytime:

```bash
# 1. Edit files
vim docs/01-overview/getting-started.md

# 2. Stage changes
git add -A

# 3. Commit changes
git commit -m "docs: Update getting started guide"

# 4. Push to GitHub
git push origin main

# 5. Site automatically rebuilds!
```

---

## 📚 Repository Structure

```
zarish-sphere-ssot/
├── .github/workflows/     # GitHub Actions
├── assets/               # CSS, JS, images
├── docs/                 # Documentation (11 sections)
├── health/               # Health modules (7 groups)
├── operations/           # Operational modules
├── countries/            # Country configs
├── forms/                # Forms library
├── fhir/                 # FHIR resources
├── api/                  # API documentation
├── glossary/             # Terminology
├── vision/               # Strategic docs
├── _config.yml           # Jekyll config
├── index.md              # Homepage
├── README.md             # Project readme
├── setup.sh              # This setup script
└── QUICK_START.md        # This guide
```

---

## 🆘 Troubleshooting

### Setup Script Fails

**Issue**: `permission denied: ./setup.sh`
```bash
chmod +x setup.sh
./setup.sh
```

**Issue**: `git: command not found`
```bash
# Install Git first
# Mac: brew install git
# Ubuntu: sudo apt-get install git
# Windows: Download from git-scm.com
```

### Push Fails

**Issue**: `repository not found`
- Make sure you created the repository on GitHub
- Check repository name matches what you entered
- Verify you have access to the repository

**Issue**: `authentication failed`
- Check your GitHub credentials
- Use SSH keys or Personal Access Token
- Run: `git push -u origin main` manually

### GitHub Pages Not Working

**Issue**: Site shows 404
- Make sure you enabled GitHub Pages in Settings
- Wait 2-3 minutes after first push
- Check Actions tab for deployment status

**Issue**: Workflow failing
- Check .github/workflows/deploy.yml
- View error logs in Actions tab
- Common issue: Missing permissions

---

## 💡 Tips

### Local Development

To preview your site locally:

```bash
# Install dependencies (once)
gem install bundler jekyll
bundle install

# Run local server
bundle exec jekyll serve

# Visit: http://localhost:4000/zarish-sphere-ssot
```

### Customize Your Site

Key files to customize:
- `_config.yml` - Site configuration
- `index.md` - Homepage content
- `docs/` - Documentation sections
- `health/` - Health modules
- `assets/css/` - Styling

### Best Practices

1. **Commit Often**: Make small, focused commits
2. **Clear Messages**: Write descriptive commit messages
3. **Test Locally**: Preview changes before pushing
4. **Update Docs**: Keep documentation current
5. **Use Branches**: Create feature branches for big changes

---

## 📞 Need Help?

### Documentation
- Main site: https://zs-docs.github.io/zarish-sphere-ssot
- GitHub repo: https://github.com/zs-docs/zarish-sphere-ssot

### Support
- Open an issue: https://github.com/zs-docs/zarish-sphere-ssot/issues
- Discussions: https://github.com/zs-docs/zarish-sphere-ssot/discussions
- Email: support@zarishsphere.org

### Community
- GitHub Discussions for Q&A
- Issue tracker for bugs
- Pull requests for contributions

---

## ✅ Checklist

- [ ] Git installed
- [ ] GitHub account created
- [ ] Repository created on GitHub
- [ ] Authentication configured (SSH/Token)
- [ ] Archive extracted
- [ ] `setup.sh` executed successfully
- [ ] Pushed to GitHub
- [ ] GitHub Pages enabled
- [ ] Deployment completed
- [ ] Site accessible

---

## 🎉 Success!

If you can see your site at `https://YOUR-USERNAME.github.io/zarish-sphere-ssot`, you're all set!

**Next Steps:**
1. Explore the documentation
2. Customize for your needs
3. Add your own content
4. Share with your team
5. Start building your healthcare system!

---

**Questions?** Check the [full documentation](https://zs-docs.github.io/zarish-sphere-ssot) or [open an issue](https://github.com/zs-docs/zarish-sphere-ssot/issues).

**Happy building! 🏥**
