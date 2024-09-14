# FullStack-Blogging-App
### Application Code Created by Code With GoldenCat Youtube Channel.
- Create two(SonarQube and Nexus) virtual machines with Ubuntu24:04 t2.medium(4GiB 2CPU) 20GB Volume.
- Create Jenkins Machine with Ubuntu24:04 with t2.large with 25GB.(Install jdk-17 and Jenkins, Docker)
```
sudo apt install docker.io -y
sudo chmod 666 /var/run/docker.sock
```

- Nexus Installation
```
sudo docker run -d -p 8081:8081 --name nexus sonatype/nexus3
nexus username: admin
password: sudo docker exec -it nexus /bin/bash
cat sonatype-work/nexus3/admin.password  
```
- SonarQube Installation
```
sudo docker run -d -p 9000:9000 --name sonarqube sonarqube:lts-community
```
### Jenkins Plugins
 * sonarqube scanner
 * config File provider
 * Maven Integration
 * Pipeline Maven Integration
 * Kubernetes
 * Kubernetes Credentials
 * Kubernetes CLI
 * kubernetes Client API
 * Docker
 * Docker Pipeline
 * Eclipse Temurin installer
 * Pipeline: Stage View

- Create Token in sonarqube and save it.
- Configure Plugins in Tools Section
    * Docker (docker)
    * Maven (maven3)
    * SonarQube (sonar-scanner)
    * JDK (jdk17 install from adoptium.net jdk-17.1.11+9)
