---
layout: default
title: GitHub Pages Deployment Guide
permalink: /docs/github-pages-deployment/
---

# GitHub Pages Deployment for Custom Domain

**Status:** Production Ready  
**Custom Domain:** docs.zarishsphere.com  
**Last Updated:** February 9, 2026

---

## Overview

This guide ensures your Zarish Sphere SSOT documentation site is properly configured and deployed to GitHub Pages with the custom domain `docs.zarishsphere.com`.

---

## Prerequisites

- ✅ GitHub repository: `zs-docs/zarish-sphere-ssot`
- ✅ DNS configured: `docs.zarishsphere.com` pointing to GitHub servers
- ✅ CNAME file in repository root
- ✅ _config.yml configured correctly
- ✅ GitHub Pages enabled in repository settings

---

## Deployment Checklist

### 1. GitHub Repository Configuration

```bash
# Verify remote
git remote -v

# Check repository settings
gh repo view --json repositoryTopics,isPrivate,isTemplate
```

**Required Settings:**
- [ ] Repository is PUBLIC
- [ ] GitHub Pages enabled in Settings > Pages
- [ ] Source: main branch (or gh-pages)
- [ ] Custom domain: docs.zarishsphere.com

### 2. DNS Configuration

**Verify DNS records:**
```bash
# Check CNAME record
nslookup docs.zarishsphere.com

# Check A records pointing to GitHub
nslookup docs.zarishsphere.com
# Should resolve to GitHub Pages IPs:
#  185.199.108.153
#  185.199.109.153
#  185.199.110.153
#  185.199.111.153
```

**Expected Output:**
```
docs.zarishsphere.com  CNAME  zarishsphere.github.io
```

### 3. CNAME File Verification

**Repository root must contain:**
```
docs.zarishsphere.com
```

Location: `/CNAME`

### 4. Jekyll Configuration (_config.yml)

**Verified settings:**
```yaml
url: "https://docs.zarishsphere.com"
baseurl: ""  # Empty for custom domain
```

### 5. Deploy to Production

```bash
# 1. Verify all changes locally
bundle exec jekyll serve
# Visit http://localhost:4000

# 2. Test build
bundle exec jekyll build --production
# Check _site/ directory has all content

# 3. Add changes to git
git add -A
git commit -m "docs: Update documentation and branding for docs.zarishsphere.com"

# 4. Push to main branch
git push origin main

# 5. GitHub Actions auto-deploys (check Actions tab)

# 6. Verify deployment (wait 2-5 minutes)
curl -I https://docs.zarishsphere.com
```

---

## Verification Steps

### Step 1: Check GitHub Actions Workflow

