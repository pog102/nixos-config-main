{ inputs, config, lib, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    # ./plug.nix
  ];
  options = { nvim.enable = lib.mkEnableOption "enable hyprland"; };
  config = lib.mkIf config.nvim.enable {
    programs.nixvim = {
      enable = true;
      # autoGroups = {};
      autoCmd = [

        # {
        #   event = [ "BufWinLeave" ];
        #   pattern = [ "*" ];
        #   callback = { __raw = "mkview"; };
        # }
        # {
        #   event = [ "BufWinEnter" ];
        #   pattern = [ "*" ];
        #   callback = { __raw = "silent! loadview"; };
        # }
        {
          event = [ "BufWritePre" ];
          pattern = [ "*" ];
          callback = { __raw = "function(args) require('conform').format({ bufnr = args.buf }) end"; };
        }
        {
          event = [ "bufnewfile" ];
          pattern = [ "*.nix" ];
          command = "0r ~/.config/nvim/templates/skel.nix";
        }
        {
          event = [ "bufnewfile" ];
          pattern = [ "*.sh" ];
          command = "0r ~/.config/nvim/templates/skeleton.sh";
        }
      ];

      keymaps = [

        # { 
        #     action = "!xdg-open <cfile><CR>";
        #     key = "gx";
        # mode = "n";
        #     options = {
        #       silent = true;
        #     };
        #   }

        # {
        #   action = ":lua require'sniprun'.run('v')";
        #   key = "r";
        #   mode = "n";
        #   options = {
        #     silent = true;
        #   };
        # }
        # {
        #   action = ":IncRename ";
        #   key = "q";
        #   mode = "n";
        #   options = {
        #     # silent = true;
        #   };
        # }
        {
          action = "<cmd>lua require('luasnip').jump(1)<CR>";
          key = "<C-L>";
          mode = "i";
          options = {
            silent = true;
          };
        }
        {
          action = "/";
          key = "<C-f>";
          mode = "n";
          options = {
            silent = false;
          };
        }
        {
          action = "function() require('dap').toggle_breakpoint()";
          key = "<F1>";
          mode = "n";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>Neotree toggle<CR>";
          key = "q";
          mode = "n";
          options = {
            silent = true;
          };
        }
        {
          action = "function() require('dap').continue()";
          key = "<F5>";
          mode = "n";
          options = {
            silent = true;
          };
        }
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
      extraPlugins = with pkgs.vimPlugins; [
        # gkeep-nvim
        # headlines-nvim
        # lf-vim
      ];

      clipboard.providers.wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
      };

      plugins = {
        neo-tree = {
          enable = true;

          # useDefaultMappings = { __raw = "[\"ee\"] = \"close_window\""; };
          # useDefaultMappings = false;
          # useDefaultMappings = ''lua
          #   	 ["ee"] = "close_window"
          #   	 '';
          # callback = { __raw = "function(args) require('conform').format({ bufnr = args.buf }) end"; };

        };
        nvim-ufo = {
          foldVirtTextHandler = "V";
          enable = true;

        };
        headlines = {
          enable = false;
          settings = {
            markdown = {
              headline_highlights = [
                "Headline1"
              ];
            };

          };
        };
        toggleterm = {
          enable = true;
          settings = {
            # direction = "float";
            # float_opts = {
            #   border = "curved";
            #   height = 30;
            #   width = 130;
            # };
            # open_mapping = "[[<c-/]]";
            open_mapping = "[[<c-\\>]]";
          };
        };
        sniprun = {
          enable = true;
          display = [
            # "Classic"                    # display results in the command-line  area
            "VirtualTextOk" # display ok results as virtual text (multiline is shortened)

            # "VirtualText"              # display results as virtual text
            "TempFloatingWindow" # display results in a floating window
            # "LongTempFloatingWindow"   # same as above, but only long results. To use with VirtualText[Ok/Err]
            # "Terminal"                 # display results in a vertical split
            # "TerminalWithCode"         # display results and code history in a vertical split
            # "NvimNotify"               # display with the nvim-notify plugin
            # "Api"                      # return output to a programming interface
          ];
        };
        markdown-preview = {
          enable = false;
          # browser = "firefox";
        };
        inc-rename = {
          # enable = true;
          # inputBufferType = "dressing";
        };
        dap = {
          enable = false;

          #       configurations ={ 
          #       typescript = 
          #       {
          #
          #        name = "Debug with Firefox";
          # type = "firefox";
          # request = "launch";
          # # reAttach = true;
          # # url = "http://localhost:3000";
          # # webRoot = '${workspaceFolder}',
          # # firefoxExecutable = "/usr/bin/firefox";
          #       };
          #       };


          # };
          adapters.executables.firefox = {
            command = "node";

            args = [ "{os.getenv('HOME') .. '/path/to/vscode-firefox-debug/dist/adapter.bundle.js'}" ];


          };
          # 		      adapters.firefox = {
          #   type = "executable";
          #   command = "node";
          #   args ="{os.getenv('HOME') .. '/path/to/vscode-firefox-debug/dist/adapter.bundle.js'}";
          # };
          extensions = {
            dap-virtual-text.enable = false;
            dap-ui.enable = false;
          };
        };
        noice.enable = true;
        gitsigns.enable = true;
        lint = {
          enable = true;
          lintersByFt = {
            nix = [ "nix" ];
            bash = [ "shellcheck" ];


          };
        };
        vimtex.enable = false;
        luasnip = {
          enable = true;
          extraConfig = { };
          fromLua = [

            {
              paths = "/home/chad/.config/nvim/snippets";
            }

          ];
        };
        # fugitive.enable = true;
        # auto-save.enable = true;
        # nix.enable = true;
        # auto-session.enable = true;
        surround.enable = true;
        # todo-comments = {
        # enable=true;
        # colors={
        #   error = [ "DiagnosticError" "ErrorMsg" "#DC2626" ];
        #   warning = [ "DiagnosticWarn" "WarningMsg" "#FBBF24" ];
        #   info = [ "DiagnosticInfo" "#2563EB" ];
        #   hint = [ "DiagnosticHint" "#10B981" ];
        #   default = [ "Identifier" "#7C3AED" ];
        #   test = [ "Identifier" "#FF00FF" ];
        # };
        #
        # };
        dashboard = {
          enable = false;
          header = [
            ""
            "⡿⠋⠄⣀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣌⠻⣿⣿"
            "⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹"
            "⣿⣿⡟⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢿⣿⣿⣿⣮⠛⣿⣿⣿⣿⣿⣿⡆"
            "⡟⢻⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣣⠄⡀⢬⣭⣻⣷⡌⢿⣿⣿⣿⣿⣿"
            "⠃⣸⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⣆⢹⣿⣿⣿⡈⢿⣿⣿⣿⣿"
            "⠄⢻⡇⠄⢛⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⡆⠹⣿⣆⠸⣆⠙⠛⠛⠃⠘⣿⣿⣿⣿"
            "⠄⠸⣡⠄⡈⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠁⣠⣉⣤⣴⣿⣿⠿⠿⠿⡇⢸⣿⣿⣿"
            "⠄⡄⢿⣆⠰⡘⢿⣿⠿⢛⣉⣥⣴⣶⣿⣿⣿⣿⣻⠟⣉⣤⣶⣶⣾⣿⡄⣿⡿⢸"
            "⠄⢰⠸⣿⠄⢳⣠⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣿⣿⣿⣿⣿⡇⢻⡇⢸"
            "⢷⡈⢣⣡⣶⠿⠟⠛⠓⣚⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⠇⠘"
            "⡀⣌⠄⠻⣧⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⢿⣿⣿⣿⣿⣿⡟⠘⠄⠄"
            "⣷⡘⣷⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡋⢀⣠⣤⣶⣶⣾⡆⣿⣿⣿⠟⠁⠄⠄⠄⠄"
            "⣿⣷⡘⣿⡀⢻⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⣿⣿⣿⣷⡿⠟⠉⠄⠄⠄⠄⡄⢀"
            "⣿⣿⣷⡈⢷⡀⠙⠛⠻⠿⠿⠿⠿⠿⠷⠾⠿⠟⣛⣋⣥⣶⣄⠄⢀⣄⠹⣦⢹⣿"
            ""
          ];
          center = [
            {
              icon = "  ";
              desc = "Find File                               ";
              action = "Telescope find_files find_command=rg,--hidden,--files";
              shortcut = "SPC f f";
            }
            {
              icon = "  ";
              desc = "Recently opened                         ";
              action = "Telescope oldfiles";
              shortcut = "SPC f r";
            }
            {
              icon = "פּ  ";
              desc = "File browser                            ";
              action = "NvimTreeToggle";
              shortcut = "SPC f o";
            }
            {
              icon = "  ";
              desc = "Search for word                         ";
              action = "Telescope live_grep";
              shortcut = "SPC f g";
            }
            {
              icon = "  ";
              desc = "Help                                    ";
              action = "Telescope help_tags";
              shortcut = "SPC f h";
            }
            {
              icon = "  ";
              desc = "Commands                                ";
              action = "Telescope commands";
              shortcut = "SPC ?  ";
            }
          ];
        };
        mkdnflow = {

          enable = true;
          links.conceal = true;
          toDo.symbols = [ " " "⧖" "✓" ];
          # toDo.symbols = [ " " "X" ];
          # toDo.complete = "X";
          # toDo.notStarted = " ";
          # toDo.inProgress = "X";
        };
        # cmp-git.enable = true;
        fugitive.enable = true;
        #
        # lsp-format.enable = true;
        conform-nvim = {
          enable = true;
          formattersByFt =
            {
              nix = [ "nixpkgs_fmt" ];
              bash = [ "shellcheck" ];
              sh = [ "shellcheck" ];
              c = [ "clang-format" ];
              javascript = [ "prettier" "prettierd" ];
              # Conform will run multiple formatters sequentially
              # Use a sub-list to run only the first available formatter
              # Use the "*" filetype to run formatters on all filetypes.
              "*" = [ "codespell" ];
              # Use the "_" filetype to run formatters on filetypes that don't
              # have other formatters configured.
              "_" = [ "trim_whitespace" ];
            };
          #      extraOptions = { ''
          # vim.api.nvim_create_autocmd("BufWritePre", {
          #   pattern = "*",
          #   callback = function(args)
          #     require("conform").format({ bufnr = args.buf })
          #   end,
          # })
          # ''
          # };
        };
        lspkind.enable = true;
        lspsaga = {
          enable = false;
          ui = {
            # 	kind = {
            # # error_sign = "ss";
            #
            #
            # 	};
            lines = [ "┗" "┣" "┃" "━" "┏" ];
            devicon = true;
            impSign = "󰳛";
          };

        };
        # gitblame.enable = true;
        bufferline = {
          enable = true;
          diagnostics = true;
          # separatorStyle = "padded_slant";
          hover.enabled = true;
          highlights.indicatorSelected.underline = true;
          alwaysShowBufferline = false;
        };
        indent-blankline.enable = true;
        nvim-colorizer.enable = true;
        treesitter = {
          enable = true;
          nixvimInjections = true;
        };
        # surround.enable = true;
        nvim-autopairs.enable = true;
        telescope = {
          enable = true;


          # keymaps = {
          # };
        };
        comment.enable = true;
        lualine = {
          enable = true;
          disabledFiletypes = {
            statusline = [ "dashboard" "alpha" ];
          };
          sectionSeparators.left = "";
          sectionSeparators.right = "";
          componentSeparators.left = "";
          componentSeparators.right = "";
          # inactiveSections = {
          #   lualine_b = [
          #     {
          #       name = "filename";
          #     }
          #   ];
          # };
          sections = {
            lualine_a = [
              {

                name = "mode";
                extraConfig = {
                  icon = "";
                };
              }
            ];
            lualine_b = [
              {
                name = "branch";
                extraConfig = {
                  icon = "";
                };
              }
              {
                name = "diff";
                extraConfig = {
                  colored = true;

                  diff_color = {
                    added = {
                      fg = "#98be65";
                    };
                    modified = {

                      fg = "#ECBE7B";
                    };
                    removed = {

                      fg = "#ec5f67";
                    };
                    # added = "LuaLineDiffAdd";
                    # modified = "LuaLineDiffChange";
                    # removed = "LuaLineDiffDelete";
                  };

                  symbols = {
                    added = " ";
                    modified = "󰏬 ";
                    removed = " ";
                  };
                };
              }
              {
                # file_status = true;
                extraConfig = {
                  symbols = {
                    # modified = " ";
                    modified = "";
                    readonly = "";
                    unnamed = "󰡯";
                    newfile = "";
                  };
                };
                # icon = get_icon()
                icons_enabled = true;
                name = "filename";
              }
            ];

            lualine_c = [
              {
                name = "diagnostics";
                extraConfig = {
                  sources = [
                    "nvim_diagnostic"
                    "nvim_lsp"
                  ];
                  # diagnostics_color = {
                  #   error = "DiagnosticError";
                  #   warn = "DiagnosticWarn";
                  #   info = "DiagnosticInfo";
                  #   hint = "DiagnosticHint";
                  #   # fg = "#b4befe";
                  #   bg = "grey";
                  # };
                  # colored = false;
                  symbols = {
                    error = " ";
                    warn = " ";
                    info = " ";
                    hint = "󰝶 ";
                  };
                };
                color = {
                  #   fg =
                  #     # if config.colorschemes.base16.enable
                  #     # then colors.base08
                  #     # else "none";
                  # bg = "ctermbg";
                  # bg = "grey";
                  #     # if config.colorschemes.base16.enable
                  #     # then colors.base00
                  #     # else "none";
                };
              }
            ];



            lualine_x = [
              {
                name = "fileformat";
                extraConfig = {
                  symbols = {
                    unix = "";
                    dos = "";
                    mac = "";
                  };
                };

              }
            ];
            lualine_y = [
              { }
            ];
            lualine_z = [
              {
                name = "location";
              }
            ];
          };
          inactiveSections = {
            lualine_a = [

            ];

            lualine_y = [
            ];
            lualine_z = [
              {
                # separator.right = "";
                # padding.left=2;
              }
            ];
          };
          # 	sections.lualine_a.mode = {
          # separator.left =  "";
          #
          # padding.right = 2;
          # 	};



          # lualine_b = { 'filename', 'branch' };
          #     lualine_c = { 'fileformat' };
          #     lualine_x = {};
          #     lualine_y = { 'filetype', 'progress' },
          #     lualine_z = {
          #       { 'location', separator = { right = '' }, left_padding = 2 },
          #    };


        };
        transparent.enable = false;
        notify = {
          enable = true;
          backgroundColour = "#000000";
        };
        # 			trouble = {
        # 				enable = true;
        # 				signs={
        # error="er";
        # information="in";
        # hint="hn";
        # warning="wa";
        #
        #
        #
        # 				};
        # 				};
        lsp = {
          enable = true;
          servers = {
            # tailwindcss.enable = true;
            tsserver.enable = true;
            clangd.enable = true;
            nixd.enable = true;
            html.enable = true;
            bashls.enable = true;

            cssls = {
              enable = true;
            };
            lua-ls = {
              enable = true;
              # settings.hint.enable = true;
            };
          };

        };
        cmp_luasnip.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp = {
          # snippet.expand = "luasnip";

          enable = true;
          autoEnableSources = true;
          settings = {
            sources = [
              { name = "nvim_lsp"; }
              { name = "luasnip"; } #For luasnip users.
              { name = "path"; }
              { name = "buffer"; }
            ];
            window = {
              completion = {
                # winhighlight =
                #   # "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
                #   "FloatBorder:CmpBorder,Normal:CmpBorder";
                # winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None";
                scrollbar = false;
                sidePadding = 0;
                border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
              };

              documentation = {
                border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
                # winhighlight =
                #   "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
                # "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
              };
            };
            #
          };
          settings = {
            mapping = {
              "<C-Space>" = "cmp.mapping.complete()";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-e>" = "cmp.mapping.close()";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              # "<S-Tab>" = {
              #   action = "cmp.mapping.select_prev_item()";
              #   modes = [
              #     "i"
              #     "s"
              #   ];
              # };
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";


            };
          };
        };
      };
      opts = {
        # options = {
        incsearch = true; # Select items found in search
        hlsearch = true; # Highlight searches by default
        ignorecase = true; # Ignore case when searching
        smartcase = true; # Unless you type a capital
        number = true;
        relativenumber = false;
        showmode = false;
        # nofoldenable = false;
        undofile = true;
        breakindent = true; # Keep indentation for wrapped lines
        autoindent = true; # Enable auto-indentation
        smartindent = true; # Enable smart-indentation
        softtabstop = 0; # Use hard tabs alwaysShowBufferline
        swapfile = false; # Enable swap files
        clipboard = "unnamedplus";
        foldmethod = "expr";
        foldexpr = "nvim_treesitter#foldexpr()";
        foldlevel = 20;
        # foldenable = false;
        fillchars = {
          eob = " ";
        };


      };
      # enableMan = true;
      extraConfigLua = ''
        local signs = { Error = "", Warn = "", Hint = "", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
      '';
      extraConfigVim = ''

		      au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif

                      '';
    };

    #environment.variables.EDITOR = "nvim";

    # home.file.".config/nvim/queries" = {
    #   recursive = true;
    #   source = ./queries;
    # };
    home.file.".config/nvim/lua" = {
      recursive = true;
      source = ./lua;
    };
    home.file.".config/nvim/snippets" = {
      recursive = true;
      source = ./snippets;
    };
    home.file.".config/nvim/templates" = {
      recursive = true;
      source = ./templates;
    };
    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
