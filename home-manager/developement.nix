{pkgs,...}:
{
  home.packages = with pkgs;[
    github-desktop
    nodejs_22
  ];
  programs.neovim.withNodeJs = true;
  programs.vscode.enable = true;
}
