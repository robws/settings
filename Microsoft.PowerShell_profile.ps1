Set-Alias services Get-Service


# Load posh-git example profile
. 'C:\oss\posh-git\profile.example.ps1'



Write-Host "*bing* *bing*" -foreground "magenta"

function DumpCommandName([string] $name)
{
    Write-Host("Running " + $name) -foreground "magenta"
}


#cli edit
function edit([string] $path)
{
  #  el far.exe "/e $path" /cli
  C:\Program Files\Far Manager\far.exe /e $path
}


function vimedit([string] $path)
{
    c:\dropbox\utilities\vim\vim74\vim.exe $path
}


function psgrep($path, $fileType, $string)
{
    get-childitem $path -include $fileType -rec | select-string  $string
}

function psgrepFile($path, $fileType)
{
    get-childitem $path -include $fileType -rec 
}


function %dx
{
    cd c:\dropbox\
}
