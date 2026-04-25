{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  packages = [
  (pkgs.python3.withPackages(p: with p; [
    pandas
    numpy
    seaborn
    matplotlib
    pyqt5
    tkinter
  ]))
  ];

  # packages = with pkgs; [
  #   python314
  #   python314Packages.pandas
  #   python314Packages.numpy
  #   python314Packages.seaborn
  #   python314Packages.matplotlib
  #   python314Packages.pyqt5
  #   python314Packages.tkinter
  # ];

  shellHook = ''
    cd ~/Documents/Academia/dev/Cálculo_Energético_Computacional/ && zsh
  '';
}
