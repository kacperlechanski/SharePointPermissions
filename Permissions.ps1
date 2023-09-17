#Skrypt sprawdzający uprawnień do folderów w bibliotece dokumentów na SharePoint

#Włącz skrypt od aktualizacji lub instalacji modułów
#.\Modules.ps1

#Połącz za pomocą modułu PnP.Powershell
function ConnectSharePoint{
    $url = Read-Host "Podaj link do witryny SharePoint: "
    Connect-PnPOnline -Url $url -Interactive
}

ConnectSharePoint