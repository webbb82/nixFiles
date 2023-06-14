# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
          <home-manager/nixos> 

    ];

  # systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Bigger console font
  boot.loader.systemd-boot.consoleMode = "2";
  # Prohibits gaining root access by passing init=/bin/sh as a kernel parameter
  boot.loader.systemd-boot.editor = false;
  # Enable all the firmware
  hardware.enableAllFirmware = true;
  # Enable all the firmware with a license allowing redistribution. (i.e. free firmware and firmware-linux-nonfree)
  hardware.enableRedistributableFirmware = true;
  # Enable OpenGL drivers
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];

  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 524288; # Allow VS Code to watch more files
  };

  # A DBus service that allows applications to update firmware
  services.fwupd.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

   # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.enable = true;
  # Enable flatpacks
  services.flatpak.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
# Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
     };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.webb = {
    isNormalUser = true;
    description = "llama";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      obsidian
      krusader
      dolphin
      sof-firmware
      zellij
      contour
      plasma-desktop
      helix
      neofetch
      alacritty
      vscodium
      discord
      chromium 
      archiver
      variety
    zsh-nix-shell
      espanso
      thunderbird  
           
    #  thunderbird
    ];
  };
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
      enable = true;
       enableCompletion = true;};
programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" "fzf-tab" ];
    theme = "agnoster";};    
home-manager.users.webb = { pkgs, ... }: {
  home.packages = [ pkgs.atool pkgs.httpie ];
  programs.bash.enable = true;
    home.stateVersion = "23.05";

};
fonts.fonts = with pkgs; [
  (nerdfonts.override { fonts = [ 
  "FiraCode"
  "DroidSansMono" ]; })
];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  lf
  nnn
  # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
          <home-manager/nixos> 

    ];

  # systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Bigger console font
  boot.loader.systemd-boot.consoleMode = "2";
  # Prohibits gaining root access by passing init=/bin/sh as a kernel parameter
  boot.loader.systemd-boot.editor = false;
  # Enable all the firmware
  hardware.enableAllFirmware = true;
  # Enable all the firmware with a license allowing redistribution. (i.e. free firmware and firmware-linux-nonfree)
  hardware.enableRedistributableFirmware = true;
  # Enable OpenGL drivers
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];

  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 524288; # Allow VS Code to watch more files
  };

  # A DBus service that allows applications to update firmware
  services.fwupd.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

   # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.enable = true;
  # Enable flatpacks
  services.flatpak.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
# Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
     };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.webb = {
    isNormalUser = true;
    description = "llama";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      obsidian
      krusader
      dolphin
      sof-firmware
      zellij
      zip
      unar
      contour
      plasma-desktop
      helix
      neofetch
      alacritty
      vscodium
      discord
      chromium 
      archiver
      variety
    zsh-nix-shell
      espanso
      thunderbird  
           
    #  thunderbird
    ];
  };
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
      enable = true;
       enableCompletion = true;};
programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" "fzf-tab" ];
    theme = "agnoster";};    
home-manager.users.webb = { pkgs, ... }: {
  home.packages = [ pkgs.atool pkgs.httpie ];
  programs.bash.enable = true;
    home.stateVersion = "23.05";

};
fonts.fonts = with pkgs; [
  (nerdfonts.override { fonts = [ 
  "FiraCode"
  "DroidSansMono" ]; })
];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  lf
  nnn
  findimagedupes
  cheat
  obsidian 
  krusader 
  hyprland
  hyprland-protocols
  dolphin 
  sof-firmware 
  zellij 
  zip 
  unar 
  pick 
  skim 
  bat 
  waydroid 
  vkdt-wayland 
  xdg-desktop-portal 
  hyprpicker
  wayland 
  waybar
  waylandpp 
  wayland-utils 
  wayland-protocols 
  wlroots 
  helix
  winePackages.waylandFull 
  rofi-wayland
  dbus
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  ostrich-sans
  libsForQt5.sddm
  dbus-broker
  git
  xplr
  unzip
  eww-wayland
  waybar
  neovim
  neofetch
  vim 
  wget
  ];
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
