{ ... }:
{
  programs.git.includes = [
    {
      contents = {
        user.email = "hass.khalid@agilebits.com";
        ignores = [
          ".envrc"
          ".devenv*"
          ".direnv"
          ".pre-commit-config.yaml"
          "devenv.nix"
          "devenv.local.nix"
          "devenv.lock"
          "devenv.yaml"
        ];
      };
    }
  ];
}
