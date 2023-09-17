#Skrypt Powershell do aktualizacji wymaganych modułów w celu pobrania uprawnień z biblioteki SharePoint

#Ustaw repozytorium "PSGallery jakoe zaufane"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Write-Host "Sprawdzam czy wymagane moduly sa zainstalowane.." -ForegroundColor "Yellow"


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
}


#Instalacja lub aktualizacja modułu PnP.Powershell
function InstallUpdateMSOnline{
    Write-Host "Sprawdzam czy wymagane moduly sa zainstalowane.." -ForegroundColor "Yellow"
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
}


InstallUpdateMSOnline
InstallUpdatePnPPowershell