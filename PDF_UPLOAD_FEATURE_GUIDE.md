# 📄 PDF Upload & QR Code Feature - Complete Guide

## ✅ Feature Overview

A complete PDF upload system with automatic QR code generation has been successfully integrated into your Campus Resource Sharing Platform!

### 🎯 Key Features Implemented

1. **PDF File Upload** - Only accepts `.pdf` format
2. **File Validation** - Shows error for non-PDF files
3. **Form Validation** - Submit button disabled until all fields are completed
4. **QR Code Generation** - Unique QR code for each uploaded PDF
5. **PDF Preview** - View PDFs directly in browser
6. **Public Viewing** - Anyone can scan QR code to view PDF
7. **PDF Management** - View, preview, and delete uploaded PDFs
8. **Secure Storage** - PDFs stored securely on server

---

## 🚀 How to Use the Feature

### Step 1: Access PDF Upload Page

1. Log in to your account
2. Click on **"PDF Upload"** in the navigation menu
3. You'll see the upload form on the left side

### Step 2: Upload a PDF

1. **Enter Title**: Give your PDF document a title (e.g., "Course Notes - Chapter 5")
2. **Enter Description**: Provide a brief description of the document
3. **Select PDF File**: 
   - Click "Choose a PDF file" or drag and drop
   - Only `.pdf` files are accepted
   - Maximum file size: 10MB
4. **Submit**: Click "Upload & Generate QR Code" button

### Step 3: View QR Code & Share

After successful upload:
- ✅ QR code appears on the right side
- ✅ Document details displayed
- ✅ Two action buttons:
  - **Open PDF**: View PDF in browser
  - **Download QR**: Save QR code image

### Step 4: Share with QR Code

- Print or share the QR code
- Anyone scanning it will be able to view the PDF
- No login required to view via QR code
- PDF opens directly in browser/PDF viewer

---

## 🔒 Security & Validation

### File Validation
- ✅ Only PDF files accepted (`.pdf` or `application/pdf` MIME type)
- ✅ File size limit: 10MB
- ✅ Clear error messages for invalid files

### Form Validation
- ✅ Title field required
- ✅ Description field required  
- ✅ Valid PDF file required
- ✅ Submit button disabled until all conditions met

### Access Control
- ✅ Upload requires authentication
- ✅ Users can only delete their own PDFs
- ✅ Public viewing via QR code (no auth needed)
- ✅ Unique QR code per document

---

## 📁 Technical Implementation

### Backend (Node.js + Express)

**New Files Created:**
- `backend/src/controllers/pdf.controller.ts` - PDF upload, view, delete logic
- `backend/src/routes/pdf.routes.ts` - API routes for PDF operations
- `backend/prisma/schema.prisma` - Updated with PDFDocument model

**API Endpoints:**
```
POST   /api/pdfs/upload         - Upload PDF (requires auth)
GET    /api/pdfs/my-pdfs        - Get user's PDFs (requires auth)
GET    /api/pdfs/:id            - Get PDF metadata (requires auth)
GET    /api/pdfs/view/:id       - View PDF file (public)
DELETE /api/pdfs/:id            - Delete PDF (requires auth)
```

**Storage:**
- PDFs stored in: `backend/uploads/pdfs/`
- Filenames: UUID-based (e.g., `abc123-def456.pdf`)
- Database: SQLite with PDFDocument table

### Frontend (React + TypeScript)

**New Files Created:**
- `frontend/src/pages/PDFUploadPage.tsx` - Main upload interface
- `frontend/src/pages/PDFViewerPage.tsx` - Public PDF viewer

**Features:**
- Drag & drop file upload
- Real-time validation
- QR code preview
- PDF list with cards
- Responsive design

### Database Schema

**PDFDocument Table:**
```sql
- id: UUID (primary key)
- userId: Foreign key to User
- title: Document title
- description: Document description
- filename: Server filename
- originalName: Original uploaded filename
- fileSize: File size in bytes
- qrCode: Base64 encoded QR code image
- viewUrl: Public URL for QR code
- createdAt: Timestamp
- updatedAt: Timestamp
```

---

## 🌐 URLs & Routes

### Frontend Routes
```
/pdf-upload          - PDF upload page (protected)
/view-pdf/:id        - Public PDF viewer (no auth)
```

### Backend API
```
http://localhost:5000/api/pdfs/*        - PDF API endpoints
```

### QR Code URLs
When someone scans a QR code, they're directed to:
```
http://localhost:5173/view-pdf/{unique-id}
```

This page displays the PDF in an embedded viewer with download option.

---

## 💡 Usage Examples

### Example 1: Upload Course Notes
1. Navigate to PDF Upload
2. Title: "Data Structures - Week 5 Notes"
3. Description: "Binary trees and AVL tree balancing"
4. Upload: `week5-notes.pdf`
5. Get QR code → Share with classmates

