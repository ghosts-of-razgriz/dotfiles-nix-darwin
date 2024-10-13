{ configVars, ... }:
{
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = configVars.theme;
  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;
  system.defaults.NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;
  security.pam.enableSudoTouchIdAuth = true;
}
