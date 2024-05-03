{
  config,
  dream2nix,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.pip
  ];

  deps = {nixpkgs, ...}: {
    python = nixpkgs.python312;
  };

  name = "aws2-wrap";
  version = "1.4.0";

  buildPythonPackage = {
    pythonImportsCheck = [
      config.name
    ];
  };

  pip = {
    pypiSnapshotDate = "2023-12-10";
    requirementsList = ["${config.name}==${config.version}"];
  };
}
