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

workspace_create_prod:
    terraform workspace new prod

plan_prod:
	terraform plan -out=tfprod_plan -var "env=prod" -var "project_id=resolute-vault-339210" -var "function-name=function-prod"

apply_prod:
    terraform apply --auto-approve "tfprod_plan"
