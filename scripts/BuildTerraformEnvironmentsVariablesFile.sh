!#/bin/bash

mkdir -p $WORKSPACE/$BUILD_NUMBER
cd $WORKSPACE/$BUILD_NUMBER

#Build out Environment specific variables for Terraform
echo "region_id = \"$RegionId\"" > environment.tfvars
echo "environment_id = \"$EnvironmentId\"" >> environment.tfvars
echo "azure_region =\"$AzureRegion\"" >> environment.tfvars

