pipeline {
    agent any
    stages {
        stage('git clone') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/Joyc132/parameter.git']]]) {
                 stash 'source'
                }
            }
        }
    
        stage('TF INIT AND PLAN ') {
            steps {
                
                    sh '''
                    terraform init
                    terraform plan
                    '''
            }
        }
        stage('TF APPLY') {
            steps {
                sh '''
                terraform apply -input=false
                '''
            }
        }
    }
}
