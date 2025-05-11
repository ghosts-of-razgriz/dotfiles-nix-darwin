{ configVars, ... }:
{
  system.defaults.dock.autohide = configVars.dockAutohide;
  system.defaults.dock.orientation = configVars.dockOrientation;
  system.defaults.dock.persistent-apps = [ ];
  system.defaults.dock.persistent-others = [ ];
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 16;
  system.defaults.dock.largesize = 128;
  system.defaults.dock.magnification = true;
  system.defaults.dock.enable-spring-load-actions-on-all-items = true;
  system.defaults.dock.appswitcher-all-displays = false;
  system.defaults.dock.launchanim = true;
  system.defaults.dock.mineffect = "genie";
  system.defaults.dock.minimize-to-application = false;
  system.defaults.dock.show-process-indicators = false;
  system.defaults.dock.wvous-bl-corner = 1;
  system.defaults.dock.wvous-br-corner = 1;
  system.defaults.dock.wvous-tl-corner = 1;
  system.defaults.dock.wvous-tr-corner = 1;
  system.defaults.dock.mru-spaces = false;
}
