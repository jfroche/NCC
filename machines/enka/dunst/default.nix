{ pkgs, theme, homeConfiguration, enabled, ... }:

homeConfiguration "nixos" {
  services.dunst = enabled {
    iconTheme = {
      name    = "Gruvbox-Dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

    settings.global = {
      horizontal_padding = 10;
      padding            = 10;

      frame_color     = "#" + theme.activeHighlight;
      frame_width     = 2;
      seperator_color = "frame";

      background = "#" + theme.background;
      foreground = "#" + theme.foreground;

      alignment = "left";
      font      = "OpenSans 12";

      origin = "top-center";
      offset = "0x20";
    };

    settings.urgency_low = {
      frame_color = "#" + theme.low;
      timeout     = 5;
    };

    settings.urgency_normal = {
      frame_color = "#" + theme.medium;
      timeout     = 10;
    };

    settings.urgency_critical = {
      frame_color = "#" + theme.high;
      timeout     = 15;
    };
  };
}
