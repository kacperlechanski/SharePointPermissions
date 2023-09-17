#Skrypt sprawdzający uprawnień do folderów w bibliotece dokumentów na SharePoint

#Włącz skrypt od aktualizacji lub instalacji modułów
#.\Modules.ps1

#Połącz za pomocą modułu PnP.Powershell
function ConnectSharePoint{
    $url = Read-Host "Podaj link do witryny SharePoint: "
    Write-Host "Łączę do SharePoint.." -ForegroundColor Yellow
    Start-Sleep -Seconds 3
    Connect-PnPOnline -Url $url -Interactive
}

function GetPermissions{
    Write-Host "Wyswietlam dostepne biblioteki na witrynie:" -ForegroundColor Yellow
    Get-PnpList | Out-Host
    Start-Sleep -Seconds 3
    $listName = Read-Host "Wpisz nazwe biblioteki do sprawdzenia: "
    if($listName){
        $items = Get-PnPListItem -List $listName
        if(!$items){
            Write-Host "Niepoprawna nazwa biblioteki. Sprobuj ponownie.." -ForegroundColor Red
            Start-Sleep -Seconds 3
            GetPermissions
        }

        for($i = 1; $i -le $items.Count; $i++) {
            Get-PnPListItemPermission -List $listName -Identity $i
        }
    }
}

#ConnectSharePoint
GetPermissions