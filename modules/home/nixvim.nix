{ nixvim, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes = {
      tokyonight = {
        enable = true;
        settings.style = "night";
      };
    };
    plugins = {
      lualine.enable = true;
      neo-tree = {
        enable = true;
        filesystem = {
          filteredItems = {
            alwaysShow = [
              ".gitignore"
              ".env"
            ];
          };
        };
      };
      web-devicons.enable = true;
      barbar = {
        enable = true;
        keymaps = {
          close.key = "<C-c>";
          next.key = "<C-s>";
          previous.key = "<C-a>";
        };
      };
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [
            "c"
            "cpp"
            "zig"
            "rust"
            "python"
            "verilog"
            "nix"
            "bash"
            "typst"
            "markdown_inline"
            "json"
            "yaml"
            "typescript"
            "css"
            "scss"
          ];
          highlight.enable = true;
        };
      };
      comment.enable = true;
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            typescript = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            python = [
              "isort"
              "black"
            ];
            json = [ "prettierd" ];
            rust = [ "rustfmt" ];
            systemverilog = [ "verible" ];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
        };
      };
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          live-grep-args.enable = true;
        };
        keymaps = {
          "<Leader>ff" = "find_files";
          "<Leader>fg" = "live_grep";
        };
      };
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    opts = {
      mouse = "a";
      showmode = false;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      swapfile = false;
      scrolloff = 5;
      textwidth = 80;

      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      expandtab = true;
    };
    autoCmd = [
      {
        event = "BufWritePre";
        callback = {
          __raw = "function(args) require('conform').format({ bufnr = args.buf }) end\n";
        };
      }
      {
        event = "FileType";
        pattern = [
          "nix"
          "typescriptreact"
          "verilog"
          "systemverilog"
        ];
        command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2";
      }
    ];
    keymaps = [
      {
        mode = "n";
        key = "<Space>u";
        action = "<C-r>";
      }
      {
        mode = "n";
        key = "<Leader>e";
        action = ":Neotree <CR>";
      }
      {
        mode = "n";
        key = "<Leader>r";
        action = ":Neotree toggle last <CR>";
      }
    ];
  };
}
