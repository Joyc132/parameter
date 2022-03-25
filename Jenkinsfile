pipeline {
    agent any

    parameters {
        booleanParam(defaultValue: true, description: '', name: 'userFlag')
    }

    stages {
        stage('Trigger') {
            steps {
                script {
                    println("triggering the pipeline from a rest call..")
                }
            }
        }
        stage("foo") {
            steps {
                echo "flag: ${params.userFlag}"
            }
        }

    }
}