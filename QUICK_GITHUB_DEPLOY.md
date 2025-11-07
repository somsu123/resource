# ⚡ Quick GitHub Pages Deploy (5 Minutes!)

## 🎯 Super Simple Steps

### Step 1: Create GitHub Account (if needed)
Go to https://github.com and sign up (free!)

### Step 2: Run These Commands

Open terminal in your project folder and run:

```bash
# Go to your project
cd c:/Users/ritam/OneDrive/Desktop/vibrant/vibrant

# Initialize Git
git init

# Add all files
git add .

# Commit
git commit -m "CampusShare - Campus Resource Sharing Platform"
```

### Step 3: Create Repository on GitHub

1. Go to https://github.com/new
2. **Repository name**: `campusshare`
3. **Public** (for free GitHub Pages)
4. **DON'T** check any boxes
5. Click **"Create repository"**

### Step 4: Push Code

**REPLACE `YOUR_USERNAME` with your actual GitHub username:**

```bash
git remote add origin https://github.com/YOUR_USERNAME/campusshare.git
git branch -M main
git push -u origin main
```

### Step 5: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **"Settings"** tab
3. Click **"Pages"** in left sidebar
4. Under **"Source"**, select: **GitHub Actions**
5. Done!

### Step 6: Update Config File

Open `frontend/vite.config.ts` and change it to:

```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  base: '/campusshare/',  // 👈 ADD THIS LINE
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  server: {
    port: 5173,
    proxy: {
      '/api': {
        target: 'http://localhost:5000',
        changeOrigin: true,
      },
    },
  },
})
```

**Then push the change:**
```bash
git add frontend/vite.config.ts
git commit -m "Add base URL for GitHub Pages"
git push
```

### Step 7: Wait & Visit

1. Go to **Actions** tab in your GitHub repo
2. Watch the deployment (takes 2-3 minutes)
3. When done (green ✅), visit:

```
https://YOUR_USERNAME.github.io/campusshare/
```

**DONE!** 🎉

---

## 🎊 Your Site is Live!

Your CampusShare platform is now:
- ✅ Live on the internet
- ✅ Accessible anywhere
- ✅ Has HTTPS security
- ✅ Ready to share!

---

## 🔄 To Update Your Site

Just run these commands:

```bash
git add .
git commit -m "Your update message"
git push
```

GitHub will automatically rebuild and deploy!

---

## 📱 Share Your Site

**Your live URL:**
```
https://YOUR_USERNAME.github.io/campusshare/
```

**Perfect for:**
- Portfolio
- Resume
- LinkedIn
- Job applications
- College projects

---

**That's it! You're live on GitHub Pages!** 🚀
