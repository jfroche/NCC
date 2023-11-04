{ lib, pkgs, systemPackages, homePackages, ... }: lib.recursiveUpdate

(with pkgs; systemPackages [
  fd
  fzf
  htop
  jq
  neofetch
  ripgrep
  thefuck
  tree

  wine

  clang-tools_16
  go
  jdk
  maven
  vlang
  zig

  (fenix.complete.withComponents [
    "cargo"
    "clippy"
    "rust-src"
    "rustc"
    "rustfmt"
  ])

  lightly-qt
])

(with pkgs; homePackages "nixos" [
  jetbrains.idea-ultimate
  vscode-fhs

  graphviz
  # heroic
  qbittorrent
  thunderbird

  kazam
  krita
  obs-studio

  libreoffice
  hunspellDicts.en_US
  hunspellDicts.en_GB-ize
])