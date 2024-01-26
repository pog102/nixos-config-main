{ inputs, config, lib, pkgs, ... }:
{

	imports = [
		inputs.nixvim.homeManagerModules.nixvim
# ../../pkgs/col2.nix
	];

	programs.nixvim = {
		enable = true;

		clipboard.providers.wl-copy = {
			enable = true;
			package = pkgs.wl-clipboard;
		};
		colorschemes.base16 = {
			enable = true;
			setUpBar = true;
			useTruecolor = true;
			customColorScheme = with config.colorScheme.colors; {
# base00 = "#${base00}";
				base00 = "";
				base01 ="#${base01}";
				base02 ="#${base02}";
				base03 ="#${base03}";
				base04 ="#${base04}";
				base05 ="#${base05}";
				base06 ="#${base06}";
				base07 ="#${base07}";
				base08 ="#${base08}";
				base09 ="#${base09}";
				base0A ="#${base0A}";
				base0B ="#${base0B}";
				base0C ="#${base0C}";
				base0D ="#${base0D}";
				base0E ="#${base0E}";
				base0F ="#${base0F}";

			};
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
			telescope.enable = true;
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
#  extraConfig = ''
#    set number relativenumber
#  '';
	};

#environment.variables.EDITOR = "nvim";

	home.sessionVariables = {
		EDITOR = "nvim";
	};
}
