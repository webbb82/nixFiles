# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
     #./fish-config.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      bind = SUPER, Return, exec, kitty
      # ...
    '';
  };

 home.username = "webb";
  home.homeDirectory = "/home/webb/xfiles";
  programs.git = {
    enable = true;
    userName  = "webbb82";
    userEmail = "webbb82@gmail.com";
  };
  nixpkgs = {
    # You can add overlays here
 #   overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
     # outputs.overlays.additions
     # outputs.overlays.modifications
     # outputs.overlays.unstable-packages
#];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

 home.packages = with pkgs; [ git steam obsidian krusader dolphin sof-firmware zellij
    zip unar helix neofetch alacritty vscodium discord chromium lapce
    archiver variety zsh-nix-shell espanso thunderbird rofi wezterm sxhkd slurp eww-wayland wtype swaybg onagre ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  
  # Hyprland
  programs.hyprland = { # or wayland.windowManager.hyprland
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
  };
  nvidiaPatches = false;
};

  home.file = {
   };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}