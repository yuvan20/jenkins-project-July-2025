pipeline {
    agent any
    parameters {
        choice(name:'ACTION', choices:['plan','apply','destroy'], description:'Terraform action')
        choice(name:'ENV', choices:['dev','qa','prod'], description:'Environment')
    }
    stages {
        stage('Checkout'){ steps{ checkout scm } }
        stage('Init'){ steps{ sh 'terraform init' } }
        stage('Validate'){ steps{ sh 'terraform validate' } }
        stage('Action'){
            steps{
                script{
                    if(params.ACTION=='plan'){
                        sh "terraform plan -var-file=${params.ENV}.tfvars"
                    } else if(params.ACTION=='apply'){
                        sh "terraform apply -auto-approve -var-file=${params.ENV}.tfvars"
                    } else {
                        sh "terraform destroy -auto-approve -var-file=${params.ENV}.tfvars"
                    }
                }
            }
        }
    }
}
