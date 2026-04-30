#   █████   █████ █████ ██████   ██████ ███████████   █████ ██████████   █████   █████████   ██████   █████
#  ▒▒███   ▒▒███ ▒▒███ ▒▒██████ ██████ ▒▒███▒▒▒▒▒███ ▒▒███ ▒▒███▒▒▒▒███ ▒▒███   ███▒▒▒▒▒███ ▒▒██████ ▒▒███
#   ▒███    ▒███  ▒███  ▒███▒█████▒███  ▒███    ▒███  ▒███  ▒███   ▒▒███ ▒███  ▒███    ▒███  ▒███▒███ ▒███
#   ▒███    ▒███  ▒███  ▒███▒▒███ ▒███  ▒██████████   ▒███  ▒███    ▒███ ▒███  ▒███████████  ▒███▒▒███▒███
#   ▒▒███   ███   ▒███  ▒███ ▒▒▒  ▒███  ▒███▒▒▒▒▒███  ▒███  ▒███    ▒███ ▒███  ▒███▒▒▒▒▒███  ▒███ ▒▒██████
#    ▒▒▒█████▒    ▒███  ▒███      ▒███  ▒███    ▒███  ▒███  ▒███    ███  ▒███  ▒███    ▒███  ▒███  ▒▒█████
#      ▒▒███      █████ █████     █████ █████   █████ █████ ██████████   █████ █████   █████ █████  ▒▒█████
#       ▒▒▒      ▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒ ▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒    ▒▒▒▒▒

# Vimridian is my Neovim configuration created from the ground up using Gerg-L's
# minimal neovim wrapper (mnw) for Nix, and the lz.n lazy loading library

# Vimridian is named after the Between the Buried and Me song, Viridian
# It is a beautiful song with a bass solo and is the precursor to one of the
# greatest songs of all time (imo), White Walls

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

    # Uses minimal neovim wrapper, an alternative to the yucky Nixpkgs neovim wrapper.
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs =
    {
      nixpkgs,
      mnw,
      self,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = pkgs.lib;
    in
    {
      packages.${system} =
        let
          #
          # ========= Minimal =========
          #
          minimalConfig = {
            # Unwrapped Neovim package from nixpkgs
            neovim = pkgs.neovim-unwrapped;

            appName = "nvim";
            aliases = [
              "vim"
              "vi"
              "v"
            ];

            # TODO: Separate init.lua files for minimal vs maximal
            # Maximal would likely include entire config, but minimal needs to pick and choose certain pieces
            initLua = builtins.readFile ./init.lua;

            extraBinPath = with pkgs; [
              # fzf-lua dependencies
              fzf # WHAT!!!
              fd # better find utility
              ripgrep # better grep utility
              bat # better syntax highlighting in native previewer
              delta # better syntax highlighting for git
            ];

            # Plugins loaded on startup should be here
            plugins = with pkgs.vimPlugins; {
              start = [
                # Lazy-loading library, an alternative to lazy.nvim
                lz-n

                # icons dependency for lualine, telescope and others
                mini-icons

                # install ALL THE GRAMMARS!!!
                # we dont actually need nvim-treesitter bc we are doing this
                # and the built-in vim.treesitter will handle it
                # it has to be done with the ++ operator idrk why
              ]
              ++ nvim-treesitter.withAllGrammars.dependencies;

              # Anything that you're loading lazily should be put here
              opt = [
                # Colorscheme
                catppuccin-nvim

                # Statusline
                lualine-nvim

                # Fuzzy finder
                # (Chosen for having a noticable speed increase over telescope)
                fzf-lua

                # Surround editing
                mini-surround

                # Autopairs
                mini-pairs

                # Which Key helps identify shortcuts
                which-key-nvim

                # Git integration for buffers
                gitsigns-nvim

                # File explorer
                oil-nvim
              ];

              dev.myConfig = {
                # you can use lib.fileset to reduce rebuilds here
                # https://noogle.dev/f/lib/fileset/toSource
                pure = ./.;
                impure = "~/proj/vimridian";
              };
            };
          };

          #
          # ========= Maximal =========
          #
          # recursiveUpdate function merges nested attribute sets
          maximalConfig = lib.recursiveUpdate minimalConfig {
            # Use maximal init.lua
            initLua = builtins.readFile ./init.lua;

            extraBinPath =
              minimalConfig.extraBinPath
              ++ (with pkgs; [
                stylua # Lua formatter
                nixfmt # Nix formatter
              ]);

            plugins.opt =
              minimalConfig.plugins.opt
              ++ (with pkgs.vimPlugins; [
                # Formatting
                conform-nvim

                # Mega advanced search and replace
                grug-far-nvim
              ]);
          };
        in
        rec {
          # actual package outputs are here
          minimal.default = mnw.lib.wrap pkgs minimalConfig;
          minimal.dev = minimal.default.devMode;

          maximal.default = mnw.lib.wrap pkgs maximalConfig;
          maximal.dev = maximal.default.devMode;

          default = minimal.default;
        };
    };
}
