pipeline {
    agent any

    stages {
        stage('dockers login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_hub-joy', passwordVariable: 'pass', usernameVariable: 'uname')]) {
                    sh '''
                    whoami
                    docker login -u $uname -p $pass
                    '''
            }
        }
    }
        stage('git clone') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/Joyc132/parameter.git']]])
                 stash 'source'
            }
        }
        stage('docker build') {
            steps {
                sh '''
                docker build -t nginx .
                '''
            }
        }
    }
}
