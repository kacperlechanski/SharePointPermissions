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
    $pathFolders = "C:\Users\USER\OneDrive\IT Company Kacper Lechański\Scripts\folders.csv"
    $pathPermissions = "C:\Users\USER\OneDrive\IT Company Kacper Lechański\Scripts\permissions.csv"
    $delimiter = ","

    Write-Host "Wyswietlam dostepne biblioteki na witrynie:" -ForegroundColor Yellow
    Get-PnpList | Out-Host
    $listName = Read-Host "Wpisz nazwe biblioteki do sprawdzenia: "
    if($listName){
        $items = Get-PnPFolder -List $listName
        $items | Select-object -Property Name | Export-Csv -Path $pathFolders -Delimiter $delimiter
        if(!$items){
            Write-Host "Niepoprawna nazwa biblioteki. Sprobuj ponownie.." -ForegroundColor Red
            Start-Sleep -Seconds 3
            GetPermissions
        }
        for($i = 1; $i -le $items.Count; $i++) {
            $permissions = Get-PnPListItemPermission -List $listName -Identity $i | Select-Object -ExpandProperty Permissions
            $permissions | Export-Csv -Path $pathPermissions -Append -NoTypeInformation | Format-Table *
        }
    }
}

#ConnectSharePoint
GetPermissions