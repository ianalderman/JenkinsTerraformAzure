mkdir -p $WORKSPACE/$BUILD_NUMBER/terraform
cd $WORKSPACE/$BUILD_NUMBER/terraform
wget https://releases.hashicorp.com/terraform/0.9.4/terraform_0.9.4_linux_amd64.zip
unzip -o terraform_0.9.4_linux_amd64.zip