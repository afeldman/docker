node {

    stage('Clone repository') {
        checkout scm
    }

   stage('Build image') {
   		docker.build("apps/copybirds")
   }
}