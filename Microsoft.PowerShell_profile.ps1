$LocalDevPath = "C:\xampp\htdocs\kaisensdata\"
# Function cdDev {Set-Location -Path "C:\xampp\htdocs\"}
Function cdDev {Set-Location -Path $LocalDevPath}
Function reload {. $profile }
function RunCurrentFolderPHPServer{php -S localhost:8888}
function ConnectionXtremRemoteSSH{ssh wuchin@164.132.59.209}
function setCurrentLocationToClopboard{ Set-Clipboard $pwd }

Set-Alias -Name dev         -Value cdDev
Set-Alias -Name grep        -Value Select-Strin-g
Set-Alias -Name rc          -Value reload
Set-Alias -Name php_serve   -Value RunCurrentFolderPHPServer
Set-Alias -Name XtremRemote -Value ConnectionXtremRemoteSSH
Set-Alias -Name touch       -Value New-Item
Set-Alias -Name scp         -Value Set-Clipboard
Set-Alias -Name scppwd      -Value setCurrentLocationToClopboard


# Invoke-Expression (&starship init powershell)
#########################
####    Git Alias    ####
#########################

Import-Module posh-git
#Param

Function GitStatus {git status}
Function GitStashSave {git stash save}
Function GitStashApply {git stash apply}
Function GitAddAll {git add *}
Function GitCheckOutBranch {
        # Add display git branch display like git checkout normal
        
        Param([string] 
        # [Paramter(Position=0)]
        $newBranchName )
    git checkout $newBranchName}
Function GitCheckOutAndCreateBranch {
    Param([string] 
        [Paramter(NewBranchName,Position=0)]
        $newBranchName,
        [string] 
        [AllowNull()]
        [Paramter(FromBranch,Position=0)]
        $fromBranch)

    git checkout -b $newBranchName $fromBranch
    }

Function GitAddAllAndCommit{
    Param([string]
    $commitMessage)
    git add *
    git commit -m "$commitMessage"
}

#Set git alias

Set-Alias -Name gstsave -Value GitStashSave
Set-Alias -Name gsta -Value GitStashApply
Set-Alias -Name gss -Value GitStatus
Set-Alias -Name gs -Value GitStatus
Set-Alias -Name gst -Value GitStatus
Set-Alias -Name gaa -Value GitAddAll
Set-Alias -Name gck -Value GitCheckOutBranch
Set-Alias -Name gac -Value GitAddAllAndCommit
Set-Alias -Name gckb -Value GitCheckOutAndCreateBranch
