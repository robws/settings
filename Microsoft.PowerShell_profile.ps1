
#alias for ls
Set-Alias -Name ls -Value PowerLS -Option AllScope
#Set-Alias -Name tp -Value Get-Process | select ProcessName, CPU |  where CPU -gt 10 | Format-List

function prompt{
  "r00t@theMatriX [" + (Resolve-Path .\).Path  + "]>"
 }

#explorer for current path
Function e{
    ii .
}

function Quote-String { "$args" }
function Quote-List { $args }
Set-Alias qs Quote-String
Set-Alias ql Quote-List

function cleanasptemp()
{
  Remove-Item -Path "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\*.*" -Force
}


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
