# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
# Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages.
  packages = [
    
    # pkgs.go
    pkgs.go
    pkgs.python311
    pkgs.nodejs_20
    pkgs.nodePackages.nodemon
  ];

  myJdk21 = pkgs.stdenv.mkDerivation {
    pname = "openjdk-jdk21u";
    version = "21.0.7";
    src = pkgs.lib.cleanSource ./external_sdks/openjdk-jdk21u-release-jdk-21.0.7_6.zip;
    nativeBuildInputs = [ pkgs.unzip ];
    installPhase = ''
      cp -r * $out/libexec/jdk-21/
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
     
      };
     };
  };
}
