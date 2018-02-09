node {
    def app

    stage('Clone repository') {
        checkout scm
    }

   stage('Build image') {
      agent any
      steps {
        sh 'docker build -t apps/copybirds .'
      }
   }
}