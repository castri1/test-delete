$client_path = "C:\Deployment"
$solution_path = "C:\Users\Daniel\Documents\Visual Studio 2017\Projects\WTT"
$publish_path = "C:\Users\Daniel\Desktop\Delete\deployment"

Set-Location $client_path

& npm install
& npm run build

Set-Location $solution_path

#Restore nuget packages
& dotnet.exe restore

#Publish application
& dotnet.exe publish -c release -o $publish_path -f netcoreapp2.1 -r win-x64
