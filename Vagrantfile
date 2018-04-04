VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.define "default" do |default|
    default.vm.box = 'hashicorp/boot2docker'    
    
    # The application code
    default.vm.synced_folder ".", "/opt/docker", type: "rsync", create: true

    default.vm.provision "docker" do |docker|
      docker.build_image "/opt/docker/apps/copybirds", args: '-t "afeldman/copybirds"'
    end

    # The default machine already has support for SSH
    default.ssh.insert_key = true
    default.ssh.username = "docker"
    default.ssh.password = "tcuser"
  end
end
