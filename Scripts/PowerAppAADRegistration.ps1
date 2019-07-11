#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# Purpose: Registering an Application in AAD for the enabling OAuth2.0 authentication from a PowerApps Application                                                           #   
#          This script accomplishes the below configuration and setup.                                                                                                       #       
#          Please make sure that you have authenticated through  'Connect-AzureAD'                                                                                           #
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# Parameters :    APIAppRegistrationName -- Name of the API App Application registration                                                                                     #
#                 PowerAppRegistrationName -- Name of the PowerApp Application to be registered in AAD                                                                       #
#                 ClientSecret  -- A secret string which will later be used for configuring the custom connector in powerapp                                                 #  
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------#


param(
[Parameter(Mandatory=$True)]
[string]$APIAppRegistrationName,

[Parameter(Mandatory=$True)]
[string]$PowerAppRegistrationName,

[Parameter(Mandatory=$True)]
[Security.SecureString]$ClientSecret
)

#Gets the Application Registration details for API App Registration
$APIAppRegistrationDetails = Get-AzureADApplication -SearchString $APIAppRegistrationName

#Create an object to pass in OAuth properties from API App registration
$req = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
$acc1 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $APIAppRegistrationDetails.Oauth2Permissions.Id,"Scope"
$req.ResourceAccess = $acc1
$req.ResourceAppId = $APIAppRegistrationDetails.AppId

#Creates the New Application Registration for PowerApps App Registration
$powerappregistration = New-AzureADApplication -DisplayName $PowerAppRegistrationName -ReplyUrls "https://global.consent.azure-apim.net/redirect" -RequiredResourceAccess $req

#Create a secret in PowerApps Application Registration
New-AzureRmADAppCredential -ObjectId $powerappregistration.ObjectId -Password $ClientSecret