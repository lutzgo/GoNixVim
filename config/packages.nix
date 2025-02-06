{ pkgs, ... }:
{
    extraPackages = with pkgs; [
        fd
        fzf
        ripgrep-all
        wl-clipboard-rs
        xclip
        yazi
    ];
}