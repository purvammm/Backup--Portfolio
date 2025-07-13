# Purvam Portfolio Build and Deploy Script for Cloudflare Pages

Write-Host "🚀 Starting build and deployment process..." -ForegroundColor Green

# Build the project first
Write-Host "📦 Building the project..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Build successful!" -ForegroundColor Green

    # Check if out directory exists
    if (Test-Path "out") {
        Write-Host "📁 Output directory found, proceeding with deployment..." -ForegroundColor Green

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
        Write-Host "❌ Output directory 'out' not found after build!" -ForegroundColor Red
    }
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
}
