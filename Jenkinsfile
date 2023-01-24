pipeline{
    agent any
    tools{
        maven 'maven'
    }
    
    stages{
        stage('git clone'){
            steps{
                script{
                    git credentialsId: '0ce24123-5e36-4c6b-956b-99b8fcb605f2', url: 'https://github.com/omchapaigit/maven.git'
                }
            }
        }
        // stage('maven version set'){
        //     steps{
        //         script{
        //             sh "mvn versions:set -DnewVersion=1.0.2"
        //         }
        //     }
        // }
        stage('maven build'){
            steps{
                script{
                    sh "mvn clean package"
                }
            }
        }
        stage('get pom version'){
            steps{
                script{
                    sh "mvn help:evaluate -Dexpression=project.version"
                }
            }
        }
        stage('docker build and push'){
            steps{
                script{
                    withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
                    sh '''
                    ls -ltr
                    docker build -t omchapaid/tomcat:R3 .
                    docker push omchapaid/tomcat:R3
                    '''
                }
                }
            }
        }
    }
}
