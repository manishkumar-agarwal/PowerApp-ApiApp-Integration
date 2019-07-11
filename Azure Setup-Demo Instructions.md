# Azure Set-up Instructions for HOL Demo

Follow the below instructions to set-up the target architecture

a) Deploy Azure Components (API App, Mock API App, Key Vault and Key Vault Secret)
<br/>

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmanishkumar-agarwal%2FPowerApp-ApiApp-Integration%2Fmaster%2FTemplates%2FMainTemplate.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


<br/>

b) Verify the Azure Template Deployment is complete successfully

c) Verify the Azure Key vault set-up

     i) Goto Azure Resource Group --> KeyVault --> Settings --> Secrets (Verify the secret is created)
     
    ii) KeyVault --> Settings --> Access Policies (Verify the API Application Managed Identity is granted access)


d) Configure the 'Mock Api App' as per the instructions in [Mock Enterprise API Instructions.md](https://github.com/manishkumar-agarwal/PowerApp-ApiApp-Integration/blob/master/MockApiApplication/Mock%20Enterprise%20API%20Instructions.md)

![Architecture Diagram](Architecture.png)
