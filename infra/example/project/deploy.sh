show_usage_and_exit() {
  echo "Usage: $0 (commands...)"
  echo "commands:"
  echo "  dev"
  echo "  stage"
  echo "  production"
  exit 1
}

##########################################
###### Check for environment
##########################################
if [ "$1" == "dev" ]; then
  WORKSPACE="dev"
elif [ "$1" == "stage" ]; then
  WORKSPACE="stage"
  elif [ "$1" == "production" ]; then
  WORKSPACE="production"
else
  show_usage_and_exit
fi

if [ ! $1 ];then
  show_usage_and_exit
fi


CONFIG_DIR="../config"
terraform init -backend-config=$CONFIG_DIR/dev/backend.tfvars
terraform workspace new $WORKSPACE
terraform workspace select $WORKSPACE
terraform get
terraform apply -var-file=$CONFIG_DIR/dev/backend.tfvars
