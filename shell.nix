with (import <nixpkgs> {});
let
  gems = bundlerEnv {
  name = "mhejduk.com-bundler-env";
  inherit ruby;
  gemdir = ./.;
  };
in mkShell {
  name = "mhejduk.com";
  buildInputs = [ gems (lowPrio gems.wrappedRuby) nodejs ];
}
  
