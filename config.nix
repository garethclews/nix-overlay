{ 
  allowUnfree = true; 

  packageOverrides = super: let self = super.pkgs; in
  {
    rEnv = super.rWrapper.override {
      packages = with self.rPackages; [
        tidyverse
        DescTools
        styler
        rmarkdown
        knitr
      ];
    };
  };
}

