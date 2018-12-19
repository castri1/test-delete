Set-Location 'C:\Deployment'

#Restore nuget packages
& dotnet.exe restore

#Publish application
& dotnet.exe publish -c release -o 'C:\Deployment\publish' -f netcoreapp2.1 -r win-x64

# Point IIS wwwroot of the published folder. CodeDeploy uses 32 bit version of PowerShell.
# To make use the IIS PowerShell CmdLets we need call the 64 bit version of PowerShell.
C:\Windows\SysNative\WindowsPowerShell\v1.0\powershell.exe -Command {Import-Module WebAdministration; Set-ItemProperty 'IIS:\sites\Default Web Site' -Name physicalPath -Value c:\Deployment\publish}
