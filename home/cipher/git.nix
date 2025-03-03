{ ... }:
{
  programs.git = {
    includes = [
      {
        contents = {
          user.email = "hass.khalid@agilebits.com";
          "url \"ssh://git@ssh.gitlab.1password.io:2227\"" = {
            insteadOf = "https://gitlab.1password.io";
          };
        };
      }
    ];
    ignores = [
    ];
  };
}
