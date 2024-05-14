# My config for nixos
usage:
`./in.sh`
```
flake.nix
│   
└───/hosts/chad/configuration.nix
    |
    └─── ../../nixosModules/default.nix
    |   └─── ... 
    |   
    └───/hardware-configuration.nix
    |   
    └───/home.nix
        | ../../homeManagerModules/default.nix
          |
          └───btop.nix
          |
          └───wlsusnset.nix
          |
          └─── ...
