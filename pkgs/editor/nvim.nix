{ userSettings, inputs, config, lib, pkgs, ... }:
{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
# ../../pkgs/col2.nix
        ];

        programs.nixvim = {
          enable = true;
	  keymaps = [
{
    action = "<cmd>bdelete<CR>";
    key = "d<Tab>";
mode = "n";
    options = {
      silent = true;
    };
  }
{
    action = "<cmd>bnext<CR>";
    key = "<Tab>";
mode = "n";
    options = {
      silent = true;
    };
  }

{
    action = "<cmd>Telescope find_files<CR>";
    key = "ff";
mode = "n";
    options = {
      silent = true;
    };
  }
{
    action = "<cmd>Telescope live_grep<CR>";
    key = "fg";
mode = "n";
    options = {
      silent = true;
    };
  }
	  {
    action = "<cmd>Telescope oldfiles<CR>";
    key = "fd";
mode = "n";
    options = {
      silent = true;
    };
  }
];

          clipboard.providers.wl-copy = {
            enable = true;
            package = pkgs.wl-clipboard;
          };

          colorschemes.base16 = {
            # enable = if userSettings.theme == "wal" then false else true;
            enable =true;
            setUpBar = true;
            useTruecolor = true;
                      };
                      plugins = {
                        gitsigns.enable = true;
                        lint.enable = true;
                        luasnip.enable = true;
                # fugitive.enable = true;
                # auto-save.enable = true;

                # nix.enable = true;
                auto-session.enable = true;
                surround.enable = true;
                gitblame.enable = true;
                indent-blankline.enable = true;
                nvim-colorizer.enable =true;
                treesitter.enable = true;
                        # surround.enable = true;
                        nvim-autopairs.enable = true;
                        telescope = {
			enable = true;


			# keymaps = {
			# };
			};
                        comment-nvim.enable = true;
                        lualine.enable = true;
                        notify.enable = true;
                        lsp = {
                          enable = true;
                          servers = {

                            rnix-lsp.enable = true;
                            bashls.enable = true;

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
                      extraConfigVim = ''
                      set number
		      set clipboard=unnamedplus
                      '';
                    };

#environment.variables.EDITOR = "nvim";

home.sessionVariables = {
  EDITOR = "nvim";
};
}
