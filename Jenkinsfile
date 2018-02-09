node {

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
   	steps {
   	    parallel (
		"copybirds": {
		    docker.build("copybirds","apps/copybirds")
		},
		"alpine": {
		    docker.build("alpine","base/alpine")
		},
		"ubuntu": {
		    docker.build("ubuntu","base/ubuntu")
		}
	    )
	}
    }
}
