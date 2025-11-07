# 🔧 Troubleshooting Login/Registration Issues

## ✅ Current Status

Both servers are running:
- **Backend:** http://localhost:5000 ✅
- **Frontend:** http://localhost:5173 ✅

## 🧪 Quick Tests

### Test 1: Direct API Test
Open the file: `TEST_LOGIN.html` in your browser
- If it works: Backend is fine, issue is in frontend
- If it fails: Backend has CORS or connection issues

### Test 2: Check Browser Console
1. Open http://localhost:5173
2. Press F12 to open Developer Tools
3. Go to Console tab
4. Try to login
5. Look for red error messages

## 🔍 Common Issues & Solutions

### Issue 1: "Network Error" or "Failed to Fetch"

**Cause:** Backend not running or CORS issue

**Solution:**
```bash
# Check if backend is running
curl http://localhost:5000/health

# If not, restart backend
cd c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend
npm run dev
```

### Issue 2: Blank Page After Login

**Cause:** Frontend routing issue or data not loading

**Solution:**
1. Clear browser cache (Ctrl+Shift+Delete)
2. Clear localStorage:
   - Open Console (F12)
   - Type: `localStorage.clear()`
   - Press Enter
3. Hard refresh (Ctrl+Shift+R)

### Issue 3: "Invalid Credentials" Error

**Cause:** Wrong email format in database

**Solution:**
Use the correct Gmail addresses:
- Email: `alice.johnson@gmail.com`
- Password: `password123`

### Issue 4: Form Not Submitting

**Cause:** JavaScript error or validation issue

**Solution:**
1. Open Console (F12)
2. Look for errors
3. Check if button is clickable
4. Try disabling browser extensions

### Issue 5: CORS Error in Console

**Error Message:** "Access to fetch blocked by CORS policy"

**Solution:**
Backend .env should have:
```
FRONTEND_URL=http://localhost:5173
```

## 📝 Step-by-Step Login Test

1. **Open Frontend:** http://localhost:5173

2. **Navigate to Login:**
   - Click "Login" button in top-right
   - Or go to http://localhost:5173/login

3. **Enter Credentials:**
   - Email: `alice.johnson@gmail.com`
   - Password: `password123`

4. **Click "Sign in"**

5. **Expected Result:**
   - Success toast notification
   - Redirect to home page (/)
   - See navigation bar with user avatar
   - See recent listings

## 🛠️ Manual API Test (PowerShell)

```powershell
# Test Login
Invoke-WebRequest -Uri http://localhost:5000/api/auth/login -Method POST -Headers @{"Content-Type"="application/json"} -Body '{"email":"alice.johnson@gmail.com","password":"password123"}'

# Should return: StatusCode: 200
```

## 📱 What Should Work

### Login Page (http://localhost:5173/login)
- [x] Email input field
- [x] Password input field
- [x] "Sign in" button
- [x] "Sign up" link
- [x] Test credentials displayed

### Registration Page (http://localhost:5173/register)
- [x] Full Name input
- [x] Email input
- [x] Phone input (optional)
- [x] Password input
- [x] "Create account" button
- [x] "Sign in" link

## 🔄 If Nothing Works - Nuclear Reset

```bash
# Stop all servers
Get-Process -Name node -ErrorAction SilentlyContinue | Stop-Process -Force

# Clear frontend cache
cd c:\Users\somsubhro\OneDrive\Desktop\vibrant\frontend
Remove-Item -Recurse -Force node_modules\.vite -ErrorAction SilentlyContinue

# Restart backend
cd c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend
npm run dev

# In NEW terminal, restart frontend
cd c:\Users\somsubhro\OneDrive\Desktop\vibrant\frontend
npm run dev
```

## 📊 Expected Behavior

### Successful Login:
1. Click "Sign in" → Button shows "Signing in..."
2. Green toast: "Login successful!"
3. Redirect to "/" (home page)
4. Navigation bar appears with:
   - Home, Browse, Bookings links
   - "List Item" button
   - Bell icon (notifications)
   - User avatar/initial

### Failed Login:
1. Red toast appears with error message
2. Stay on login page
3. Can try again

## 🌐 Browser Compatibility

Tested on:
- Chrome (Recommended)
- Edge
- Firefox

If using Safari, try Chrome instead.

## 📞 Still Not Working?

Check:
1. Both servers running (see "Current Status" above)
2. No firewall blocking ports 5000 or 5173
3. No other apps using same ports
4. Browser console for specific errors
