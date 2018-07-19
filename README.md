# Basic Python Vagrant Machine
This is a basic vagrant machine, that when you run the initial configuration of `vagrant up`, it downloads and configures a simple Ubuntu Artful64 Virtual Machine as well as installs Python/Python3

# Installation
After downloading/forking the repository, navigate to the project folder in a command prompt and enter `vagrant up` The console will then spill out a bunch of text while it prepares the environment. At some point during the installation you may see:

```
    default: SSH auth method: private key
    default: Warning: Connection reset. Retrying...
    default: Warning: Remote connection disconnect. Retrying...
    default: Warning: Connection reset. Retrying...
    default: Warning: Remote connection disconnect. Retrying...
```

If you do, just let it continue trying, it will eventually time out (should) automatically and correct itself.  There will then be *even more* configurations that are run, installing Python/Python3.  This entire installation/configuration may take anywhere from 5-10 minutes depending on internet speed/computer specs.

When the automated configuration has completed and you have a command prompt again, enter `vagrant ssh` and you will be up and running inside the virtual machine. Feel free to run `Python` or `Python3` in the command prompt to verify it was properly configured.

This virtual machine also has a pre-configured shared folder called `/shared_vagrant_folder` which then allows you to add or remove files from the environment.