# SQLite Setup Instructions

## ✅ Database Configured for SQLite!

Your project is now configured to use SQLite instead of PostgreSQL. This is much simpler - no database server needed!

## 🚀 Quick Setup Steps

### 1. Update Your .env File

If you don't have a `.env` file yet, create one:

```bash
cd c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend
copy .env.example .env
```

Your `.env` file should contain:

```env
DATABASE_URL="file:./dev.db"
JWT_SECRET="my-super-secret-key-12345"
JWT_EXPIRES_IN="7d"
PORT=5000
NODE_ENV="development"
CLOUDINARY_CLOUD_NAME="optional"
CLOUDINARY_API_KEY="optional"
CLOUDINARY_API_SECRET="optional"
FRONTEND_URL="http://localhost:5173"
```

**Note:** Cloudinary settings are optional. The app will work without them (just won't upload images to cloud).

### 2. Create Database and Tables

Run these commands in order:

```bash
cd c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend

# Generate Prisma client
npx prisma generate

# Create database file and tables
npx prisma migrate dev --name init

# Seed with sample data
npm run seed
```

### 3. Start the Server

```bash
npm run dev
```

## 📁 Where is the Database?

After running the migration, you'll find the SQLite database file at:

```
c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend\prisma\dev.db
```

You can open this file with **DB Browser for SQLite**!

## 🔍 View Database in DB Browser

1. Open **DB Browser for SQLite**
2. Click **"Open Database"**
3. Navigate to: `c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend\prisma\dev.db`
4. You'll see all your tables: User, Profile, Resource, Booking, Message, Rating, etc.

## 🎯 What Changed?

- ✅ Changed from PostgreSQL to SQLite
- ✅ Database URL now points to a local file
- ✅ No database server needed
- ✅ Everything else works exactly the same!

## 📊 Database Tables

After seeding, you'll have:
- **5 users** (alice, bob, carol, david, admin)
- **15 resources** (textbooks, equipment, notes)
- **6 bookings** (various statuses)
- **5 messages** (chat history)
- **2 ratings** (reviews)
- **3 notifications**

## 🔑 Test Login Credentials

- Email: `alice.johnson@gmail.com`
- Password: `password123`

Or any of these:
- `bob.smith@gmail.com` / `password123`
- `carol.davis@gmail.com` / `password123`
- `admin.campus@gmail.com` / `password123` (Admin role)

## ⚠️ Troubleshooting

### If migration fails:
```bash
# Delete the database and start fresh
del prisma\dev.db
npx prisma migrate dev --name init
npm run seed
```

### If you get "database is locked":
- Close DB Browser for SQLite
- Run the commands again

### If seed fails:
- Make sure migration completed successfully
- Check that dev.db file exists in prisma folder

## 🎉 That's It!

Much simpler than PostgreSQL! Your database is just a file that you can:
- Copy/backup easily
- Open in DB Browser
- Delete and recreate anytime
- Commit to git (if small enough)

Enjoy building your Campus Resource Sharing Platform! 🚀
