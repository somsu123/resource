# 🚀 Backend Startup Guide

## Step-by-Step Instructions

### 1. Open Terminal in Backend Folder
```bash
cd c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend
```

### 2. Make Sure .env File Exists
```bash
# If .env doesn't exist, copy from example:
copy .env.example .env
```

Your `.env` should contain:
```env
DATABASE_URL="file:./dev.db"
JWT_SECRET="my-super-secret-key-12345"
JWT_EXPIRES_IN="7d"
PORT=5000
NODE_ENV="development"
FRONTEND_URL="http://localhost:5173"
```

### 3. Install Dependencies (if not done)
```bash
npm install
```

### 4. Generate Prisma Client
```bash
npx prisma generate
```

### 5. Create Database
```bash
npx prisma migrate dev --name init
```

### 6. Seed Sample Data
```bash
npm run seed
```

You should see:
```
🌱 Starting seed...
✅ Created 5 users
✅ Created 15 resources
✅ Created 6 bookings
✅ Created 5 messages
✅ Created 2 ratings
✅ Created 3 notifications
🎉 Seed completed successfully!
```

### 7. Start Server
```bash
npm run dev
```

You should see:
```
🚀 Server running on port 5000
📡 Socket.IO initialized
🌍 Environment: development
```

### 8. Test Backend
Open browser: `http://localhost:5000/health`

Should return:
```json
{"status":"ok","timestamp":"..."}
```

---

## ✅ Backend is Now Running!

Your database file is at:
```
c:\Users\somsubhro\OneDrive\Desktop\vibrant\backend\prisma\dev.db
```

Open it in **DB Browser for SQLite** to view your data!

---

## 🧪 Test Login (Optional)

Use Postman or any API client to test login:

**Endpoint:** `POST http://localhost:5000/api/auth/login`

**Headers:**
```
Content-Type: application/json
```

**Body:**
```json
{
  "email": "alice.johnson@gmail.com",
  "password": "password123"
}
```

You should get back a token and user data!

---

Keep this terminal running. Now we'll start the frontend in a new terminal.
