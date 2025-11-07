Write-Host "`n=== Testing Backend API ===" -ForegroundColor Cyan

# Test 1: Health
Write-Host "`n1. Health Check..." -ForegroundColor Yellow
try {
    $health = Invoke-RestMethod -Uri 'http://localhost:5000/health' -Method Get
    Write-Host "SUCCESS - Status: $($health.status)" -ForegroundColor Green
} catch {
    Write-Host "FAILED: $_" -ForegroundColor Red
}

# Test 2: Login  
Write-Host "`n2. Login Test..." -ForegroundColor Yellow
try {
    $loginBody = '{"email":"alice.johnson@gmail.com","password":"password123"}'
    $loginResponse = Invoke-RestMethod -Uri 'http://localhost:5000/api/auth/login' -Method Post -Body $loginBody -ContentType 'application/json'
    Write-Host "SUCCESS - User: $($loginResponse.user.email)" -ForegroundColor Green
    $global:token = $loginResponse.token
} catch {
    Write-Host "FAILED: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 3: Get Me
Write-Host "`n3. Get Current User..." -ForegroundColor Yellow
if ($global:token) {
    try {
        $headers = @{'Authorization' = "Bearer $global:token"}
        $meResponse = Invoke-RestMethod -Uri 'http://localhost:5000/api/auth/me' -Method Get -Headers $headers
        Write-Host "SUCCESS - $($meResponse.user.email)" -ForegroundColor Green
    } catch {
        Write-Host "FAILED: $($_.Exception.Message)" -ForegroundColor Red
    }
} else {
    Write-Host "SKIPPED - No token" -ForegroundColor Yellow
}

Write-Host "`n=== Complete ===" -ForegroundColor Cyan
