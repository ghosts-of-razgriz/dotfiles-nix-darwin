{ lib, ... }:
with lib;
{
  options = {
    system.defaults.finder.ShowHardDrivesOnDesktop = mkOption {
      type = types.nullOr types.bool;
      default = false;
      description = ''
        Show connected hard drives on the desktop.
      '';
    };

    system.defaults.finder.ShowMountedServersOnDesktop = mkOption {
      type = types.nullOr types.bool;
      default = false;
      description = ''
        Show connected network drives on the desktop.
      '';
    };

    system.defaults.finder.ShowRemovableMediaOnDesktop = mkOption {
      type = types.nullOr types.bool;
      default = false;
      description = ''
        Show connected removable drives on the desktop.
      '';
    };
  };
}
