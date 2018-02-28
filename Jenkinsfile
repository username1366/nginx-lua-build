pipeline {
  agent any

  stages {
    stage("Build and Dockerize") {
      steps {
        docker build -t username1366/nginx-lua:${BUILD_NUMBER} -t username1366/nginx-lua:latest  .
      }
    }

    stage("Push image") {
      steps {
        docker push username1366/nginx-lua:${BUILD_NUMBER}
      }
    }

    stage("Deploy") {
      steps {
        docker images
        docker-machine rm nginx
        docker-machine create --driver amazonec2 --amazonec2-tags alexandr,kosenko --amazonec2-open-port 8080 --amazonec2-region eu-west-1 --amazonec2-userdata nginx-cloud-init nginx
      }
    }
  }
}
