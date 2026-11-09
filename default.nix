{ stdenv
, lib
, fetchFromGitHub
, qt6
}:

stdenv.mkDerivation {
  pname = "libki-client";
  version = "qt6-a407558";

  src = fetchFromGitHub {
    owner = "Libki";
    repo = "libki-client";
    rev = "a407558d3170d8f8184f8ba2918fc672e7cf7f1c";
    hash = "sha256-PSXkhMuFTWpKzoBegf757h6VogfJiLTvH2yCtQ3F8f8=";
  
};

  nativeBuildInputs = [
    qt6.qmake
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtdeclarative
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 libkiclient $out/bin/libkiclient
    runHook postInstall
  '';

  meta = {
    description = "Libki Client, built from the Qt 6 branch";
    homepage = "https://github.com/Libki/libki-client";
    license = lib.licenses.gpl3Plus;
    platforms = lib.platforms.linux;
  };
}

