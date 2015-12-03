
#alias for ls
Set-Alias -Name ls -Value PowerLS -Option AllScope




$d = Get-Date
Write-Host "Started at " $d -foreground "magenta"

function DumpCommandName([string] $name)
{
    Write-Host("Running " + $name) -foreground "magenta"
}


#path shortcuts
function %dropbox%
{
    cd c:\dropbox\
}

function %editprofile
{
   edit $Profile
}


#cli edit
function edit([string] $path)
{
   el far.exe "/e $path" /cli
}


function vimedit([string] $path)
{
    c:\dropbox\utilities\vim\vim74\vim.exe $path
}


function cleanasptemp()
{
    del /a "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\*.*"
}


# Load posh-git example profile
. 'C:\Users\marius\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'



#strictly work related stuffs
function wu
{
	DumpCommandName "svn update c:\flow"
	svn update c:\flow\
}

function wuo
{
	DumpCommandName "svn update c:\flow"
	svn update c:\work\
	DumpCommandName "open vs"
	c:\work\sawoptimized.sln
}

function cmt
{
    tortoiseproc /command:commit /path:"c:\flow"
}



