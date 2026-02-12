# 🚀 GitHub Deployment Guide - Ashley Furniture Dashboard

## 📋 Quick Steps to Deploy

Follow these steps to get your dashboard live on GitHub Pages with a shareable URL!

---

## ✅ Step 1: Create GitHub Repository

1. **Go to GitHub**: https://github.com/new
2. **Fill in the details**:
   - Repository name: `ashley-dashboard`
   - Description: `Ashley Furniture Analytics Dashboard - Interactive store and warehouse performance insights`
   - Visibility: **Public** (required for free GitHub Pages)
   - ❌ **DO NOT** check "Add a README file"
   - ❌ **DO NOT** check "Add .gitignore"
   - ❌ **DO NOT** choose a license
3. **Click**: "Create repository"

---

## ✅ Step 2: Run the Setup Script

### Option A: Automated Setup (Recommended)

1. **Double-click** `setup_github.bat`
2. **Follow the prompts**
3. When asked, **create the repository on GitHub** (Step 1 above)
4. **Press any key** to continue pushing

### Option B: Manual Setup

Open PowerShell or Command Prompt in this folder and run:

```bash
# Initialize git
git init

# Add files
git add dashboard.html dashboard_data.json generate_dashboard_data.py
git add refresh_dashboard.bat setup_auto_refresh.ps1
git add DASHBOARD_SETUP_INSTRUCTIONS.md README.md .gitignore

# Commit
git commit -m "Initial commit: Ashley Furniture Analytics Dashboard"

# Add remote
git remote add origin https://github.com/Gkalidass27/ashley-dashboard.git

# Set branch to main
git branch -M main

# Push to GitHub
git push -u origin main
```

---

## ✅ Step 3: Enable GitHub Pages

1. **Go to your repository**: https://github.com/Gkalidass27/ashley-dashboard
2. **Click**: "Settings" tab
3. **Click**: "Pages" in the left sidebar
4. **Under "Source"**:
   - Branch: Select **"main"**
   - Folder: Select **"/ (root)"**
5. **Click**: "Save"
6. **Wait 1-2 minutes** for deployment

---

## ✅ Step 4: Get Your Live URL

Your dashboard will be live at:

### 🌐 **https://gkalidass27.github.io/ashley-dashboard/**

You can share this URL with anyone!

---

## 🔄 Updating the Dashboard

### When You Make Changes

```bash
# Add changed files
git add .

# Commit changes
git commit -m "Update dashboard data"

# Push to GitHub
git push
```

The live site will automatically update in 1-2 minutes!

---

## 📊 What Gets Published

The following files will be available on GitHub:

✅ `dashboard.html` - Main dashboard (this is what people see)
✅ `dashboard_data.json` - Real-time data
✅ `README.md` - Repository documentation
✅ `DASHBOARD_SETUP_INSTRUCTIONS.md` - Setup guide
✅ `generate_dashboard_data.py` - Data generation script
✅ `refresh_dashboard.bat` - Refresh script
✅ `setup_auto_refresh.ps1` - Auto-update setup
✅ `requirements.txt` - Python dependencies

❌ Excel files (*.xlsx) - Excluded via .gitignore
❌ CSV files (*.csv) - Excluded via .gitignore
❌ Python cache - Excluded via .gitignore

---

## 🔒 Security Notes

### ⚠️ Important: Data Privacy

The `dashboard_data.json` file contains real business data. If this is sensitive:

**Option 1: Make Repository Private**
- Go to Settings → Danger Zone → Change visibility → Private
- Note: GitHub Pages requires a paid plan for private repos

**Option 2: Exclude Sensitive Data**
Add to `.gitignore`:
```
dashboard_data.json
```

Then use sample data for the public version.

**Option 3: Use Sample Data for Public**
- Keep real data local
- Commit only sample data to GitHub
- Update data locally only

---

## 🎯 Sharing Your Dashboard

Once deployed, you can share:

### 📧 Email
```
Check out our new Analytics Dashboard:
https://gkalidass27.github.io/ashley-dashboard/

Features:
- Real-time store & warehouse metrics
- Interactive charts and filters
- 845 active stores across US & Canada
```

### 💬 Teams/Slack
```
📊 New Dashboard Live!
https://gkalidass27.github.io/ashley-dashboard/
```

### 🔗 Direct Link
Just copy and paste:
```
https://gkalidass27.github.io/ashley-dashboard/
```

---

## 🛠️ Troubleshooting

### "Repository not found" error
- Make sure you created the repository on GitHub first
- Check the repository name is exactly: `ashley-dashboard`

### "Permission denied" error
- You may need to authenticate with GitHub
- Run: `git config --global user.name "Gkalidass27"`
- Run: `git config --global user.email "gkalidass@ashleyfurniture.com"`
- Try using GitHub Desktop or authenticate via browser

### GitHub Pages not working
- Wait 2-3 minutes after enabling
- Check Settings → Pages for deployment status
- Make sure repository is Public
- Verify `dashboard.html` is in the root folder

### Dashboard shows "Sample Data"
- The `dashboard_data.json` file needs to be committed
- Run `git add dashboard_data.json` and push again

---

## ✅ Verification Checklist

After deployment, verify:

- [ ] Repository created: https://github.com/Gkalidass27/ashley-dashboard
- [ ] Files pushed successfully
- [ ] GitHub Pages enabled in Settings
- [ ] Dashboard loads: https://gkalidass27.github.io/ashley-dashboard/
- [ ] Data displays correctly
- [ ] Filters work
- [ ] Charts render properly
- [ ] "Last Updated" timestamp shows

---

## 🎉 Success!

Once everything is working, you'll have:

✅ **Live Dashboard**: https://gkalidass27.github.io/ashley-dashboard/
✅ **Shareable URL** for your team
✅ **Version Control** via GitHub
✅ **Automatic Updates** when you push changes
✅ **Professional Presentation** for stakeholders

---

## 📞 Need Help?

If you encounter issues:

1. Check the troubleshooting section above
2. Review GitHub's documentation: https://docs.github.com/pages
3. Verify all files are committed: `git status`
4. Check deployment status in GitHub Settings → Pages

---

**Ready to deploy? Run `setup_github.bat` now!** 🚀

