{ config, pkgs, ... }:
{
  boot.loader.grub.device = "nodev";
  fileSystems."/" =
    {
      device = "/dev/sda1";
      fsType = "ext4";
    };
  system.stateVersion = "23.05";

}
