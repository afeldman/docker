node () {
    
    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
      	parallel (
	    "apps": {
		stage ("build"){
		    docker.build("copybirds","apps/copybirds")
		}
	    },
	    "base":{
		stage ("build"){
		    docker.build("alpine","base/alpine")
		    docker.build("ubuntu","base/ubuntu")
		}
	    }
	)
    }
}
