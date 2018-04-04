VAGRANTFILE_API_VERSION = "2"

require 'pathname'

def os_walk(dir)
  root = Pathname(dir)
  files, dirs = [], []
  Pathname(root).find do |path|
    unless path == root
      dirs << path if path.directory?
      files << path if path.file?
    end
  end
  [root, files, dirs]
end

root, files, dirs = os_walk('.')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.define "default" do |default|
    # get docker env
    default.vm.box = 'hashicorp/boot2docker'    
    
    # the application data
    default.vm.synced_folder ".", "/opt/docker", type: "rsync", create: true
    
    # start docker provisioning
    default.vm.provision "docker" do |docker|
   
      files.each { |file|
          # seach for all the dockerfiles in the filesystem
        if file.to_s =~ /dockerfile/i
          # for tagging
          dn = file.dirname.to_s.split('/')
          docker.build_image "/opt/docker/#{file.dirname.to_s}", args: "-t \"#{ENV['DOCKER_ID_USER']}/#{dn.last}\""
        end
      }

      # run shell command
      default.vm.provision "shell", inline: "docker login -u #{ENV['DOCKER_ID_USER']} -p #{ENV['DOCKER_PASSWD']}"
    end

    # The default machine already has support for SSH
    default.ssh.insert_key = true
    default.ssh.username = "docker"
    default.ssh.password = "tcuser"
    
  end
  
end
