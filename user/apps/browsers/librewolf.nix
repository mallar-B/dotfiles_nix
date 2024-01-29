{pkgs, ...}:
{
    home.packages = [ pkgs.librewolf ];
    programs.librewolf.enable = true;
}