# configuration.nix
{ config, lib, pkgs, ... }: {
  # customize kernel version
  boot.kernelPackages = pkgs.linuxPackages_5_15;
  
  users.groups.admin = {};
  users.users = {
    admin = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      password = "admin";
      group = "admin";
    };
  };

  virtualisation.vmVariant = {
    # following configuration is added only when building VM with build-vm
    virtualisation = {
      memorySize = 2048; # Use 2048MiB memory.
      cores = 3;
      graphics = false;
    };
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  networking.firewall.allowedTCPPorts = [ 22 ];
  environment.systemPackages = with pkgs; [
    htop
  ];

  system.stateVersion = "24.05";
}
