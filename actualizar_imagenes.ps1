# Script para reemplazar imagenes rotas en la web personal
# Reemplaza URLs de github.com/user-attachments con screenshots de Microlink

$archivos = @(
    "android.html",
    "android-es.html",
    "index-fullstack.html",
    "index-es-fullstack.html"
)

# Mapeo de URLs rotas a URLs de Microlink (screenshots de demos en vivo)
$reemplazos = @{
    # Booksnexus
    "https://github.com/user-attachments/assets/9f8b8d01-2880-4773-ac7e-0f6ee0bae7c8" = "https://api.microlink.io/?url=https://diegocstln.github.io/mi-proyecto-bd/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/6e9c99e6-8039-409f-a336-74028e68fe78" = "https://api.microlink.io/?url=https://diegocstln.github.io/mi-proyecto-bd/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/1b93c8fe-d090-4b01-98a9-a35d4af7d36e" = "https://api.microlink.io/?url=https://diegocstln.github.io/mi-proyecto-bd/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Patitas Felices
    "https://github.com/user-attachments/assets/c04a0b8e-cdf1-4da3-b722-79644c8aad3c" = "https://api.microlink.io/?url=https://jokerkorio.github.io/patitas-api/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/474219f5-2c2c-4ad9-83b8-eed15b6ec1d0" = "https://api.microlink.io/?url=https://jokerkorio.github.io/patitas-api/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/352f3878-9982-435f-8235-43ea6d21d938" = "https://api.microlink.io/?url=https://jokerkorio.github.io/patitas-api/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/a7156165-26d1-42fd-be91-c1a9f80dbd53" = "https://api.microlink.io/?url=https://jokerkorio.github.io/patitas-api/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Obras Publicas
    "https://github.com/user-attachments/assets/a7211f15-710e-4fb1-9d7c-1a958ef3ef00" = "https://api.microlink.io/?url=https://urigc.github.io/Obras_publicas/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/b5bb340e-b40b-4dfd-897b-470650f917bb" = "https://api.microlink.io/?url=https://urigc.github.io/Obras_publicas/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/23371366-a686-4380-b19d-f824d35d0318" = "https://api.microlink.io/?url=https://urigc.github.io/Obras_publicas/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/e8666f39-f4c0-4145-a052-ae1e20134768" = "https://api.microlink.io/?url=https://urigc.github.io/Obras_publicas/&screenshot=true&meta=false&embed=screenshot.url"
    
    # VinylVibes
    "https://github.com/user-attachments/assets/b8a28bde-7a63-4fb5-ab29-dae045f5c318" = "https://api.microlink.io/?url=https://akibanks.github.io/tienda_musica_web/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/c698edfe-8f98-4268-9bab-666cf72c7caa" = "https://api.microlink.io/?url=https://akibanks.github.io/tienda_musica_web/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/8769e360-5673-4111-8041-c7813d667014" = "https://api.microlink.io/?url=https://akibanks.github.io/tienda_musica_web/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/8eef01ca-0473-410e-91cd-0c3c221b5f8a" = "https://api.microlink.io/?url=https://akibanks.github.io/tienda_musica_web/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Restaurante Equipo 21
    "https://github.com/user-attachments/assets/d7517efb-67f0-4e54-8b56-e085099ef7bd" = "https://api.microlink.io/?url=https://proyecto-bases-snowy.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/79e6baed-395d-487e-adc1-9ee656bb7223" = "https://api.microlink.io/?url=https://proyecto-bases-snowy.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/772de401-0171-49cc-a700-652aa9705093" = "https://api.microlink.io/?url=https://proyecto-bases-snowy.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/6ab4974e-8ba2-4dec-aaf5-164564c89ed2" = "https://api.microlink.io/?url=https://proyecto-bases-snowy.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Scynara
    "https://github.com/user-attachments/assets/4e0a99b5-fb40-44ab-9d35-57668798aaf8" = "https://api.microlink.io/?url=https://scynara-frontend.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/4d0ae50e-22b0-4823-833f-0e30a2db2174" = "https://api.microlink.io/?url=https://scynara-frontend.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Notaria 105
    "https://github.com/user-attachments/assets/9932b8ba-6d88-487d-8d2b-4411601c175e" = "https://api.microlink.io/?url=https://notaria-105.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/5dbdecb2-a3df-466c-8214-0cc138a0ec31" = "https://api.microlink.io/?url=https://notaria-105.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/42c0483c-c947-4d44-b400-08c2e912a4ad" = "https://api.microlink.io/?url=https://notaria-105.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/446e047b-f2e5-4d17-b529-74141bc8edc4" = "https://api.microlink.io/?url=https://notaria-105.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Distribuidora Kafra
    "https://github.com/user-attachments/assets/4e5635a8-4fe3-4789-a8aa-ad3ef39d7300" = "https://api.microlink.io/?url=https://derekarenas.github.io/kafra-dashboard/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/9317424e-674d-4877-a1bd-7e6cb287e254" = "https://api.microlink.io/?url=https://derekarenas.github.io/kafra-dashboard/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/1d013572-cf13-4fa7-bd7a-c60fc9e334eb" = "https://api.microlink.io/?url=https://derekarenas.github.io/kafra-dashboard/&screenshot=true&meta=false&embed=screenshot.url"
    
    # MANTRA
    "https://github.com/user-attachments/assets/42a1b548-17ca-46eb-aeef-fc862a6ce4c0" = "https://api.microlink.io/?url=https://mantra-backend-24g1.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/6c369928-ee59-4f45-bce8-97b4a5c7edde" = "https://api.microlink.io/?url=https://mantra-backend-24g1.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/873197d9-57de-4f03-9024-a659d2f122a4" = "https://api.microlink.io/?url=https://mantra-backend-24g1.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/6ef71a19-5c95-4625-8077-2fa7774410f2" = "https://api.microlink.io/?url=https://mantra-backend-24g1.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Compania de Danza
    "https://github.com/user-attachments/assets/363efd33-a4d3-4cf6-97e7-a35b43497171" = "https://api.microlink.io/?url=https://grupo-jaltepec-bd.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/c4aee3e2-8a28-4906-9400-feac535b7141" = "https://api.microlink.io/?url=https://grupo-jaltepec-bd.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/fc762a02-3e1a-4d5c-9de4-f1178b10ce7b" = "https://api.microlink.io/?url=https://grupo-jaltepec-bd.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/af3c6509-8157-4619-9a3a-d8a113c06d70" = "https://api.microlink.io/?url=https://grupo-jaltepec-bd.vercel.app/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Carniceria Camacho
    "https://github.com/user-attachments/assets/35ec3b13-3e45-430f-b918-a2746ce77ecf" = "https://api.microlink.io/?url=https://ivanrvillegas10-dev.github.io/carniceria/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/288cf883-9485-49e2-8df8-5de2ba3c2fbd" = "https://api.microlink.io/?url=https://ivanrvillegas10-dev.github.io/carniceria/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/cf3d4ac4-8aa1-4345-84a8-298096fb80af" = "https://api.microlink.io/?url=https://ivanrvillegas10-dev.github.io/carniceria/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Ferreteria Tico
    "https://github.com/user-attachments/assets/e85709c9-fa1c-40fe-8851-922d6c3d2d75" = "https://api.microlink.io/?url=https://itzelnavarrete.github.io/ferreteria-TICO/index.html&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/e0353579-6c93-48d3-9808-852378772e38" = "https://api.microlink.io/?url=https://itzelnavarrete.github.io/ferreteria-TICO/index.html&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/edf6f49b-4463-4dcb-a9aa-d3c264ee403d" = "https://api.microlink.io/?url=https://itzelnavarrete.github.io/ferreteria-TICO/index.html&screenshot=true&meta=false&embed=screenshot.url"
    
    # Sistema de Citas Medicas
    "https://github.com/user-attachments/assets/7e617b84-42e8-49f9-8907-274c34e515bd" = "https://api.microlink.io/?url=https://sistemamedico-1gmy.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/cfd6fdaf-692a-43a2-83fd-e357257a4117" = "https://api.microlink.io/?url=https://sistemamedico-1gmy.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/c40df635-46ac-4868-8750-0b76bc2a32ce" = "https://api.microlink.io/?url=https://sistemamedico-1gmy.onrender.com/&screenshot=true&meta=false&embed=screenshot.url"
    
    # Huellitas
    "https://github.com/user-attachments/assets/f4101a5b-38cd-4a72-bd41-1ae500c4301b" = "https://api.microlink.io/?url=https://sofi-14.github.io/gitfin/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/2c98c9e6-239b-43a4-a988-448c29393ad6" = "https://api.microlink.io/?url=https://sofi-14.github.io/gitfin/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/7aca0e43-14f4-4d68-af34-8d052f3c9f53" = "https://api.microlink.io/?url=https://sofi-14.github.io/gitfin/&screenshot=true&meta=false&embed=screenshot.url"
    "https://github.com/user-attachments/assets/d0c31a67-85c2-4223-be17-a3bbfe92ee27" = "https://api.microlink.io/?url=https://sofi-14.github.io/gitfin/&screenshot=true&meta=false&embed=screenshot.url"
}

