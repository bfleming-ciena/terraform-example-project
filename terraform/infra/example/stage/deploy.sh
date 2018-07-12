terraform init -backend-config=../config/dev/access_key.tfvars
terraform get
terraform apply -var-file ../config/dev/user-defined.tfvars -var-file=../config/dev/access_key.tfvars
