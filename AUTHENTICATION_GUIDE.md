# 🔐 Authentication & User Access Guide

## ✅ YES! Full Authentication System is Implemented

Your Campus Resource Sharing Platform has a complete authentication system that ensures:
- **Users MUST register or login** to access ANY content
- **Users can only register ONCE** with the same email
- **After registration, users can only login** (not re-register)

---

## 🎯 How It Works

### 1️⃣ **First Time Users - Registration**

**Access:** http://localhost:5173/register

**What happens:**
1. User enters:
   - Full Name
   - Email address (e.g., john.doe@gmail.com)
   - Phone number (optional)
   - Password

2. Click "Create account"

3. **System checks:**
   - ✅ Is email already registered?
   - If YES → Shows error: "Email already registered"
   - If NO → Creates account and logs user in automatically

4. **After successful registration:**
   - User is automatically logged in
   - Redirected to home page
   - Can access all features

### 2️⃣ **Returning Users - Login Only**

**Access:** http://localhost:5173/login

**What happens:**
1. User enters:
   - Email address
   - Password

2. Click "Sign in"

3. **System validates:**
   - Email exists in database
   - Password matches

4. **After successful login:**
   - User is logged in
   - Redirected to home page
   - Can access all features

---

## 🛡️ Protected Pages (Login Required)

Users CANNOT access these pages without logging in:

| Page | URL | Purpose |
|------|-----|---------|
| **Home** | `/` | View recent resources |
| **Browse Resources** | `/resources` | See all available items |
| **Resource Details** | `/resources/:id` | View individual resource |
| **Create Resource** | `/create-resource` | List a new item |
| **My Bookings** | `/bookings` | Manage rental requests |
| **Booking Details** | `/bookings/:id` | View specific booking |
| **Profile** | `/profile` | View/edit user profile |
| **Notifications** | `/notifications` | See notifications |

**If not logged in:** Automatically redirected to `/login`

---

## 🌐 Public Pages (No Login Required)

Only these pages are accessible without login:

| Page | URL | Purpose |
|------|-----|---------|
| **Login** | `/login` | Sign in to account |
| **Register** | `/register` | Create new account |

**If already logged in and visit these:** Automatically redirected to `/` (home)

---

## 🔒 Security Features

### 1. **One Email = One Account**
```
❌ Cannot register twice with same email
✅ Each email can only have ONE account
```

**Example:**
- User tries to register with `alice.johnson@gmail.com`
- If email already exists:
  ```
  Error: "Email already registered"
  ```
- User must use login page instead

### 2. **Password Security**
- Passwords are hashed using bcrypt
- Original passwords are NEVER stored
- Secure against data breaches

### 3. **JWT Authentication**
- Secure token-based authentication
- Tokens expire after 7 days
- Stored in localStorage and HTTP cookies

### 4. **Auto-Login Prevention**
- Already logged-in users can't access login/register pages
- Prevents confusion and duplicate sessions

---

## 🎨 User Flow Diagram

```
┌─────────────────────────────────────────┐
│  User visits website                    │
│  http://localhost:5173                  │
└──────────────┬──────────────────────────┘
               │
               ▼
        ┌──────────────┐
        │ Logged in?   │
        └──────┬───────┘
               │
        ┌──────┴──────┐
        │             │
    NO  │             │  YES
        ▼             ▼
┌───────────────┐  ┌──────────────────┐
│ Redirect to   │  │ Show Home Page   │
│ /login        │  │ with Resources   │
└───────┬───────┘  └──────────────────┘
        │
        ▼
┌───────────────────────────┐
│ Login Page                │
│                           │
│ Have account?             │
│  YES → Login              │
│  NO  → Register first     │
└───────┬───────────────────┘
        │
        ▼
┌───────────────────────────┐
│ After Login/Register      │
│ → Automatically redirect  │
│ → Access all features     │
│ → Can browse, create,     │
│   book resources          │
└───────────────────────────┘
```

---

## 📝 Registration Process Details

### Step 1: Check Email
```
Backend: prisma.user.findUnique({ where: { email } })

If email exists:
  → Return error: "Email already registered"
  → User sees red toast notification
  → Must go to login page

If email is new:
  → Continue to Step 2
```

### Step 2: Create Account
```
- Hash password (bcrypt)
- Create user record
- Create profile record
- Generate JWT token
- Send token to frontend
```