1. Go to [GitHub Actions](https://github.com/zs-docs/zarish-sphere-ssot/actions)
2. Check latest workflow run status
3. Should show:
   - ✅ Validate
   - ✅ Build Jekyll
   - ✅ Deploy to Pages

### Step 2: Verify Site Accessibility

```bash
# Test main domain
curl -I https://docs.zarishsphere.com
# Should return HTTP 200

# Test specific pages
curl -I https://docs.zarishsphere.com/health/
curl -I https://docs.zarishsphere.com/forms/
curl -I https://docs.zarishsphere.com/fhir/

# All should return HTTP 200
```

### Step 3: Check Custom Domain Configuration

1. Go to Repository Settings > Pages
2. Verify:
   - ✅ Custom domain: `docs.zarishsphere.com`
   - ✅ Enforce HTTPS enabled
   - ✅ DNS check passing (green checkmark)

### Step 4: Test Site Content

**Visit key pages:**
- [ ] Home: https://docs.zarishsphere.com
- [ ] Health Modules: https://docs.zarishsphere.com/health/
- [ ] Forms: https://docs.zarishsphere.com/forms/
- [ ] FHIR: https://docs.zarishsphere.com/fhir/
- [ ] Countries: https://docs.zarishsphere.com/countries/
- [ ] Documentation: https://docs.zarishsphere.com/docs/

### Step 5: Validate HTTPS & SSL

```bash
# Check SSL certificate
openssl s_client -connect docs.zarishsphere.com:443

# Or use online tool
curl -v https://docs.zarishsphere.com 2>&1 | grep "subject:"
```

**Expected:**
- ✅ Valid Let's Encrypt certificate
- ✅ HTTPS working
- ✅ No SSL warnings

---

## Local Development & Testing

### Build Locally

```bash
# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve --trace

# Visit http://localhost:4000
```

### Testing Collections

Verify all collections render:

```bash
# Health modules
ls -la _site/health/*/
# Should show: 01-communicable-diseases/, 02-noncommunicable-diseases/, etc.

# Forms
ls -la _site/forms/
# Should show form schema listings

# FHIR
ls -la _site/fhir/
# Should show profiles, examples, value sets

# Countries
ls -la _site/countries/
# Should show bangladesh/, india/, myanmar/, pakistan/, thailand/
```

---

## Troubleshooting

### Issue: Site not accessible

**Check:**
1. DNS propagation: `nslookup docs.zarishsphere.com`
2. Repository Settings > Pages enabled
3. CNAME file exists and correct
4. GitHub Actions workflow succeeded
5. Custom domain set in Settings > Pages

**Solution:**
```bash
# Wait 10-30 minutes for DNS propagation
# Or use GitHub's DNS check in Settings > Pages
```

### Issue: 404 errors on pages

**Check:**
1. File exists: `ls -la _site/health/`
2. _config.yml has correct baseurl (should be empty for custom domain)
3. Collections defined in _config.yml

**Solution:**
```bash
# Rebuild locally
bundle exec jekyll clean
bundle exec jekyll build --trace
```

### Issue: HTTPS not working

**Check:**
1. Settings > Pages > "Enforce HTTPS" enabled
2. Wait for Let's Encrypt certificate (up to 1 hour)

**Solution:**
```bash
# Force re-issue
# Go to Settings > Pages, uncheck "Enforce HTTPS"
# Wait 1 minute
# Re-check "Enforce HTTPS"
```

### Issue: Forms/FHIR not rendering

**Check:**
1. JSON files valid syntax: `json -f forms/schemas/json/*.json`
2. Collections in _config.yml set to output: true

**Solution:**
```bash
# Validate JSON
for f in forms/schemas/json/*.json; do
  echo "Validating $f"
  jq empty < "$f" || echo "ERROR: $f"
done
```

---

## Performance Optimization

### Site Performance

```bash
# Test performance
curl -w "@curl-format.txt" -o /dev/null -s https://docs.zarishsphere.com

# Expected response time: <500ms
```

### Asset Optimization

All assets compressed in pipeline:
- ✅ CSS minified
- ✅ JS minified  
- ✅ Images optimized (sitemap, robots.txt)

---

## Maintenance

### Regular Checks

**Weekly:**
- [ ] Check GitHub Actions (no failed builds)
- [ ] Verify site accessibility
- [ ] Monitor error rates (if available)

**Monthly:**
- [ ] Update health modules content
- [ ] Add new FHIR resources
- [ ] Update documentation
- [ ] Review form schemas

**Quarterly:**
- [ ] Update country configurations
- [ ] Review analytics (if enabled)
- [ ] Security audit
- [ ] FHIR standards update check

### Update Workflow

```bash
# 1. Create feature branch
git checkout -b docs/update-health-modules

# 2. Make changes
# ... edit files ...

# 3. Test locally
bundle exec jekyll serve

# 4. Commit
git add -A
git commit -m "docs: Update health modules and FHIR resources"

# 5. Push and create PR
git push origin docs/update-health-modules

# 6. After approval and merge, auto-deployment happens
```

---

## SSL/TLS Certificate

GitHub Pages provides automatic SSL via Let's Encrypt:
- ✅ Certificate auto-renewed
- ✅ Force HTTPS enabled
- ✅ HSTS (HTTP Strict Transport Security) active

---

## Monitoring & Analytics

### Optional: Enable GitHub Pages analytics

In Settings > Pages, check "Enable analytics"

### Log Monitoring

GitHub Actions logs available at:
https://github.com/zs-docs/zarish-sphere-ssot/actions

---

## Rollback Procedure

If deployment fails:

```bash
# 1. Check latest commit
git log --oneline -5

# 2. Revert problematic commit
git revert <commit-hash>
git push origin main

# 3. GitHub Actions auto-redeploys
# 4. Site reverts to previous version
```

---

## Key URLs

- **Main Site:** https://docs.zarishsphere.com
- **Repository:** https://github.com/zs-docs/zarish-sphere-ssot
- **GitHub Pages Settings:** https://github.com/zs-docs/zarish-sphere-ssot/settings/pages
- **GitHub Actions:** https://github.com/zs-docs/zarish-sphere-ssot/actions
- **Repository Issues:** https://github.com/zs-docs/zarish-sphere-ssot/issues

---

## Support

**Issues or questions?**
- Email: zarishsphere@gmail.com
- GitHub: [Open an issue](https://github.com/zs-docs/zarish-sphere-ssot/issues)
- Discussions: [GitHub Discussions](https://github.com/zs-docs/zarish-sphere-ssot/discussions)

---

**Last Updated:** 2026-02-09  
**Status:** ✅ Production Ready  
**Maintained by:** Zarish Sphere DevOps Team
