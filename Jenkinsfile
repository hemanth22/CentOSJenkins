node {
    stage('Preparation') {
        git branch: 'v3.2', credentialsId: 'github', url: 'https://github.com/hemanth22/CentOSJenkins.git'
    }
    stage('Build') {
        sh 'docker-compose build'
    }
    stage('Deploy') {
        withDockerRegistry(credentialsId: 'docker') {
                sh """
                     docker tag centosdocker_jenkins:latest bitroid/centosjenkins:release-3.2.0
                     docker push bitroid/centosjenkins:release-3.2.0
                """
       }
    }
    stage('Results') {
       sh 'docker images'
    }
}
