{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    pkgs.python3
    ffmpeg
    fuse3
    gcc
    libevdev
    xclip
  ];

  shellHook = ''
    appimage-run ~/Downloads/GameSentenceMiner-2026.4.4.AppImage
  '';
}
