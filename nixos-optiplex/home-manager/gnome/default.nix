{ config, pkgs, ...}:

{
  home.packages = with pkgs; [ 
    #Shell Extensions
    gnomeExtensions.just-perfection
    gnomeExtensions.desktop-cube
    gnomeExtensions.gnome-clipboard
    gnomeExtensions.blur-my-shell
    
    #Icon Theme
    papirus-icon-theme

    #Dependencies for GTK theme
    gnome.gnome-themes-extra
    sassc
    gtk-engine-murrine

    #Gnome Tweaks
    gnome.gnome-tweaks

    #Other gnome things
    gnome.dconf-editor
  ];

  home.file = {
    ".config/background".source = ./wallpaper.png;
  };

  gtk = {
    enable = true;
    theme.name = "Orchis-Pink-Light";
    iconTheme.name = "Papirus";
  };
  
  #Gnome Settings
  dconf.settings = {

    #Enable Extensions
    "org/gnome/shell" = {
      enabled-extensions = [
        "desktop-cube@schneegans.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "just-perfection-desktop@just-perfection"
        "blur-my-shell@aunetx"
      ];
    };

    #Add the minimize and maximize buttons to titlebars
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    #Desktop Cube Extension Configration
    "org/gnome/shell/extensions/desktop-cube" = {
      last-first-gap = false;
    };

    #Set user theme
    "org/gnome/shell/extensions/user-theme" = {
      name = "Orchis-Pink-Light";
    };
    
    #Set wallpaper
    "org/gnome/desktop/background" = {
      picture-uri = "/home/neptune/.config/background";
      picture-uri-dark = "/home/neptune/.config/background";
    };

    #Just Perfection Extension config"
    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      activities-button = false;
      app-menu = false;
      app-menu-icon = true;
      app-menu-label = false;
      clock-menu-position = 1;
      panel = true;
    };
  };
}
