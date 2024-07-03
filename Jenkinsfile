pipeline {
    agent any
    environment{
        SONAR_HOME= tool "Sonar"
    }
    stages {
        stage('Code Clone') {
            steps {
                git url: 'https://github.com/Bakhtawarkhan90/wanderlust.git', branch: 'devops'
            }
        }
        
        stage('Code Quality Analysis'){
            steps{
                withSonarQubeEnv("Sonar"){
                    sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=wanderlust -Dsonar.projectKey=wanderlust"
                }
            }
        }
        stage('Build with Docker') {
            steps {
                sh 'docker-compose down'           
                sh 'docker-compose build'
                sh 'docker-compose up  -d'
                sh 'docker exec -it mongo mongoimport --db wanderlust --collection posts --file ./data/sample_posts.json --jsonArray'
            }
        }
    }
}
