#Build out Environment specific variables for Terraform
echo "region_id = \"$RegionId\"" > environment.tfvars
echo "environment_id = \"$EnvironmentId\"" >> environment.tfvars
echo "azure_region =\"$AzureRegion\"" >> environment.tfvars

