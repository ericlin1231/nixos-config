{ pkgs, nixvim, ... }:

{
	home.username = "eric";
	home.homeDirectory = "/home/eric";
	home.stateVersion = "25.05";

	imports = [
		./modules/home/hyprland.nix
		./modules/home/waybar.nix
	];

	programs.alacritty = {
		enable = true;
		package = pkgs.alacritty;
		settings = {
			env.TERM = "xterm-256color";
			window = {
				padding = { x = 20; y = 20; };
				decorations = "None";
			};
			font = {
				normal.family = "JetBrainsMono Nerd Font";
				size = 16;
			};
		};
	};

	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
			command_timeout = 2000;
		};
	};

	programs.bash = {
		enable = true;
		initExtra = ''
			export PATH="$HOME/.local/bin:$PATH"
			eval "$(starship init bash)"
			cd ~/workspace
		'';
	};

	home.shellAliases = {
		v = "nvim";
		l = "ls -al";
		c = "clear";
		sv = "sudo -E nvim";
		nixup = "sudo nixos-rebuild switch --flake ~/workspace/.conf";
	};

	programs.git = {
		enable = true;
		userName = "tzuchilin";
		userEmail = "eric1231.tw@gmail.com";
		extraConfig = {
			init.defaultBranch = "main";
			commit.gpgsign = true;
		};
	};

	programs.direnv = {
		enable = true;
		silent = true;
		enableBashIntegration = true;
		nix-direnv.enable = true;
	};

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
			treesitter.enable = true;
			neo-tree.enable = true;
			web-devicons.enable = true;
		};
		extraPlugins = with pkgs.vimPlugins; [
			typst-vim
			barbar-nvim
			vim-commentary
		];
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
			expandtab = false;
		};
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
			{
				mode = "n";
				key = "<C-a>";
				action = ":BufferPrevious <CR>";
			}
			{
				mode = "n";
				key = "<C-s>";
				action = ":BufferNext <CR>";
			}
			{
				mode = "n";
				key = "<C-c>";
				action = ":BufferClose <CR>";
			}
		];
	};

	programs.home-manager.enable = true;
}

