# Neovim configuration for Java, Python, Rust and Lua

This is my personal LUA based configuration for Neovim that I use on a daily basis, which I shamelessly forked and used as a starting point for MY personal Neovim configuration, because I wanted to start with something with more meat on it than the standard [lazyvim starter configuration](https://github.com/LazyVim/starter). Doing so has been tremendously helpful for me, mainly because it's difficult to reproduce the quality and quantity of... for lack of a better term for it.. stuff! In this context, what I mean by "stuff" is all-encompassing, so it doesn't just refer to what has been added to the configuration, it also refers to everything that has been modified, and arguably even more importantly what is missing from the configuration I am using as a reference (in this case either my previous configuration or something like the aforementioned [LazyVim "starter" configuration](https://github.com/LazyVim/starter)). In my experience, this is the first time I've seen a vim/neovim developer provide a git repository with a working "vanilla" or "no-frills" configuration of their vim/neovim tool. Usually all you get is a set of installation instructions, or maybe a terminal command or a shell script that will do most of the installation process automatically, and that's always been more than good enough for my purposes. That being said, given how complex of a process it can be to go from vimscript to lua for your neovim configuration, especially if you had a lot of custom keybindings, customized settings, automated optimizations based on filetype, etc. providing a convenient baseline configuration in the form of a git repository might simply be an example of realizing you should go ahead and pick up the rocket launcher because there's an enemy tank ahead, and you can't do much damage to a tank with your aussult rifle or your fragmentation grenades. 

While it is true that this setup was once the product of continuous enhancements based in what the previous guy found in configurations shared by other users, it's also true that since I've gotten my hands on it, it's been subject to a process of experimentation, imitation, and trial and error. I tend to experiment until something breaks, at which point I begin the process of figuring out exactly what broke, why, and what I can do to resolve the problem. Thus, in the process of fixing what I broke, I tend to gain a deeper knowledge of what I'm tinkering with, and once I get it working, the cycle begins again and I continue experimenting, pushing my luck to another inevitable point where something else must break. It is an ongoing project that may evolve with time as I come accross with new plugins, refine mappings or refactor configuration files.<br>Feel free to fork this repository and adapt it to your own needs.

<br>
e
*Autocompletion*
![lsp autocompletion](./screenshots/nvim_lsp_cmp.png?raw=true)

*Compilation errors*
![lsp autocompletion](./screenshots/nvim_lsp_errors.png?raw=true)

*Debug*
![lsp autocompletion](./screenshots/nvim_dap.png?raw=true)

*Launching Java application*
![lsp autocompletion](./screenshots/nvim_java_launch.png?raw=true)

*Telescope fuzzy finder*
![telecope usage](./screenshots/nvim_telescope.png?raw=true)

# Installation
## Manual Setup
0. Install latest [NeoVIM version](https://github.com/neovim/neovim/wiki/Installing-Neovim). 
1. Clone this repository into `~/.config/nvim`:
    ```
    git clone https://github.com/magidc/nvim-config.git ~/.config/nvim
    ```
2. Install [ripgrep](https://github.com/BurntSushi/ripgrep) into your OS. It is required by some [Telescope](https://github.com/nvim-telescope/telescope.nvim) plugin searching modes.

3. This environment is preconfigured with Language Server Providers (LSP) and Debug Adapters  (DAP) for Java, Python, Rust and Lua. These components provide IDE features like autocompletions, error highlight or debugging. As it is required to have installed these components in your system, this Neovim setup relies on [mason.nvim](https://github.com/williamboman/mason.nvim#installation) plugin to install them automatically if they are missing.

<br>

# UI theme
Several UI themes are preconfigured in this setup. Active theme is set by editing file `lua/settings.lua`.
Default active theme is [Tokyonight](https://github.com/folke/tokyonight.nvim).
I have added several new possible choices for themes to the theme file: ("$HOME"/.config/nvim/lua/theme.lua).
The theme I have set as active at the moment is "nightfox".
### Additional Themes
    * [NightFox](https://github.com/EdenEast/nightfox.nvim)
    * [Monochrome](https://github.com/kdheepak/monochrome.nvim)
    * [Rasmus](https://github.com/kvrohit/rasmus.nvim)
    * [Github-Nvim-Theme](https://github.com/projekt0n/github-nvim-theme)
    * [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim)


<br>


# Custom mappings
Most of mappings are defined in file `lua/mappings.lua`. WhichKey plugin is used in order to provide a description for each one of them.
Other mappings can be found in specific plugin configuration files in `lua/plugins/configs` directory. Also, language specific mappings are defined in LSP config files, these mappings are only available when working with specific programming languages (when LSP are attached)

<br>

# Equivalent mapping configurations for other IDEs VIM integrations
I have created configuration files with (almost) equivalent mappings for [Eclipse IDE vim plugin (vrapper)](https://github.com/magidc/dotfiles/blob/master/.vrapperrc), [IntelliJ vim plugin (ideaVim)](https://github.com/magidc/dotfiles/blob/master/jetbrains/.ideavimrc) and [VSCode vim plugin (vscodevim)](https://github.com/magidc/dotfiles/blob/master/vscode/keybindings.json).
These configurations will allow users who are used to these key combinations to remain confortable and efficient while working with other IDEs.

<br>

# Featured plugins
* [Telescope](https://github.com/nvim-telescope/telescope.nvim)
    > Highly extendable fuzzy finder over lists
* [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)
    > Tree file explorer 
* [Aerial](https://github.com/stevearc/aerial.nvim)
    > Code outline window for skimming and quick navigation
* [WhichKey](https://github.com/folke/which-key.nvim)
    > Displays a popup with possible key bindings of the command you started typing
* [Nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
    > Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls
* [Nvim-dap](https://github.com/mfussenegger/nvim-dap)
    > Debug Adapter Protocol client implementation for Neovim
* Others...

<br>

# Troubleshooting
If you have problems while installing or using this setup, please report an issue, 

<br>

# Feedback and suggestions
I would appreciate suggestions and feedback regarding this Neovim configuration. As it is an ongoing project I will be changing over the time to become more useful and easy to use. Please do not hesitate to contact me if you have any comments

