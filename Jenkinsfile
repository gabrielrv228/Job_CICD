pipeline{
    agent { dockerfile true }
   
    stages{
  
        stage('Terraform Init'){
            steps{
                sh label: '', script: 'terraform init'
            }
        }
        stage('Create dev workspace'){
            steps{
                sh label: '', script: 'terraform workspace new dev'
            }
        }
            
        
        stage('Terraform plan dev'){
            steps{
                sh label: '', script: 'terraform plan -out=tfdev_plan -var "env=dev" -var "project_id=resolute-vault-339210" -var "function-name=function-dev"  '
            }
        }
    
       stage('Terraform apply dev'){
            steps{
                sh label: '', script: 'terraform apply --auto-approve "tfdev_plan"'
            
            }         
        }
        stage('Create prod workspace'){
            steps{
                sh label: '', script: 'terraform workspace new prod'
            }
        }        
        stage('Terraform plan prod'){
            steps{
                sh label: '', script: 'terraform plan -out=tfprod_plan -var "env=prod" -var "project_id=resolute-vault-339210" -var "function-name=function-prod"'
            }
        }
       stage('Terraform apply prod'){
           steps{
           
           input(message: "Esta usted seguro de que desea desplegar en producción?", ok: "Deploy", submitter:"admin")
                 
           sh label: '', script: 'terraform apply --auto-approve "tfprod_plan"'
           }               
        }        
    }
}
