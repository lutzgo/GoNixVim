{ inputs, ... }: {
  imports = [
    inputs.devshell.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    devshells.default = {
      commands = [
        { package = config.packages.nodejs; category = "docs"; }
      ];
      packages = with pkgs; [
        ocrmypdf
        nodejs
      ];
    };
  };
}
