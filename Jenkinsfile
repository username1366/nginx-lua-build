pipeline {
  agent any

  stages {
    stage("Build and Dockerize") {
      steps {
        sh 'echo 1'
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
