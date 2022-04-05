$LocalDevPath = "C:\xampp\htdocs\kaisensdata\"
# Function cdDev {Set-Location -Path "C:\xampp\htdocs\"}
Function cdDev {Set-Location -Path $LocalDevPath}
Set-Alias -Name dev -Value cdDev

Set-Alias -Name grep -Value Select-String

Function reload {. $profile}
Set-Alias -Name rc -Value reload
# Set-Alias -Name rc -Value . $profile


Import-Module posh-git

# Invoke-Expression (&starship init powershell)


#########################
####    Git Alias    ####
#########################

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

#Set git alias

Set-Alias -Name gstsave -Value GitStashSave
Set-Alias -Name gsta -Value GitStashApply
Set-Alias -Name gss -Value GitStatus
Set-Alias -Name gs -Value GitStatus
Set-Alias -Name gst -Value GitStatus
Set-Alias -Name gaa -Value GitAddAll
Set-Alias -Name gck -Value GitCheckOutBranch
Set-Alias -Name gckb -Value GitCheckOutAndCreateBranch

