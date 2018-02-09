node {

    stage('Clone repository') {
        checkout scm
    }

   stage('Build image') {
   	docker.build("copybirds","apps/copybirds").withDockerServer('tcp://192.168.1.19:4243')
   }
}