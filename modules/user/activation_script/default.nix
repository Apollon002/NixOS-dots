{ config, lib, ... };
let
  dmsEnabled = config.userSettings.ui.dms.enable;
in
# Ensures some emtpy folders & files are created so home-manager doesn't cancel the build process
home.activation = {
  installPywalfox = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    set -u
    mkdir -p ~/.config/niri/dms
    touch ~/.config/niri/dms/colors.kdl
    mkdir -p ~/.cache/wal
    ln -sfn ~/.cache/wal/dank-pywalfox.json ~/.cache/wal/colors.json 2>/dev/null
  '';
};
