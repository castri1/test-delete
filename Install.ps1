Set-Location 'C:\Deployment'

#Restore nuget packages
& dotnet.exe restore

#Publish application
& dotnet.exe publish -c release -o $publish_path -f netcoreapp2.1 -r win-x64
