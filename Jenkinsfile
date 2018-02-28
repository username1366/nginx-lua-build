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
        sh 'docker push username1366/nginx-lua:latest'
      }
    }

    stage("Deploy") {
      steps {
        sh 'docker images'
        sh 'docker-machine rm nginx'
        sh 'docker-machine create --driver amazonec2 --amazonec2-tags alexandr,kosenko --amazonec2-open-port 8080 --amazonec2-region eu-west-1 --amazonec2-userdata nginx-cloud-init nginx'
      }
    }
  }
}
