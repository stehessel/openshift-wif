{pkgs, ...}: {
  name = "openshift-wif";

  containers.shell.defaultCopyArgs = [
    "--dest-daemon-host=unix:///Users/stephan/.colima/default/docker.sock"
  ];

  devcontainer.enable = false;

  dotenv.enable = true;

  packages = [
    pkgs.gettext
    pkgs.kubernetes-helm
    pkgs.git
    pkgs.go-task
    pkgs.openshift
  ];

  pre-commit.hooks = {
    actionlint.enable = true;
    alejandra.enable = true;
    yamllint.enable = true;
  };
}
