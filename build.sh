#!/bin/bash
echo "🚀 Building Purvam's Portfolio..."
cd portfolio
echo "📦 Installing dependencies..."
npm ci
echo "🔨 Building Next.js application..."
npm run build
echo "✅ Build complete! Output in portfolio/out/"
