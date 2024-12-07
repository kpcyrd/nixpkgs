{
  lib,
  fetchFromGitHub,
  rustPlatform,
  android-tools,
}:

rustPlatform.buildRustPackage rec {
  pname = "spytrap-adb";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "spytrap-org";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-CL+MxSzHpOq2MXmsaa9sipQZ06Kkzy4r1eFjUrPSj1E=";
  };

  cargoHash = "sha256-Utg3ds0nGAUjBfuEjGfkohkmssKIZT1NiH9hiFnW4ps=";

  SPYTRAP_ADB_BINARY = "${android-tools}/bin/adb";

  meta = with lib; {
    description = "Test a phone for stalkerware using adb and usb debugging to scan for suspicious apps and configuration";
    homepage = "https://github.com/spytrap-org/spytrap-adb";
    changelog = "https://github.com/spytrap-org/spytrap-adb/releases/tag/v${version}";
    license = with licenses; [ gpl3Plus ];
    maintainers = with maintainers; [ kpcyrd ];
    platforms = platforms.all;
  };
}
