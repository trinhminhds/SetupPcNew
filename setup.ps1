# Run this command if no execution policy error: set-ExecutionPolicy RemoteSigned -Scope CurrentUser 

# Unil function 
function write-Start {
	param($msg)
	Write-Host (">> "+$msg) -ForegroundColor Green
}

Function Write-Done { Write-Host "Done" -ForegroundColor Blue; Write-Host 
}

# Start
Start-Process -Wait powershell -verb runas -ArgumentList "Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0"


# https://scoop.sh/
Write-Start -msg "Installing Scoop..."
if(Get-Command scoop -errorAction SilentlyContinue){
	Write-Warning "Scoop already installed"
}
else{
	Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
 	irm get.scoop.sh | iex
}
Write-Done

Write-Start -msg "Initializing Scoop..."
	scoop install git 
	scoop bucket add extras 
	scoop bucket add nerd-fonts
	scoop bucket add java
	scoop update
Write-Done

# https://scoop.sh/
# Search an app
Write-Start -msg "Installing Scoop's packages"
	scoop install <# Web #>		googlechrome
	scoop install <# Tool #> 		
	scoop install <# Coding #>	vscode gcc python 
	Start-Process -Wait powershell -ver runas -ArgumentList "scoop install DejaVuSansMono-NF-Mono"
Write-Done


# https://marketplace.visualstudio.com/VSCode
Write-Start -msg "Configuring VSCode"
	code --install-extension vscodevim.vim --force
	code --install-extension dracula-theme.theme-dracula --force
	code --install-extension ms-python.python --force
Write-Done
































