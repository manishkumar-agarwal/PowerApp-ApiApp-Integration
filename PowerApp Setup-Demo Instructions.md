# PowerApps Set-up Instructions for HOL Demo

Follow the below instructions to set-up the PowerApps architecture

a) Register an AAD Application for the PowerApps with below requirements

    i) Must have a client secret
   ii) Enable Access Permissions to the API APP which will be used for serving requests made by PowerApp
  iii) Enable OAuth2.0 Authentication for this registered Application
  
  For doing this set-up run the powershell script present at [Power Apps AAD Registration](https://github.com/manishkumar-agarwal/PowerApp-ApiApp-Integration/blob/master/Scripts/PowerAppAADRegistration.ps1)

