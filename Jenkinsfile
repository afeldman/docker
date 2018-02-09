node () {
    
    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
      	parallel (
	    "apps": {
		stage ("build"){
		    docker.build("jolici","apps/jolici")
		    docker.build("copybirds","apps/copybirds")
		    docker.build("nodered","apps/nodered")
		    docker.build("beaverdam","apps/beaverdam")
		    docker.build("labelImage","apps/labelImage")
		    docker.build("matlab_runtime","apps/matlab_runtime")
		}
	    },
	    "base":{
		stage ("build"){
		    docker.build("ubuntu","base/ubuntu")
		    docker.build("cuda","base/cude")
		    docker.build("debian","base/debian")
		    docker.build("gentoo","base/gentoo")
		    docker.build("alpine","base/alpine")
		}
	    }
	)
    }
}
