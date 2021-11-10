{ pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "krissemicolon";
    userEmail = "kris@krishuber.xyz";
    extraConfig = {
      credential.helper = "store";
    };
  };
}
