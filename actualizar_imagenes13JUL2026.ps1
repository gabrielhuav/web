# ==========================================
# Script de Actualización Web Personal
# ==========================================
$webPath = "C:\Users\gabri\Documents\GitHub Desktop\web"

Write-Host "🔄 Iniciando actualización de la web personal..." -ForegroundColor Cyan

# 1. Definir reemplazos de imágenes rotas por Microlink (Screenshots en tiempo real)
$imageReplacements = @{
    # Booksnexus
    "https://github.com/user-attachments/assets/51a06d92-129a-455e-aa63-19f5bf40cf43" = "https://api.microlink.io/?url=https://diegocstln.github.io/mi-proyecto-bd/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/60492584-a657-4edb-8a8a-8891fa97d270" = "https://api.microlink.io/?url=https://diegocstln.github.io/mi-proyecto-bd/?mode=local&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/f892b50d-cd25-46fe-a49b-ca60ab9ef6dd" = "https://api.microlink.io/?url=https://diegocstln.github.io/mi-proyecto-bd/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Scynara
    "https://github.com/user-attachments/assets/10566f3a-1c23-44ff-bb3b-c632f3267792" = "https://api.microlink.io/?url=https://scynara-frontend.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/2fcb94ea-742c-4cb6-a589-be5cbca2bbbd" = "https://api.microlink.io/?url=https://scynara-frontend.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/91ae629c-61a1-42f1-aca7-82372e0dc341" = "https://api.microlink.io/?url=https://saulgarcia-p.github.io/localstorage_scynara/&screenshot=true&meta=false&embed=screenshot.url"
    
    # La Casita (si hay user-attachments, si no, ya tiene las locales)
    "https://github.com/user-attachments/assets/lacasita-fallback" = "https://api.microlink.io/?url=https://lacasita-production-560a.up.railway.app/&screenshot=true&meta=false&embed=screenshot.url"
    
    # BiblioTech ESCOM
    "https://github.com/xsuik33/xsuik33.github.io/blob/main/Imagenes/Documentacion/Page.png" = "https://api.microlink.io/?url=https://xsuik33.github.io/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/xsuik33/xsuik33.github.io/blob/main/Imagenes/Documentacion/Login.png" = "https://api.microlink.io/?url=https://xsuik33.github.io/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Data Warehouse CDMX (Usamos el repo como fallback visual)
    "https://github.com/user-attachments/assets/datawarehouse-fallback" = "https://api.microlink.io/?url=https://github.com/omarpulidom/data_warehouse_cdmx&screenshot=true&meta=false&embed=screenshot.url"
    
    # Otros proyectos que pudieran tener user-attachments rotos
    "https://github.com/user-attachments/assets/7e617b84-42e8-49f9-8907-274c34e515bd" = "https://api.microlink.io/?url=https://sistemamedico-1gmy.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/cfd6fdaf-692a-43a2-83fd-e357257a4117" = "https://api.microlink.io/?url=https://warinsanomachine.github.io/sistema-medico-estatico/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/c40df635-46ac-4868-8750-0b76bc2a32ce" = "https://api.microlink.io/?url=https://warinsanomachine.github.io/sistema-medico-estatico/&screenshot=true&meta=false&embed=screenshot.url"
}

# 2. Enlace de Google Play Developer a agregar
$playStoreLink = '<a href="https://play.google.com/store/apps/developer?id=gabrielhuav" target="_blank" rel="noopener noreferrer" class="playstore-link"><i class="fab fa-google-play"></i> Apps para Android de gabrielhuav en Google Play</a>'

# Archivos a procesar
$filesToUpdate = @(
    "android.html",
    "android-es.html",
    "index-fullstack.html",
    "index-es-fullstack.html"
)

foreach ($file in $filesToUpdate) {
    $filePath = Join-Path $webPath $file
    
    if (Test-Path $filePath) {
        Write-Host "  📝 Procesando: $file" -ForegroundColor Yellow
        $content = Get-Content $filePath -Raw -Encoding UTF8
        $originalContent = $content
        
        # A) Reemplazar imágenes rotas por Microlink
        foreach ($oldUrl in $imageReplacements.Keys) {
            $newUrl = $imageReplacements[$oldUrl]
            # Escapar caracteres especiales para regex
            $escapedOldUrl = [regex]::Escape($oldUrl)
            $content = $content -replace $escapedOldUrl, $newUrl
        }
        
        # B) Agregar link de Google Play Developer en archivos de Android
        if ($file -match "android") {
            # Buscar la sección de proyectos Android y agregar el link del developer
            # Buscamos un lugar seguro para insertarlo, por ejemplo, después del título o descripción de Android
            if ($content -notmatch "Apps para Android de gabrielhuav en Google Play") {
                # Insertar después de la descripción principal de Android o en la sección de enlaces
                $content = $content -replace '(<div class="hero-description">.*?</div>)', "`$1`n        <a href=`"https://play.google.com/store/apps/developer?id=gabrielhuav`" target=`"_blank`" rel=`"noopener noreferrer`" class=`"playstore-dev-link`" style=`"display:inline-block; margin-top:15px; padding:10px 20px; background:linear-gradient(135deg, #34A853, #4285F4); color:white; text-decoration:none; border-radius:8px; font-weight:600; font-size:0.95rem; transition:transform 0.2s;`" onmouseover=`"this.style.transform='scale(1.05)'`" onmouseout=`"this.style.transform='scale(1)'`"><i class=`"fab fa-google-play`" style=`"margin-right:8px;`"></i>Apps para Android de gabrielhuav en Google Play</a>"
            }
        }
        
        # Guardar solo si hubo cambios
        if ($content -ne $originalContent) {
            Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
            Write-Host "  ✅ Actualizado: $file" -ForegroundColor Green
        } else {
            Write-Host "  ⏭️ Sin cambios necesarios: $file" -ForegroundColor Gray
        }
    } else {
        Write-Host "  ❌ No encontrado: $file" -ForegroundColor Red
    }
}

Write-Host "`n🎉 ¡Actualización completada!" -ForegroundColor Green
Write-Host "📋 Resumen de cambios:" -ForegroundColor Cyan
Write-Host "  • Imágenes rotas reemplazadas por screenshots automáticos de Microlink" -ForegroundColor White
Write-Host "  • Enlace de Google Play Developer agregado en las secciones de Android" -ForegroundColor White
Write-Host "  • Proyectos del curso de BD (Scynara, Booksnexus, La Casita, BiblioTech, Data Warehouse) actualizados" -ForegroundColor White
Write-Host "`n🚀 Próximos pasos:" -ForegroundColor Yellow
Write-Host "  1. Abre GitHub Desktop" -ForegroundColor White
Write-Host "  2. Revisa los cambios en los 4 archivos HTML" -ForegroundColor White
Write-Host "  3. Escribe un mensaje de commit: 'Update web: fix broken images with Microlink + add Play Store dev link'" -ForegroundColor White
Write-Host "  4. Haz Commit to main y Push origin" -ForegroundColor White