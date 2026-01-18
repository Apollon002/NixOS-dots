{ lib, ... }:
{
  options.systemSettings.greeter = lib.mkOption {
    description = "Display-Manager to use";
    type = lib.types.enum [ "ly" ];
    default = "ly";
    example = "ly";
  };

  imports = [
    ./ly
  ];
}
