{ lib, fetchFromGitHub, buildLinux, ... } @ args:

let
  version = "5.12.19";
  suffix = "zen2";
in

buildLinux (args // {
  modDirVersion = "${version}-${suffix}";
  inherit version;
  isZen = true;

  src = fetchFromGitHub {
    owner = "zen-kernel";
    repo = "zen-kernel";
    rev = "v${version}-${suffix}";
    sha256 = "sha256-l+KIlaXoq/Nzf7mUom9DUjaAsn7UxeKGL6MbYN7mBZk=";
  };

  extraMeta = {
    branch = "5.12/master";
    maintainers = with lib.maintainers; [ atemu andresilva ];
    description = "Built using the best configuration and kernel sources for desktop, multimedia, and gaming workloads.";
  };

} // (args.argsOverride or { }))
