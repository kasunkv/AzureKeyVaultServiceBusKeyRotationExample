# ------- Required for Azure Automatio Runbook --------- #

$azureAutomationConnectionName = "AzureRunAsConnection"

# Get the connection "AzureRunAsConnection
$servicePrincipalConnection = Get-AutomationConnection -Name $azureAutomationConnectionName         

# Adds the Authentication Account
Add-AzureRmAccount -ServicePrincipal -TenantId $servicePrincipalConnection.TenantId -ApplicationId $servicePrincipalConnection.ApplicationId -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 

# ------- Required for Azure Automatio Runbook --------- #



# Set the Variales
$resourceGroupName = 'KeyRotation'
$serviceBusName = 'kvkkeyrotationbus'
$serviceBusAccessPolicyName = 'RootManageSharedAccessKey'
$keyVaultName = 'kvkkeyrotationvault'
$keyVaultSecretKey = 'ServiceBusPrimaryKey'

# Regenerate the Service Bus Primary Key
New-AzureRmServiceBusKey -ResourceGroupName $resourceGroupName -Namespace $serviceBusName -Name $serviceBusAccessPolicyName -RegenerateKey PrimaryKey

# Get the newly regenerated Primary Key
$primaryKey = (Get-AzureRmServiceBusKey -ResourceGroupName $resourceGroupName -Namespace $serviceBusName -Name $serviceBusAccessPolicyName).PrimaryKey

# Convert the Primary Key to Secure String
$secureValue = ConvertTo-SecureString $primaryKey -AsPlainText -Force

# Update the Secret Value in the Key Vault
Set-AzureKeyVaultSecret -VaultName $keyVaultName -Name $keyVaultSecretKey -SecretValue $secureValue
