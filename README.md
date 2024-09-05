# opensuse-hyprland-dotfiles
My hyprland dotfiles in case somebody needs
# Before getting started 
## What is it?
This is a repository containing my dotfiles for OpenSUSE Tumbleweed Hyprland setup. Note this has not been created for "check out my rice" purposes. Only practical things.

## No Waybars and shit
I do not use bars. This is just "minimal" setup (although the dependencies section may terrify you). All data I can monitor with `btop` utility.

## For those who would not mind a little bloatware
If snaps and flatpaks bother you, dont install them then, but i want to. So this repo contains flatpak, snap, brew, cargo configuration

## Which Hyprland plugins?
I Used `hy3` and `hyprexpo` plugins. The first will make hyprland behave like i3wm, the second will provide you a gnome/kde-like swiping up to see all your workspaces. **Note** that you will have to install lots of `devel` packages from Opensuse repos before being able to build `hy3` plugin. You should know that Opensuse splits its packages.  but we will talk about it later below.

# Dependencies

First, let's follow the official guide of hyprland dependencies (the ones for hyprland are needed for hypr plugins actually and they are the same) and install those dependencies:
```bash
zypper in gcc-c++ git meson cmake "pkgconfig(cairo)" "pkgconfig(egl)" "pkgconfig(gbm)" "pkgconfig(gl)" "pkgconfig(glesv2)" "pkgconfig(libdrm)" "pkgconfig(libinput)" "pkgconfig(libseat)" "pkgconfig(libudev)" "pkgconfig(pango)" "pkgconfig(pangocairo)" "pkgconfig(pixman-1)" "pkgconfig(vulkan)" "pkgconfig(wayland-client)" "pkgconfig(wayland-protocols)" "pkgconfig(wayland-scanner)" "pkgconfig(wayland-server)" "pkgconfig(xcb)" "pkgconfig(xcb-icccm)" "pkgconfig(xcb-renderutil)" "pkgconfig(xkbcommon)" "pkgconfig(xwayland)" "pkgconfig(xcb-errors)" glslang-devel Mesa-libGLESv3-devel tomlplusplus-devel
```
Then, install these:
Go to yast2 and search for `hypr`. Install ALL packages containing `hypr`, but not containing `hypre`
- `fish`
- `npm`
- `neovim`
- `hyprlang-devel`
- `cmus`
- `kitty`
- `dunst`
- `git-core`
- `qt6ct`
- `ranger`
- `pattern devel-basis`
- `pattern devel-c++`
- `some small libs needed to build hyprland plugin`, i feel lazy to list them here, but you will know during the compilation what else system needs
- `xdg-desktop-portal-gtk`
- `xdg-desktop-portal-hyprland`
- `btop`
- `rust` - optional for my bloatware
- `cmake`
- `clang`
- `brightnessctl`
- `wofi`
- `tofi`
- `gojq`
- you shall need nerd fonts too. I used Roboto Mono

# Installation

## Prerequisites
1. Visit [Opensuse download section](https://get.opensuse.org/tumbleweed/) and download offline iso for amd64 arch.
2. Obtain your favorite USB image flasher. I use [Popsicle](https://flathub.org/apps/com.system76.Popsicle) btw. You can use this Flatpak safely or build yourself from source. You will need Rust compiler in your system though.
3. Plug your flash drive with the system in and proceed to your installation. Configure everything as you wish, but then, when Yast asks you what GUI DE you prefer, choose minimal desktop, with custom window managers setup.
4. Reboot after installation and then open Yast and take all Hyprland packages in. Then install `sddm` and reboot. You are able to login to Hyprland now.

## Hyprland tweaking

1. Visit [Hyprland plugins](https://hyprland.org/plugins/) and read the docs. You will need `hy3` and `hyprexpo`
2. When you try to install the plugins with the `hyprpm add <plugin>`, you will face compilation errors. Some lib missing or something. To see which lib is missing, you gotta input `hyprpm update -f -v`. This command will try to do several things: Download plugin repos again, compile them. During compilation process see for "build failed" and see what *.h or *.so, or *.cpp file is missing. You will have to have a lot of patience to google for a package that provide this lib. But do not worry, mostly, going to `yast` and searching for the keywords of a missing lib led me to its `devel` package so i installed it and so on. Try again. Until the compilation is successful. This was the hardest one.
3. You will have everything needed for now.
4. Copy all files from repo to your  ~/.config/ path, except this readme and licence ofc
5. Move wallpapers to ~/Pictures
6. run `chsh -s $(which fish)`


# Bloatware

If they created snaps and flatpaks, why dont we use them, isn't linux about freedom? So i decided to get support for as much software as i could.

1. Go to yast and find `flatpak` related packages. You will need `flatpak`, `flatpak-remote-flathub`
2. Go to snap page and install snap support, if you want. Dont forget to enable systemd services after installation.
3. Visit Homebrew website and install brew, then add brew to PATH
4. Install rust and add ~/.cargo/bin/ to PATH

# Scripts 
path: `~/.config/hypr/scripts`
All of the scripts are working, except `updates-check.sh` that i bound as a `systemd` service in my laptop. But check if you really need it (you will, but not so often like arch, with all the respect to arch, that i used btw for 5 months) as tumbleweed does not care about how often you update cuz of the snapshot system and better than any other distro package integrity with these snapshots.

# Sources
https://wiki.hyprland.org/ - Wiki for our fav manager
https://doc.opensuse.org/ - Wiki for our fav distro

good luck!
P.S. Btw, sorry for not having pictures. Posting these dotfiles and writing the documentation was kinda a five-minute job during my break cuz i decided to share. This config will be tailored and i will commit more, just to save it somewhere. (in case Tumbleweed stops booting ahaha, but i am sure it will serve me for longer than i expect) 
