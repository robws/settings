
# Load posh-hg example profile
. 'C:\oss\posh-hg\profile.example.ps1'


# Load posh-git example profile
. 'C:\oss\posh-git\profile.example.ps1'



$d = Get-Date
Write-Host "Started at " $d -foreground "magenta"


function DumpCommandName([string] $name)
{
    Write-Host("Running " + $name) -foreground "magenta"
}



#strictly work related stuffs
function wu
{
		DumpCommandName "svn update c:\work"
		svn update c:\work\
}


function wuo
{
		DumpCommandName "svn update c:\work"
		svn update c:\work\
		DumpCommandName "open vs"
		c:\work\ssp.sln
}


function commitwork
{
	tortoiseproc /command:commit /path:"c:\work\trunk"
}



#iis express 
function startiis
{
    cd "c:\program files\iis express"
    .\iisexpress.exe /apppool:Clr4IntegratedAppPool
}

function stopiis
{
    taskkill /im iisexpress.exe    
}



#cli edit
function edit([string] $path)
{
    far.exe /e $path
}


function vimedit([string] $path)
{
    c:\dropbox\utilities\vim\vim74\vim.exe $path
}


function %dropbox%
{
    cd c:\dropbox\
}
