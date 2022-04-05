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
                sh 'terraform plan'
            }
        }
        stage('Apply'){
            steps{
                sh 'terraform apply -auto-approve'
                sh 'terraform destroy -auto-approve'
            }
        }
        
    }
}
