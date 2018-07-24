node {
   def commitHash = checkout(scm).GIT_COMMIT
   def mvnHome
   def server = Artifactory.server 'Artifactory_server'
   def buildInfo = Artifactory.newBuildInfo()
   def uploadSpec = """{
     "files": [
       {
          "pattern": "target/*.jar",
          "target": "test_folder/${commitHash[0..6]}/"
        }
     ]
    }"""
   stage('Download Git') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/SergeyKonotop/CI_CD_demo.git'
      mvnHome = tool 'maven_3.3.9'
   }
   stage('Build with Maven') {
      // Run the maven build
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn'  -Dmaven.test.failure.ignore clean install"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
   }
   stage('Put build to Artifactory') {
      archiveArtifacts 'target/*.jar'
      server.upload spec: uploadSpec, buildInfo: buildInfo
      server.publishBuildInfo buildInfo 
   }  
}
