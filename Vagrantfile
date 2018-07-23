# -*- mode: ruby -*-
# vi: set ft=ruby :

###################################################################################################

Vagrant.configure("2") do |config|

 config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1"]
  end

 config.vm.define "jenkins" do |serv|
    serv.vm.box = "ubuntu/xenial64"
    serv.vm.hostname = "jenkins"
    serv.vm.network :private_network, ip: "192.168.56.100",
    netmask: "28",
	virtualbox__intnet: true
	serv.vm.network :private_network, type: "dhcp"
    serv.vm.provider "virtualbox" do |pmv|
      pmv.memory = 2048
      pmv.cpus = 1
	end
#   java install
	serv.vm.provision "shell", inline: "sudo apt-get update -y"
	serv.vm.provision "shell", inline: "sudo apt-get install default-jre default-jdk -y"
#   jenkins install (elinks, nmap)
	serv.vm.provision "shell", inline: "wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -"
	serv.vm.provision "shell", inline: "echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list"
	serv.vm.provision "shell", inline: "sudo apt-get update -y"
	serv.vm.provision "shell", inline: "sudo apt-get install jenkins -y"
#   git install
	serv.vm.provision "shell", inline: "sudo apt-get install git -y"
#   maven install
	serv.vm.provision "shell", inline: "sudo apt-get install maven -y"
	serv.vm.provision "shell", inline: "export MAVEN_HOME=/usr/share/maven"
	serv.vm.provision "shell", inline: "export PATH=${MAVEN_HOME}/bin:${PATH}"
#   ansible install
	serv.vm.provision "shell", inline: "sudo apt-get install software-properties-common"
	serv.vm.provision "shell", inline: "sudo apt-add-repository ppa:ansible/ansible -y"
	serv.vm.provision "shell", inline: "sudo apt-get update -y"
	serv.vm.provision "shell", inline: "sudo apt-get install ansible -y"
#   docker install
	serv.vm.provision "shell", inline: "sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y"
	serv.vm.provision "shell", inline: "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
	serv.vm.provision "shell", inline: 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" '
	serv.vm.provision "shell", inline: "sudo apt-get update -y"
	serv.vm.provision "shell", inline: "sudo apt-get install docker-ce -y"
	serv.vm.provision "shell", inline: "sudo usermod -aG docker $USER"
#   docker registry install
    serv.vm.provision "shell", inline: "sudo docker run -d -p 5000:5000 --name registry registry:2"
#   pip install
    serv.vm.provision "shell", inline: "sudo apt-get install python-pip -y"
#   docker-compose install
    serv.vm.provision "shell", inline: "sudo pip install docker-compose"
#   unzip install
    serv.vm.provision "shell", inline: "sudo apt-get install unzip -y"
#   Artifactory install
    serv.vm.provision "file",  source: "~/profile/.", destination: "/tmp/"
	serv.vm.provision "shell", inline: "sudo cp -f /tmp/profile/profile /etc/profile"
	serv.vm.provision "shell", inline: "source /etc/profile"
    serv.vm.provision "shell", inline: "wget https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-5.1.3.zip"
	serv.vm.provision "shell", inline: "sudo unzip download_file?file_path=jfrog-artifactory-oss-5.1.3.zip"
	serv.vm.provision "shell", inline: "sudo artifactory-oss-5.1.3/bin/artifactoryctl start"
	end

 config.vm.define "DevTools" do |c1|
    c1.vm.box = "ubuntu/xenial64"
    c1.vm.hostname = "DevTools"
    c1.vm.network :private_network, ip: "192.168.56.101",
	netmask: "28",
	virtualbox__intnet: true
	c1.vm.network :private_network, type: "dhcp"
#   python install
	c1.vm.provision "shell", inline: "sudo apt-get update -y"
	c1.vm.provision "shell", inline: "sudo apt-get install python -y"
#	c1.vm.provision "file",  source: "~/profile/.", destination: "/tmp/"
#   c1.vm.provision "shell", inline: "sudo cp -f /tmp/profile/daemon.json /etc/docker/daemon.json"
#   java install
	c1.vm.provision "shell", inline: "sudo apt-get update -y"
	c1.vm.provision "shell", inline: "sudo apt-get install default-jre default-jdk -y"
#   docker install
#	c1.vm.provision "shell", inline: "sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y"
#	c1.vm.provision "shell", inline: "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
#	c1.vm.provision "shell", inline: 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" '
#	c1.vm.provision "shell", inline: "sudo apt-get update -y"
#	c1.vm.provision "shell", inline: "sudo apt-get install docker-ce -y"
#   pip install
#    c1.vm.provision "shell", inline: "sudo apt-get install python-pip -y"
#   docker-compose install
#    c1.vm.provision "shell", inline: "sudo pip install docker-compose"
 end

 config.vm.define "CI" do |c2|
    c2.vm.box = "ubuntu/xenial64"
    c2.vm.hostname = "CI"
    c2.vm.network :private_network, ip: "192.168.56.102",
    netmask: "28",	
	virtualbox__intnet: true
	c2.vm.network :private_network, type: "dhcp" 
#   python install
	c2.vm.provision "shell", inline: "sudo apt-get update -y"
	c2.vm.provision "shell", inline: "sudo apt-get install python -y"
#   java install
#	c2.vm.provision "shell", inline: "sudo apt-get update -y"
#	c2.vm.provision "shell", inline: "sudo apt-get install default-jre default-jdk -y"
#   docker install
#	c2.vm.provision "shell", inline: "sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y"
#	c2.vm.provision "shell", inline: "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
#	c2.vm.provision "shell", inline: 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" '
#	c2.vm.provision "shell", inline: "sudo apt-get update -y"
#	c2.vm.provision "shell", inline: "sudo apt-get install docker-ce -y"
#   pip install
#    c2.vm.provision "shell", inline: "sudo apt-get install python-pip -y"
#   docker-compose install
#    c2.vm.provision "shell", inline: "sudo pip install docker-compose"
 end
 
  config.vm.define "QA" do |c3|
    c3.vm.box = "ubuntu/xenial64"
#	c3.vm.box = "apnunes/xenial-python"
    c3.vm.hostname = "QA"
    c3.vm.network :private_network, ip: "192.168.56.103",
    netmask: "28",	
	virtualbox__intnet: true
	c3.vm.network :private_network, type: "dhcp" 
#   python install
	c3.vm.provision "shell", inline: "sudo apt-get update -y"
	c3.vm.provision "shell", inline: "sudo apt-get install python -y"
#   java install
#	c3.vm.provision "shell", inline: "sudo apt-get update -y"
#	c3.vm.provision "shell", inline: "sudo apt-get install default-jre default-jdk -y"
#   docker install
#	c3.vm.provision "shell", inline: "sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y"
#	c3.vm.provision "shell", inline: "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
#	c3.vm.provision "shell", inline: 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" '
#	c3.vm.provision "shell", inline: "sudo apt-get update -y"
#	c3.vm.provision "shell", inline: "sudo apt-get install docker-ce -y"
#   pip install
#    c3.vm.provision "shell", inline: "sudo apt-get install python-pip -y"
#   docker-compose install
#    c3.vm.provision "shell", inline: "sudo pip install docker-compose"
 end
 
end