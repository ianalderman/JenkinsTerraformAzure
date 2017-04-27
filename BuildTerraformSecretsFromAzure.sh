!#/bin/bash
#Login to Azure via Az CLI 2
az login --service-principal -u $AzureSPNUsername -p $AzureSPNPassword --tenant $AzureSPNTenant
#Generate Secrets file for Terraform
TenantID=$(az account show --out tsv | cut -f6)
SubscriptionID=$(az account show --out tsv | cut -f2)
SPNName=$(az account show --expanded-view --out tsv | cut -f1)
ClientID=$(az ad sp show --id $SPNName | cut -f3)
ClientSecret=$(az account show --expanded-view --out tsv | cut -f3)

#The line below would retrieve given secret from Azure KeyVault
#KeyVaultBasedSecret=$(az keyvault secret show --name <SECRETNAME> --vault-name <VAULTNAME> --out tsv | cut -f7)

echo "subscription_id = \"$SubscriptionID\"" > secret.tfvars
echo "client_id = \"$ClientID\"" >> secret.tfvars
echo "client_secret =\"$ClientSecret\"" >> secret.tfvars
echo "tenant_id = \"$TenantID\"" >> secret.tfvars

#The line below would output the KeyVault based secret to the secrets file for Terraform
#echo "secret_from_keyvault = \"KeyVaultBasedSecret\"" >> secret.tfvars