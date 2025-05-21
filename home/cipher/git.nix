{ ... }:
{
  programs.git.includes = [
    {
      contents.user.email = "hass.khalid@agilebits.com";
      contents."url \"ssh://git@site1.gitlab.1password.io:2227\"" = {
        insteadOf = [
          "https://gitlab.1password.io"
          "ssh://git@ssh.gitlab.1password.op:2227"
          "ssh://git@gitlab.1passowrd.io:2227"
        ];
      };
    }
  ];
}
