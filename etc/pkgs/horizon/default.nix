with import <nixpkgs> { };

stdenv.mkDerivation rec {
  pname = "horizon-gtk";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "karetsu";
    repo = "horizon-gtk";
    rev = "b14805344e8524a826f574b50a80842f93436fb1";
    sha256 = "1h52zx41dc6qza7fsgx9izm2jphqgk8q6pv46w8nmrfq6bbnvnn1";
  };

  buildInputs = with pkgs; [ gtk-engine-murrine sass ];

  installPhase = ''
    mkdir -p $out/share/themes/horizon
    sass gtk-3.20/gtk.scss > gtk-3.20/gtk.css 2>build.log
    cp -a * $out/share/themes/horizon
  '';

  meta = with stdenv.lib; {
    description = "Dark GTK theme based on horizon for atom";
    homepage = "https://github.com/karetsu/horizon-gtk";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ ];
  };

}
