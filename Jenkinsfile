pipeline {

    agent any

    stages {

        stage('Deploy Front/Backend')

                steps{
                    sh 'chmod +x kube.sh'
                    sh './kube.sh'
                }
    }
}