{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ruby
    pkgs.bundler
    pkgs.nodejs
    # pkgs.jekyll  # Optionally include Jekyll directly if you prefer
  ];

  # Any commands here will run automatically when you enter the shell
  shellHook = ''
    echo "-------------------------------------------------------------"
    echo "Nix shell for Jekyll development:"
    echo "1) Run 'bundle install' to install required gems."
    echo "2) Then run 'bundle exec jekyll serve' to start your local site."
    echo "-------------------------------------------------------------"
  '';
}
