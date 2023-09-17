#Skrypt Powershell do aktualizacji wymaganych modułów w celu pobrania uprawnień z biblioteki SharePoint.
#Stworzony przez Kacper Lechański
#Wersja 1.0

Write-Host "Skrypt wykonujacy instalacje lub aktualizacje modulow w PowerShell" -ForegroundColor Green
Start-Sleep -Seconds 3

#Ustaw repozytorium "PSGallery jakoe zaufane"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Write-Host "Sprawdzam czy wymagane moduly sa zainstalowane.." -ForegroundColor "Yellow"
Start-Sleep -Seconds 3

#Instalacja lub aktualizacja modułu MSOnline
function InstallUpdateMSOnline{
    $msonline = Get-InstalledModule -Name MSOnline
    if($msonline){
        Write-Host "Modul 'MSOnline' jest juz zainstalowany. Wykonuje aktualizacje.." -ForegroundColor Yellow
        Update-Module -Name MSOnline
        Get-InstalledModule -Name MSOnline
    }
    else{
        Write-Host "Brak modulu 'MSOnline'. Rozpoczynam instalacje.." -ForegroundColor Red
        Install-Module -Name MSOnline -Force
        Get-InstalledModule -Name MSOnline
    }
    Start-Sleep -Seconds 3
}


#Instalacja lub aktualizacja modułu PnP.Powershell
function InstallUpdatePnPPowershell{
    $pnppowershell = Get-InstalledModule -Name PnP.Powershell
    if($pnppowershell){
        Write-Host "Modul 'PnP.Powershell' jest juz zainstalowany. Wykonuje aktualizacje.." -ForegroundColor Yellow
        Update-Module -Name PnP.Powershell
        Get-InstalledModule -Name PnP.Powershell
    }
    else{
        Write-Host "Brak modulu 'PnP.Powershell'. Rozpoczynam instalacje.." -ForegroundColor Red
        Install-Module -Name PnP.Powershell -Force
        Get-InstalledModule -Name PnP.Powershell
    }
    Start-Sleep -Seconds 3
}

#Wywowałanie funkcji
InstallUpdateMSOnline
InstallUpdatePnPPowershell

Read-Host "Wcisnij ENTER, aby zakonczyc.."