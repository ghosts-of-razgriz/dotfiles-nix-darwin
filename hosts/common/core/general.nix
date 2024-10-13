{ pkgs, configVars, ... }:
{
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = configVars.theme;
  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;
  system.defaults.NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;

  security.pam.enableSudoTouchIdAuth = true;
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
	auth      optional      ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
	auth      sufficient    pam_tid.so
  '';
}
