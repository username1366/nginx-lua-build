pipeline {
  agent any

  stages {
    stage("Build and Dockerize") {
      steps {
        sh 'docker build -t username1366/nginx-lua:latest .'
      }
    }

    stage("Push image") {
      steps {
        sh 'echo 2'
      }
    }

    stage("Deploy") {
      steps {
        sh 'echo 3'
      }
    }
  }
}
