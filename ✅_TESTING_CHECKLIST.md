# ✅ CampusShare Testing Checklist

## 🚀 Site is Running!

**URL:** http://localhost:5173

**Status:** Both servers are running perfectly!

---

## 🧪 Test Everything

### 1️⃣ Landing Page
- [ ] Page loads correctly
- [ ] Hero section displays
- [ ] Login button visible
- [ ] Sign Up button visible
- [ ] **Logo dropdown** works (click logo)

---

### 2️⃣ Registration
**Go to:** http://localhost:5173/register

- [ ] Form loads
- [ ] Enter new email and password
- [ ] Click "Sign Up"
- [ ] Redirects to dashboard after registration

---

### 3️⃣ Login - Regular User
**Go to:** http://localhost:5173/login

**Credentials:**
```
Email: alice.johnson@gmail.com
Password: password123
```

**Test:**
- [ ] Login form loads
- [ ] Enter credentials
- [ ] Click "Login"
- [ ] Successfully logs in
- [ ] Redirects to `/home` (User Dashboard)
- [ ] See navbar with Home, Browse, Bookings
- [ ] **Click logo** → See dropdown menu with user options

---

### 4️⃣ Login - Admin User
**Logout first, then login as:**
```
Email: admin.campus@gmail.com
Password: password123
```

**Test:**
- [ ] Login successful
- [ ] See orange "Admin" button in navbar
- [ ] **Click logo** → See admin options in dropdown
- [ ] Click "Admin" button → Goes to `/admin`
- [ ] **Check navbar** → Home/Browse/Bookings hidden ✅
- [ ] Only logo, Admin, notifications, profile visible

---

### 5️⃣ User Dashboard Features

**After logging in as regular user:**

- [ ] Dashboard loads with hero section
- [ ] Recent resources display (if any exist)
- [ ] Click "Browse Resources" → Goes to `/resources`
- [ ] Click "List Item" → Goes to create resource page
- [ ] Click "Bookings" → Goes to bookings page
- [ ] Click profile dropdown → See profile option
- [ ] **Logo dropdown** shows correct user options

---

### 6️⃣ Admin Dashboard

**Login as admin and go to `/admin`:**

- [ ] Dashboard loads
- [ ] **4 stat cards** display (Users, Resources, Bookings, Verified)
- [ ] **4 charts** render:
  - User Growth (line chart)
  - Booking Activity (bar chart)
  - Category Breakdown (pie chart)
  - Booking Status (pie chart)
- [ ] **Top Contributors** table shows users
- [ ] **Quick Action buttons** work:
  - Manage Users
  - Manage Resources
  - Manage Bookings

---

### 7️⃣ Admin - User Management
**Go to:** `/admin/users`

- [ ] Page loads
- [ ] User list displays in table
- [ ] Search box works
- [ ] Filter by role works
- [ ] Pagination works (if more than 20 users)
- [ ] Can view user details
- [ ] Can change user roles

---

### 8️⃣ Admin - Resource Management
**Go to:** `/admin/resources`

- [ ] Page loads
- [ ] Resources display in table
- [ ] Search works
- [ ] Category filter works
- [ ] Status filter works
- [ ] Can delete resources
- [ ] Pagination works

---

### 9️⃣ Admin - Booking Management (NEW FEATURES!)
**Go to:** `/admin/bookings`

**Check these NEW features:**
- [ ] Page loads with 7 columns:
  - **What Was Booked** (resource name + description)
  - **Type** (color-coded badge)
  - **Who Booked It** (avatar + name + email)
  - **Owned By** (avatar + name + email)
  - **Booking Period** (dates + duration in days)
  - **Status** (color-coded)
  - **Booked On** (date)
- [ ] Resource descriptions show (first 80 chars)
- [ ] Type badges are color-coded
- [ ] User avatars display
- [ ] Duration calculation shows (X days)
- [ ] Status filter works
- [ ] Pagination works

