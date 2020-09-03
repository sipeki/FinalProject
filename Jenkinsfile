pipeline {

    agent any

    stages {

        stage('Deploy Front/Backend'){

                steps{
                    sh 'chmod +x ./*.sh'
                    sh './kube.sh'
                }
        }

        stage('Post-Health-Check Address') {
                steps{
                    sh './getsvc.sh'
                }
        }
    }
}