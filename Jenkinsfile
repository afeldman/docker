pipeline {

    agent none
    
    stages{
	stage('Clone repository') {
            checkout scm
	}

	stage('Build image') {
      	    parallel (
		stage ('apps'){
		    "copybirds": {
			docker.build("copybirds","apps/copybirds")
		    }
		}
		stage ('base'){
		    "alpine": {
			docker.build("alpine","base/alpine")
		    },
		    "ubuntu": {
			docker.build("ubuntu","base/ubuntu")
		    }
		}
	    )
	}
    }
}