---

### 🔟 Logo Dropdown Menu (NEW FEATURE!)

**Test on different pages:**

#### As Visitor (Not Logged In):
- [ ] Click logo → Menu opens
- [ ] See: Home, Login, Sign Up
- [ ] Click outside → Menu closes
- [ ] Click a link → Navigates and closes

#### As Regular User (User Pages):
- [ ] Click logo → Menu opens
- [ ] See: Dashboard, Browse, Bookings, List Item, Profile
- [ ] Click outside → Menu closes
- [ ] Click a link → Works correctly

#### As Admin (User Pages):
- [ ] Click logo → Menu opens
- [ ] See: User options + Admin Panel section
- [ ] Admin Dashboard link visible
- [ ] Click outside → Menu closes

#### As Admin (Admin Pages):
- [ ] Click logo on `/admin` → Menu opens
- [ ] See: Admin Dashboard, Manage Users, Resources, Bookings
- [ ] See: "Back to User View" link
- [ ] Click outside → Menu closes
- [ ] Links work correctly

---

### 1️⃣1️⃣ Navigation & UI

- [ ] All navbar links work
- [ ] Profile dropdown works
- [ ] Logout works
- [ ] Page transitions smooth
- [ ] No console errors (press F12 to check)
- [ ] Images load properly
- [ ] Forms validate correctly
- [ ] Toast notifications appear

---

### 1️⃣2️⃣ Create Resource
**Login as user, click "List Item":**

- [ ] Form loads
- [ ] Can fill in details
- [ ] Can upload photos (optional)
- [ ] Can submit form
- [ ] Resource created successfully

---

### 1️⃣3️⃣ Browse Resources
**Go to:** `/resources`

- [ ] Resources display in grid
- [ ] Can click on a resource
- [ ] Resource detail page loads
- [ ] Can request to book (if logged in)

---

### 1️⃣4️⃣ Profile
**Go to:** `/profile`

- [ ] Profile loads
- [ ] Shows user information
- [ ] Can edit profile
- [ ] Can upload avatar
- [ ] Can update details

---

## 🎯 Key Features to Verify

### NEW Features (Just Added):
- ✅ **Logo dropdown menu** - Click to open, click outside to close
- ✅ **Clean admin navbar** - User links hidden on admin pages
- ✅ **Detailed admin bookings** - Full resource info, types, users, duration

### Core Features:
- ✅ Login/Registration
- ✅ User Dashboard
- ✅ Admin Dashboard with charts
- ✅ Resource browsing
- ✅ Booking system
- ✅ User management
- ✅ Role-based access control

---

## 🔐 Test Credentials

### Regular User:
```
Email: alice.johnson@gmail.com
Password: password123
```

### Admin User:
```
Email: admin.campus@gmail.com
Password: password123
```

---

## ❌ Common Issues & Fixes

### Login Fails:
1. Clear browser cache: Ctrl + Shift + Delete
2. Hard refresh: Ctrl + F5
3. Try incognito window: Ctrl + Shift + N

### Page Not Loading:
1. Check backend is running (port 5000)
2. Check frontend is running (port 5173)
3. Refresh the page

### Charts Not Showing:
1. Login as admin
2. Make sure data exists (users, resources, bookings)
3. Refresh the page

---

## ✅ Success Criteria

**All features working if:**
- ✅ Landing page loads
- ✅ Login works for both user types
- ✅ Logo dropdown menu works
- ✅ Admin navbar is clean on admin pages
- ✅ Admin bookings show detailed info
- ✅ Charts render on admin dashboard
- ✅ Navigation works throughout
- ✅ No console errors

---

## 🎊 READY TO TEST!

**Site URL:** http://localhost:5173

**Start testing now!** Follow the checklist above.

**Report any issues you find!** 🚀

---

**Created:** November 8, 2025, 3:49 AM  
**Status:** ✅ Ready for Testing  
**All Features:** ✅ Active
