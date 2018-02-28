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
        sh 'yes | docker-machine rm kosenko-nginx-lua || true'
        sh 'docker-machine create --driver amazonec2 --amazonec2-tags alexandr,kosenko --amazonec2-open-port 8080 --amazonec2-region eu-west-1 --amazonec2-userdata nginx-cloud-init kosenko-nginx-lua'
        sh 'eval $(docker-machine env kosenko-nginx-lua)'
        sh 'docker ps'
      }
    }
  }
}
