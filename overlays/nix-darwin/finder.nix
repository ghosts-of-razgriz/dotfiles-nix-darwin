{ lib, ... }:
with lib;
{
  options = {
    system.defaults.finder.NewWindowTarget = mkOption {
      type = types.nullOr (
        types.enum [
          "PfHm"
          "PfDe"
          "PfDo"
          "PfAp"
          "PfLa"
          "PfLi"
          "PfCm"
          "PfAF"
          "PfVo"
          "PfSr"
        ]
      );
      default = null;
      description = ''
        Where to open new finder windows. Valid values include:

        *  null : - Opens the "Recent" folder
        * `PfHm`: - Opens the user's home folder 
        * `PfDe`: - Opens the "Desktop"
        * `PfDo`: - Opens the "Documents" folder.
        * `PfAp`: - Opens the "Applications" folder.
        * `PfLa`: - Opens the "Downloads" folder.
        * `PfLi`: - Opens the "Library" folder.
        * `PfCm`: - Opens "Computer" (shows all mounted volumes).
        # `PfAF`: - Opens "All My Files"
        * `PfVo`: - Opens "Volumes"
        * `PfSr`: - Opens "AirDrop".
      '';
    };

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