### Step 3: Auto Login
```
- Store token in localStorage
- Store token in cookies
- Update auth state
- Redirect to home page
```

---

## 🧪 Test the System

### Test 1: Try to Register with Existing Email

1. Go to: http://localhost:5173/register
2. Enter email: `alice.johnson@gmail.com`
3. Enter any password
4. Click "Create account"
5. **Expected:** Error message "Email already registered"

### Test 2: Register New User

1. Go to: http://localhost:5173/register
2. Enter:
   - Name: `Test User`
   - Email: `testuser@gmail.com`
   - Password: `password123`
3. Click "Create account"
4. **Expected:** 
   - Success message
   - Auto-login
   - Redirect to home page

### Test 3: Login with Existing Account

1. Go to: http://localhost:5173/login
2. Enter:
   - Email: `alice.johnson@gmail.com`
   - Password: `password123`
3. Click "Sign in"
4. **Expected:**
   - Success message
   - Redirect to home page
   - See all resources

### Test 4: Try to Access Protected Page Without Login

1. Make sure you're logged out
2. Go to: http://localhost:5173/resources
3. **Expected:** Automatically redirected to `/login`

### Test 5: Try to Access Login While Logged In

1. Make sure you're logged in
2. Go to: http://localhost:5173/login
3. **Expected:** Automatically redirected to `/` (home)

---

## 🔄 Session Management

### Login Session Duration
- JWT tokens valid for **7 days**
- User stays logged in even after closing browser
- Tokens stored in localStorage

### Logout
- Click avatar → "Logout"
- Clears token from localStorage
- Redirects to login page
- Must login again to access content

### Token Refresh
- If token expires (after 7 days):
  - User automatically logged out
  - Redirected to login page
  - Must login again

---

## 📊 Database Records

### User Registration Creates:

1. **User Record:**
```json
{
  "id": "unique-uuid",
  "email": "user@gmail.com",
  "password": "hashed-password",
  "role": "STUDENT"
}
```

2. **Profile Record:**
```json
{
  "id": "unique-uuid",
  "userId": "user-id",
  "displayName": "User Name",
  "phone": "+1234567890",
  "verificationStatus": "PENDING",
  "trustScore": 0
}
```

### Email Uniqueness Check:
```sql
SELECT * FROM User WHERE email = 'user@gmail.com';

If record exists:
  → Registration BLOCKED
  → User must login instead
```

---

## 🎯 Benefits of This System

✅ **Security:** Passwords are hashed, tokens are secure
✅ **User-Friendly:** Register once, login anytime
✅ **No Duplicates:** One email = one account
✅ **Auto-Protection:** All pages protected by default
✅ **Smart Redirects:** Users always end up in the right place
✅ **Session Persistence:** Stay logged in for 7 days
✅ **Clear Feedback:** Error messages guide users

---

## 🛠️ Technical Implementation

### Frontend (React)
- **Auth Store:** Zustand for state management
- **Protected Routes:** Custom wrapper components
- **Token Storage:** localStorage + HTTP cookies
- **Auto-redirect:** React Router navigation

### Backend (Node.js/Express)
- **Password Hashing:** bcrypt (10 rounds)
- **JWT Tokens:** jsonwebtoken library
- **Email Validation:** Prisma unique constraint
- **Middleware:** Auth middleware for protected endpoints

---

## 📞 Common User Questions

**Q: Do I need to register every time?**
A: No! Register only ONCE. After that, just login.

**Q: What if I forget my password?**
A: Currently, you'll need to register a new account with a different email. (Password reset can be added as future enhancement)

**Q: Can I use the same email twice?**
A: No. Each email can only be registered once.

**Q: How long do I stay logged in?**
A: 7 days. After that, you'll need to login again.

**Q: Can I see anything without logging in?**
A: No. All content requires authentication.

**Q: What happens if I try to access a protected page?**
A: You'll be automatically redirected to the login page.

---

## 🎉 Summary

✅ **YES** - Authentication system is fully implemented
✅ **YES** - Users must register or login to access content
✅ **YES** - Users can only register once per email
✅ **YES** - After registration, only login is needed
✅ **YES** - All main pages are protected
✅ **YES** - Logged-in users can't access login/register pages

**Your platform is secure and ready to use!** 🚀
