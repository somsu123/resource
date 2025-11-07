Write-Host "`nTesting Backend Login..." -ForegroundColor Cyan

try {
    $loginBody = '{"email":"alice.johnson@gmail.com","password":"password123"}'
    Write-Host "Sending login request..." -ForegroundColor Yellow
    
    $response = Invoke-RestMethod -Uri 'http://localhost:5000/api/auth/login' -Method Post -Body $loginBody -ContentType 'application/json'
    
    Write-Host "`nSUCCESS!" -ForegroundColor Green
    Write-Host "User: $($response.user.email)" -ForegroundColor Green
    Write-Host "Token received: Yes" -ForegroundColor Green
    
} catch {
    Write-Host "`nFAILED!" -ForegroundColor Red
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Status: $($_.Exception.Response.StatusCode.value__)" -ForegroundColor Red
}
