# Load posh-hg example profile
#'C:\Users\marius\Documents\WindowsPowerShell\Modules\writeascii\Write-Ascii.psd1'

$d = Get-Date
Write-Host "Started at " $d -foreground "magenta"

#dumpLogo

cd  c:\Dropbox\utilities\cmdfetch\
c:\Dropbox\utilities\cmdfetch\cmdfetch.bat


#.'c:\dropbox\utilities\winchy.ps1'




function wu
{
	#	DumpCommandName "svn update c:\work\trunk\"
	#	svn update c:\work\trunk\
}


function os
{
	#	Write-Host("Running c:\work\trunk\maw.sln")
	#	c:\work\trunk\maw.sln	
}

function sct
{
	#	tortoiseproc /command:commit /path:"c:\work\trunk"
}


function DumpCommandName([string] $name)
{
	Write-Host("Running " + $name) -foreground "magenta"
}


#function dumpLogo()
#{
#
#		Write-Host(`       ~q=:!!t3Z3z.e                `) -foreground "magenta"
#		Write-Host(`       :tt:::tt333EE3                `)-foreground "magenta"
#		Write-Host(`       Et:::ztt33EEEL${c2} @Ee.,      .., `) -foreground "magenta"
#		Write-Host(`      ;tt:::tt333EE7${c2} ;EEEEEEttttt33# `) -foreground "magenta"
#		Write-Host(`     :Et:::zt333EEQ.${c2} $EEEEEttttt33QL `) -foreground "magenta"
#		Write-Host(`     it::::tt333EEF${c2} @EEEEEEttttt33F  `) -foreground "magenta"
#		Write-Host(`    ;3=q^111\~q4EEV${c2} :EEEEEEttttt33@.  `) -foreground "magenta"
#		Write-Host(`    ,.=::::!t=., ${c1}~${c2} @EEEEEEtttz33QF   `) -foreground "magenta"
#		Write-Host(`   ;::::::::zt33)${c2}  \4EEEtttji3P    `) -foreground "magenta"
#		Write-Host(`  :t::::::::tt33.${c4}:Z3z..${c2}  ${c4} ,..g.    `) -foreground "magenta"
#		Write-Host(`  i::::::::zt33F${c4} AEEEtttt::::ztF     `) -foreground "magenta"
#		Write-Host(` ;:::::::::t33V${c4} ;EEEttttt::::t3      `) -foreground "magenta"
#		Write-Host(` E::::::::zt33L${c4} @EEEtttt::::z3F      `) -foreground "magenta"
#		Write-Host(`{3=q^~~~\q4E3)${c4} ;EEEtttt:::::tZ      `) -foreground "magenta"
#		Write-Host(`              ${c4} :EEEEtttt::::z7       `) -foreground "magenta"
#
#}

