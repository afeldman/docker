node {

    stage('Clone repository') {
        checkout scm
    }

   stage('Build image') {
   	parallel{
		docker.build("copybirds","apps/copybirds")
		docker.build("alpine","base/alpine")
		docker.build("ubuntu","base/ubuntu")
	}
   }
}