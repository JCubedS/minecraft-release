# Minecraft Bosh Release

Using [BOSH](https://bosh.io) to deploy a minecraft server using the Regrowth modpack.

## Package Requirements

This bosh deployment contains four packages:

- screen - A full screen window manager. Allows running minecraft in a detached screen. [Download](http://ftp.gnu.org/gnu/screen/screen-4.5.1.tar.gz)
- java - Required for running minecraft. This release uses JRE 8u131 x64 for Linux. Can be downloaded from [Oracle](https://www.oracle.com/java/index.html)
- modpacks - Contains all modpacks to use in minecraft. For example this release uses Regrowth [Download](http://ftb.cursecdn.com/FTB2/modpacks/Regrowth/1_0_2/RegrowthServer.zip)
- minecraft - The minecraft server binaries. This release uses Minecraft Forge [Download](http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar)


**NOTE**: The Regrowth modpack noted above also contains the minecraft server binaries. As such, the modpack needs to be repackaged without these binaries.

1. Unzip RegrowthServer.zip
2. Remove everything but the 'config', 'mods', and 'scripts' directories
3. Zip the three directories above into a zip file called 'RegrowthServer-1.0.2.zip'


## Create and upload the release

Once the packages have been downloaded and updated (i.e. Regrowth Modpack), they can be added as blobs('bosh add-blob) in the release.

**NOTE**: You may need to remove the old blobs first

Once the blobs have been added, the release can be created('bosh create-release') and then uploaded('bosh upload-release')

## Stemcell

The Minecraft Bosh Release is designed to run on an 'ubuntu-trusty' [stemcell](http://bosh.cloudfoundry.org/stemcells/).

## Deploying the minecraft server

This repo contains a default deployment manifest for deploying the server on a Bosh Director running on [VirtualBox](https://www.virtualbox.org/).
The Bosh Lite Warden stemcell will need to be uploaded first before deploying the server.

The deployment manifest will also create a persistent disk of 3GB, and store the world data there. All other data is stored on the same disk as the VM.

### Configurable properties

Coming soon
