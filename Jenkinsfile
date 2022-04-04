pipeline{
    agent any
    stages{
        stage('Git checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'joy-git', url: 'https://github.com/Joyc132/parameter.git']]])
            }
        }
        stage('Initialize'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Plan'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('Apply & Destroy'){
            steps{
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
            }
        }
        
    }
}
