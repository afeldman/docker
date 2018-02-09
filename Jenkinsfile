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
		stage ("build ubuntu"){
		    docker.build("ubuntu","base/ubuntu")
		    
		};
		stage ("build alpine") {
		    docker.build("alpine:latest","base/alpine","--build-arg BASE=\"alpine:v3.7\"")
		};
		stage ("build gentoo"){
		    docker.build("gentoo","base/gentoo")
		};
		stage ("build cuda"){
		    docker.build("cuda","base/cude")
		};
		stage ("build debian"){
		    docker.build("debian","base/debian")
		}
	    }
	)
    }
}
