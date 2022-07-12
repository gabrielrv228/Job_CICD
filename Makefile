all: clean init workspace_create_dev workspace_create_prod  plan_dev plan_prod apply_dev apply_prod

clean:
	rm -fR terraform.*
	rm -fR .terraform/modules
    rm -fR terraform.tfstate.d

init: clean
	terraform init 

workspace_create_dev:
    terraform workspace new dev


plan_dev:
    terraform plan -out=tfdev_plan -var "env=dev" -var "project_id=resolute-vault-339210" -var "function-name=function-dev"

apply_dev: 
    terraform apply --auto-approve "tfdev_plan"


