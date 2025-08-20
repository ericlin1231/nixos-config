{ ... }:

{
  programs.git = {
    enable = true;
    userName = "tzuchilin";
    userEmail = "eric1231.tw@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
    };
  };
}
