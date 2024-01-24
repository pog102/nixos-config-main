{ inputs, config, lib, pkgs, ... }:

{
 imports = [
	     inputs.nixvim.homeManagerModules.nixvim
];

programs.nixvim = {
  enable = true;
plugins = {
telescope.enable = true;
comment-nvim.enable = true;
lualine.enable = true;
notify.enable = true;
	lsp = {
		enable = true;
		servers = {

		rnix-lsp.enable = true;
		};

	};
nvim-cmp = {
enable = true;
autoEnableSources = true;
sources = [
{name = "nvim_lsp";}
{name = "path";}
{name = "buffer";}
];
mapping = {
"<C-Space>" = "cmp.mapping.complete()";
  "<C-d>" = "cmp.mapping.scroll_docs(-4)";
  "<C-e>" = "cmp.mapping.close()";
  "<C-f>" = "cmp.mapping.scroll_docs(4)";
  "<CR>" = "cmp.mapping.confirm({ select = true })";
  "<S-Tab>" = {
    action = "cmp.mapping.select_prev_item()";
    modes = [
      "i"
      "s"
    ];
  };
  "<Tab>" = {
    action = "cmp.mapping.select_next_item()";
    modes = [
      "i"
      "s"
    ];
  };

};
};
};
#  extraConfig = ''
#    set number relativenumber
#  '';
};

#environment.variables.EDITOR = "nvim";

#  home.sessionVariables = {
#EDITOR = "nvim";
#  };
}
