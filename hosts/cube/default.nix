{ config, ulib, keys, ... }: with ulib; merge

(systemConfiguration {
  system.stateVersion  = "23.05";
  nixpkgs.hostPlatform = "x86_64-linux";

  networking.domain = "rgbcu.be";

  time.timeZone = "Europe/Amsterdam";

  users.users.root.passwordFile = config.age.secrets."cube/password.hash.rgb".path;

  users.users.rgb = normalUser {
    description                 = "RGB";
    extraGroups                 = [ "wheel" ];
    openssh.authorizedKeys.keys = [ keys.rgbcube ];
    hashedPasswordFile          = config.age.secrets."cube/password.hash.rgb".path;
  };
})

(homeConfiguration {
  home.stateVersion = "23.11";
})
