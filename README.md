# Service Bus Key Rotatation Example using ASP.Net Core 2, Azure Key Vault and Azure Automation

Example application built using ASP.Net Core 2 to show how Azure KeyVault, Azure Automation can be used for Key Rotation with Azure Service Bus


## NuGet Packages Used

The following NuGet Packages are used in the application.

* **Microsoft.Azure.KeyVault** – Allows you to interact with the Azure Key Vault
* **Microsoft.Azure.Services.AppAuthentication** _(Pre-Release)_ – Allows the app to authenticate using the Azure AD.
* **Microsoft.Azure.ServiceBus** – Allows you to interact with the Service Bus

## Running the Application Locally

To run the application locally, you can use Azure CLI 2.0. [Install Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) and login to your azure subscription using the following command

```
az login
```

Then make sure you are in the correct subscription if you have multiple subscriptions, you have to be in the same subscription where the Key Vault you are trying to access is. If not use the following command to set the correct subscription.

```
az account set --subscription "your-subscription-id"
```

Keep the command line open and run the web application from Visual Studio just like you normally do. THe application should now run and connect to Azure Key Vault to retrieve the secret.

## Reference Article

* [Key Rotation Made Easy with Azure Key Vault and Azure Automation](https://wpdevkvk.wordpress.com/2018/05/07/key-rotation-made-easy-with-azure-key-vault-and-azure-automation/)