$totalReemplazos = 0

foreach ($archivo in $archivos) {
    $rutaArchivo = Join-Path $PSScriptRoot $archivo
    
    if (Test-Path $rutaArchivo) {
        Write-Host "Procesando: $archivo" -ForegroundColor Cyan
        
        $contenido = Get-Content $rutaArchivo -Raw -Encoding UTF8
        $reemplazosEnArchivo = 0
        
        foreach ($urlRota in $reemplazos.Keys) {
            $urlNueva = $reemplazos[$urlRota]
            
            if ($contenido -match [regex]::Escape($urlRota)) {
                $contenido = $contenido -replace [regex]::Escape($urlRota), $urlNueva
                $reemplazosEnArchivo++
            }
        }
        
        if ($reemplazosEnArchivo -gt 0) {
            Set-Content -Path $rutaArchivo -Value $contenido -Encoding UTF8 -NoNewline
            Write-Host "  [OK] $reemplazosEnArchivo imagenes reemplazadas" -ForegroundColor Green
            $totalReemplazos += $reemplazosEnArchivo
        } else {
            Write-Host "  [INFO] No se encontraron imagenes rotas" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  [ERROR] Archivo no encontrado: $archivo" -ForegroundColor Red
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Proceso completado" -ForegroundColor Green
Write-Host "  Total de reemplazos: $totalReemplazos" -ForegroundColor Green
Write-Host "`nSiguiente paso:" -ForegroundColor Yellow
Write-Host "  1. Abre GitHub Desktop" -ForegroundColor White
Write-Host "  2. Veras los 4 archivos modificados" -ForegroundColor White
Write-Host "  3. Escribe un mensaje del commit" -ForegroundColor White
Write-Host "  4. Haz clic en 'Commit to main'" -ForegroundColor White
Write-Host "  5. Haz clic en 'Push origin'" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
