with (import <nixpkgs> {});
# let
#   gems = bundlerEnv {
#   name = "mhejduk.com-bundler-env";
#   inherit ruby;
#   gemdir = ./.;
#   };
# in mkShell {
#   name = "mhejduk.com";
#   buildInputs = [ gems (lowPrio gems.wrappedRuby) nodejs ];
# }
let jekyll_env = bundlerEnv rec {
    name = "jekyll_env";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in
  stdenv.mkDerivation rec {
    name = "nathan.gs";
    buildInputs = [ jekyll_env bundler ruby ];

    shellHook = ''
      exec ${jekyll_env}/bin/jekyll serve --watch
    '';
  }
