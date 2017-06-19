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

Supported deployment properties include:

```
server.port:
     description: The port the server listens on
     default: 25565

server.seed:
      description: The seed value for the world
      default: <empty string>

server.spawn_npcs:
      description: Determines if villages should spawn
      default: true

server.spawn_animals:
      description: Determines if animals should spawn
      default: true

server.spawn_monsters:
      description: Determines if monsters should spawn
      default: true

server.difficulty:
      description: Sets the difficulty level of the world. (0 - Peaceful; 1 - Easy; 2 - Normal; 3 - Hard)
      default: 1

server.pvp:
      description: Determined if Player vs. Player is enabled
      default: true

server.gamemode:
      description: Defines the mode of gameplay. (0 - Survival; 1 - Creative; 2 - Adventure; 3 - Spectator)
      default: 0

server.max_players:
      description: The maximum of concurrent players
      default: 20

server.motd:
      description: Message of the day - Displayed when the user logs in
      default: 'A Minecraft Server'

server.world_name:
      description: Name of the world. Used to name the world and its associated save folder
      default: 'world'
```