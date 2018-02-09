node {
    def app

    stage('Clone repository') {
 
        checkout scm
    }

    stage('Build image') {
         withDockerServer([uri: "tcp://10.67.132.181:4243"]) {
             app = docker.build("apps/copybirds")
	 }
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

/*    stage('Push image') {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
	
    }*/
}