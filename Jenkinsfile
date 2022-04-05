pipeline{
    agent any
    stages{
        stage('Git checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'joy-git', url: 'https://github.com/Joyc132/parameter.git']]])
            }
        }
        stage('Inite'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Plan'){
            steps{
                sh 'terraform plan -var-file=terraform.tfvars'
            }
        }
        stage('Apply'){
            steps{
                //sh 'terraform apply -var-file=terraform.tfvars -auto-approve'
                sh 'terraform destroy -var-file=terraform.tfvars -auto-approve'
            }
        }
        
    }
}
