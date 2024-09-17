pipeline {
    agent any

    tools {
        jdk 'jdk17'
        maven 'maven3'
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git-cred', url: 'https://github.com/kishore-vhs/blogging/'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Trivy FS Scan') {
            steps {
                sh 'trivy  fs --format table --output=trivy-report.json .'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SCANNER_HOME/bin/bsonar-scanner \
                          -Dsonar.projectName=Blogging-app \
                          -Dsonar.projectKey=Blogging-app \
                          -Dsonar.java.binaries=target'''
                }
            }
        }
        stage('Publish Artifacts') {
            steps {
                withMaven(globalMavenSettingsConfig: 'maven-settings', jdk: 'jdk17', maven: 'maven3', globalMavenSettingsConfig: ",traceability: true") {
                    sh 'mvn deploy'
                }
            }
        }
        stages('Docker Build and Tag') {
            steps {
                withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                    sh "docker build -t hemasivakishore/bloggingapp:latest ."
                }
            }
        }
        stages ('Trivy Image Scan') {
            steps {
                sh "trivy image --format table --output image.json hemasivakishore/bloggingapp:latest"
            }
        }

        stages ('Docker Push') {
            steps {
                withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                    sh "docker push hemasivakishore/bloggingapp:latest"
                }
            }
        }
    }
}