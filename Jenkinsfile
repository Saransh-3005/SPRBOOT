pipeline {
    agent any
    tools{
        jdk 'JDK-17'
        maven 'Maven'
    }
    stages {
        stage('Checkout Code') {
            steps {
                echo 'Pulling from Github'
                git branch: 'main', credentialsId: 'GITHUB USER', url: 'https://github.com/Saransh-3005/MAVENJENKINS1.git'
            }
        }
         


    stage('Build Project') {
      steps {
        echo 'Building Java project'
        bat 'mvn clean package -DskipTests'
      }
    }
    stage('Build the Docker Image') {
      steps {
        echo 'Building Docker Image'
        bat 'docker build -t myjavaproj:1.0 .'
      }
    }
    
    stage('Run Docker Container') {
      steps {
        echo 'Running Java Application'
        bat '''
        docker rm -f myjavaproj-container || exit 0
        docker run --name myjavaproj-container myjavaproj:1.0
        
        '''               
      }
    }
  }
  post {
    success {
      echo 'BUild and Run is SUCCESSFUL!'
    }
    failure {
      echo 'OOPS!!! Failure.'
    }
  }
}
