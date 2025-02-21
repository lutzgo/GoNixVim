{
  perSystem = { config, self', inputs', pkgs, lib, system, ... }: {
    packages.docs = pkgs.buildNpmPackage {
      pname = "docs";
      version = "0.1.0";

      inherit (config.packages) nodejs;

      src = ./.;

      buildInputs = [
        pkgs.vips
      ];

      nativeBuildInputs = [
        pkgs.pkg-config
      ];

      npmFlags = [ "--legacy-peer-deps" ]; # Handle peer dependencies
      makeCacheWritable = true; # Allow writable cache for NPM

      installPhase = ''
        runHook preInstall
        cp -pr --reflink=auto dist $out/
        runHook postInstall
      '';

      npmDepsHash = "sha256-EhEzMuXyvKvLsx6knLS7qtEvRX/P/GrLf9S42zKSaVE=";
    };
  };
}
