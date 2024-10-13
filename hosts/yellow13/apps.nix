{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    clop
    permute
    archiver
  ];

  homebrew = {
    casks = [
	  "arc"
	];
  };
}
