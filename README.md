# vagrant-terraform-aws

A Vagrant box that installs Terraform and the AWS CLI

## Install

**Prerequisite software: Vagrant and a hypervisor like VirtualBox**

```bash
vagrant up # make sure you're in the project root
```

## Connect to your VM

If you're on a Mac, you can configure your SSH client by getting the output from `vagrant ssh-config` after you run the install step

```bash
# example output from ssh-config
Host default
  HostName 127.0.0.1
  User vagrant
  Port 2200
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile ~/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

Copy the output from your command but modify the Host from "default" to whatever you want to name it and paste the info into your `~/.ssh/config` file. You can now connect a code editor like Visual Studio Code (vscode) to your VM (to do this with vscode, make sure you have remote development installed https://code.visualstudio.com/docs/remote/ssh and connect to the host you defined).