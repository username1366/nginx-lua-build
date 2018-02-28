pipeline {
  agent any

  stages {
    stage("Build and Dockerize") {
      steps {
        sh 'docker build -t username1366/nginx-lua:latest -t username1366/nginx-lua:${BUILD_NUMBER} .'
      }
    }

    stage("Push image") {
      steps {
        sh 'docker images'
        sh 'docker push username1366/nginx-lua:latest'
        sh 'docker push username1366/nginx-lua:${BUILD_NUMBER}'
      }
    }

    stage("Deploy") {
      steps {
        sh 'echo 3'
      }
    }
  }
}
