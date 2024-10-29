{ pkgs, configVars, ... }:
{
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = configVars.theme;
  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;
  system.defaults.NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;

  system.defaults.CustomUserPreferences = {
    "com.apple.assistant.backedup" = {
      "Output Voice" = {
        Custom = 1;
        Footprint = 2;
        Gender = 2;
        Language = "en-US";
        Name = "nora";
      };
    };

    "com.apple.Accessibility" = {
      AccessibilityEnabled = true;
      ApplicationAccessibilityEnabled = true;
      SpeakThisEnabled = true;
      SpokenContentDefaultVoiceSelectionsByLanguage = [
        "en"
        {
          "_type" = "Speech.VoiceSelection";
          "_version" = 0;
          voiceId = "com.apple.ttsbundle.gryphon-neural_Nora_en-US_premium";
        }
      ];
      "com.apple.speech.synthesis.general.prefs" = {
        SpokenUIUseSpeakingHotKeyFlag = 1;
      };

      "com.apple.universalaccess" = {
        speakSelectionEnabled = true;
        spokenContentPreferredVoiceForLanguage = {
          en = "com.apple.ttsbundle.gryphon-neural_Nora_en-US_premium";
        };
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth      optional      ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth      sufficient    pam_tid.so
  '';
}
