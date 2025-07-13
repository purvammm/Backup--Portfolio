# Purvam Portfolio Deployment Script for Cloudflare Pages

Write-Host "🚀 Starting deployment process..." -ForegroundColor Green

# Build the project
Write-Host "📦 Building the project..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Build successful!" -ForegroundColor Green
    
    # Deploy to Cloudflare Pages
    Write-Host "🌐 Deploying to Cloudflare Pages..." -ForegroundColor Yellow
    npx wrangler pages deploy out --project-name=purvam-portfolio --compatibility-date=2025-07-13
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "🎉 Deployment successful!" -ForegroundColor Green
        Write-Host "🔗 Your portfolio is live at: https://purvam-portfolio.pages.dev" -ForegroundColor Cyan
    } else {
        Write-Host "❌ Deployment failed!" -ForegroundColor Red
    }
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
}
