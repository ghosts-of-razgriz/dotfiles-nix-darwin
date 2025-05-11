{ configVars, ... }:
{
  users.users."${configVars.username}" = {
    name = configVars.username;
    home = "/Users/${configVars.username}";
  };
}
