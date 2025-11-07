# Login & Registration Test Guide

## ✅ Current Status

Both servers are running successfully:
- **Backend**: http://localhost:5000 ✅
- **Frontend**: http://localhost:5173 ✅
- **Database**: Seeded with test data ✅

## 🧪 Test the Login/Registration

### Method 1: Quick Browser Test

1. Open your browser and go to: **http://localhost:5173**
2. Click on **"Get Started"** or navigate to **"/login"**
3. Use these test credentials:
   - **Email**: `alice.johnson@gmail.com`
   - **Password**: `password123`
4. Click **"Sign in"**

### Method 2: Test Registration

1. Go to: **http://localhost:5173/register**
2. Fill in the form:
   - **Full Name**: Your Name
   - **Email**: yournewemail@gmail.com
   - **Phone**: +1234567890 (optional)
   - **Password**: yourpassword
3. Click **"Create account"**

## 🔍 Common Issues & Solutions

### Issue 1: "Failed to fetch" or CORS Error
**Solution**: Make sure both servers are running
```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend  
cd frontend
npm run dev
```

### Issue 2: Login Button Doesn't Work
**Possible Causes**:
- Backend not running
- Wrong API URL in frontend .env
- Network error

**Check**:
1. Open browser DevTools (F12)
2. Go to Console tab
3. Look for errors
4. Go to Network tab and try logging in - check if the request reaches the backend

### Issue 3: Page Stays Loading
**Solution**: The `checkAuth()` function might be failing
- Clear your browser's localStorage
- Refresh the page
- Try logging in again

### Issue 4: Redirect Loop
**Solution**: 
- Clear cookies and localStorage
- Close and reopen the browser
- Try in incognito mode

## 🔧 Manual API Test

Test if the backend is responding correctly:

### Test Login Endpoint
Open PowerShell and run:
```powershell
Invoke-RestMethod -Uri "http://localhost:5000/api/auth/login" -Method POST -ContentType "application/json" -Body '{"email":"alice.johnson@gmail.com","password":"password123"}'
```

**Expected Response**: You should see user data and a token

### Test Registration Endpoint
```powershell
Invoke-RestMethod -Uri "http://localhost:5000/api/auth/register" -Method POST -ContentType "application/json" -Body '{"email":"newuser@test.com","password":"password123","displayName":"Test User","phone":"+1234567890"}'
```

## 📊 Verify Servers Are Running

### Check Backend
Open: http://localhost:5000/health
**Expected**: `{"status":"ok","timestamp":"..."}`

### Check Frontend
Open: http://localhost:5173
**Expected**: You should see the landing page

## 🐛 Debug Steps

### Step 1: Check Browser Console
1. Open http://localhost:5173
2. Press F12 to open DevTools
3. Go to Console tab
4. Look for any red error messages

### Step 2: Check Network Requests
1. In DevTools, go to Network tab
2. Try to log in
3. Look for the request to `/api/auth/login`
4. Check the Status Code (should be 200)
5. Check the Response data

### Step 3: Check Backend Logs
Look at the terminal where the backend is running. You should see:
```
🚀 Server running on port 5000
📡 Socket.IO initialized
🌍 Environment: development
```

### Step 4: Check localStorage
1. In DevTools, go to Application tab (Chrome) or Storage tab (Firefox)
2. Look at localStorage
3. After login, you should see a `token` entry

## ✨ What Should Happen After Login

1. You see a success toast notification: "Login successful!"
2. You're redirected to `/home`
3. You see the main navigation bar
4. You can browse resources and access other features

## 🔑 Test Accounts Available

| Email | Password | Role | Name |
|-------|----------|------|------|
| alice.johnson@gmail.com | password123 | Student | Alice Johnson |
| bob.smith@gmail.com | password123 | Student | Bob Smith |
| carol.davis@gmail.com | password123 | Student | Carol Davis |
| admin.campus@gmail.com | password123 | Admin | Admin User |

## 🆘 Still Having Issues?

If you're still experiencing problems, please provide:
1. Screenshot of browser console errors
2. Screenshot of Network tab showing the failed request
3. Description of what happens when you click login/register
4. Backend terminal output

## 📝 Quick Reset

If everything seems broken, do a full reset:

```bash
# Stop all servers (Ctrl+C in both terminals)

# Backend reset
cd backend
rm dev.db
npm run prisma:migrate
npm run seed
npm run dev

# Frontend restart (in new terminal)
cd frontend
npm run dev
```

Then try logging in again with the test credentials.