### Example 2: Share Research Paper
1. Title: "Research Paper - AI in Education"
2. Description: "Analysis of machine learning applications in modern education"
3. Upload PDF
4. Download QR code
5. Add QR code to presentation slides

### Example 3: Event Documents
1. Title: "Campus Event - Rules & Guidelines"
2. Description: "Complete rules for the annual tech fest"
3. Upload PDF
4. Print QR code on posters
5. Attendees scan to view rules instantly

---

## 🎨 UI Features

### Upload Form
- Clean, modern design
- Drag & drop support
- Visual file validation feedback
- Progress indicators
- Error messages with icons

### QR Preview Card
- Large, scannable QR code (300x300px)
- Document metadata display
- Action buttons (View, Download)
- File information (name, size, date)

### PDF List
- Grid layout (responsive)
- Card-based design
- Quick preview buttons
- Delete functionality
- File size and date display

### PDF Viewer
- Full-screen view
- Inline PDF display
- Download button
- Clean header with branding
- Mobile-responsive

---

## 🔧 Customization Options

### Change File Size Limit
In `PDFUploadPage.tsx` line ~63:
```typescript
if (file.size > 10 * 1024 * 1024) { // Change 10 to desired MB
```

### Change QR Code Size
In `pdf.controller.ts` line ~58:
```typescript
width: 300,  // Change to desired pixel width
```

### Change Storage Location
In `pdf.controller.ts` line ~9:
```typescript
const uploadsDir = path.join(__dirname, '../../uploads/pdfs');
```

---

## 🧪 Testing Instructions

### Test 1: Valid PDF Upload
1. Go to `/pdf-upload`
2. Fill all fields
3. Upload a valid PDF
4. Should see success toast
5. QR code appears

### Test 2: Invalid File Type
1. Try uploading a `.docx` or `.jpg` file
2. Should see error: "Only PDF files are allowed"
3. Submit button remains disabled

### Test 3: QR Code Scanning
1. Upload a PDF
2. Download the QR code
3. Scan with phone camera
4. Should open PDF viewer page
5. PDF displays correctly

### Test 4: Public Access
1. Get a PDF's view URL (e.g., `/view-pdf/abc123`)
2. Open in incognito browser
3. PDF should load without login

### Test 5: Delete PDF
1. Click delete button on any PDF card
2. Confirm deletion
3. PDF removed from list
4. File deleted from server

---

## 📊 File Structure

```
vibrant/
├── backend/
│   ├── src/
│   │   ├── controllers/
│   │   │   └── pdf.controller.ts          ✨ NEW
│   │   ├── routes/
│   │   │   └── pdf.routes.ts              ✨ NEW
│   │   └── app.ts                         ✏️ UPDATED
│   ├── prisma/
│   │   └── schema.prisma                  ✏️ UPDATED
│   └── uploads/
│       └── pdfs/                          ✨ NEW (auto-created)
│
└── frontend/
    └── src/
        ├── pages/
        │   ├── PDFUploadPage.tsx          ✨ NEW
        │   └── PDFViewerPage.tsx          ✨ NEW
        ├── components/
        │   └── Navbar.tsx                 ✏️ UPDATED
        └── App.tsx                        ✏️ UPDATED
```

---

## 🚦 Current Status

✅ **Backend**
- PDF upload controller implemented
- API routes configured
- Database schema updated
- File storage system working
- QR code generation functional

✅ **Frontend**
- Upload page designed and functional
- Viewer page implemented
- Navigation updated
- Routing configured
- Responsive design complete

✅ **Integration**
- Backend + Frontend connected
- File upload working
- QR codes generated
- Public viewing operational
- Delete functionality working

---

## 🎯 Access the Feature

**Website URL**: http://localhost:5173

**Direct Access**:
1. Login with test account
2. Click "PDF Upload" in navbar
3. Start uploading PDFs!

**Test Account**:
- Email: `alice.johnson@gmail.com`
- Password: `password123`

---

## 📝 Feature Checklist

- [x] Accept only PDF format
- [x] Show validation error for non-PDF files
- [x] Disable submit until all fields completed
- [x] Display "Preview PDF" button after submission
- [x] Generate unique QR code per PDF
- [x] QR code displayed in preview
- [x] Scan QR → View PDF in browser
- [x] Each QR code links to unique PDF
- [x] Secure PDF storage
- [x] View-only URL (no download required)
- [x] Responsive card layout
- [x] Professional, modern UI
- [x] Integrated into website workflow

---

## 🎉 Success!

The PDF Upload & QR Code feature is **fully functional** and ready to use! 

Navigate to http://localhost:5173/pdf-upload to start using it right away!
