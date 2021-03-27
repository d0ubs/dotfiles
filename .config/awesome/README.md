# dotfiles
## Environment
+ **OS**: Archlinux
+ **WM**: AwesomeWM
+ **Terminal**: urxvt
+ **File Manager**: lf
+ **Editor**: Vim
+ **Browser**: Brave

## Features
+ Active tag is colored differently
+ Inactive tags with clients open display a similar but darker color than active tags 
+ Tooltip on the wifi icon shows the ssid
+ Tooltip on the battery icon shows the time remaining on the battery or to complete charge
+ Tooltip on the time shows the current date

## Dependencies
| Dependency | Description | Why/Where is it needed? |
| --- | --- | --- |
| `awesome`
| `acpid` | Daemon for delivering ACPI events | Charger notifications |
| `pulseaudio`, `libpulse` | Sound system **(Installed by default on most distros)** | Volume widgets and keybinds |
| `feh` | Image viewer and wallpaper setter | Screenshot previews, wallpapers |

### Fonts
+ **Hack**

## Change in configuration
+ In bars/sidedbar.lua adapt the vertical padding height if your screen has another resolution than full HD

## AwesomeWM configuration: File structure
Following github/elenapan structure, I have split my `rc.lua` into multiple files for organization purposes.

+ The `widgets` directory contains the widgets

+ The `evil` directory contains daemons (processes that run in the background) which emit signals
  that are used in widgets.

   They provide an easy way of writing widgets that rely on external information. All you need to do is subscribe to the signal a daemon provides.
   No need to remember which shell command gives you the necessary info or bother about killing orphan processes. Evil takes care of everything.

+ `themes` contains theme configuration, pictures and icons.

+ `bars` contain the sidebar lua code 

## Basic keybinds

I use `super` AKA Windows key as my main modifier.

#### Keyboard
+ `super + enter` - Spawn terminal
+ `super + shift + enter` - Spawn floating terminal
+ `super + control + space` - Toggle floating client
+ `super + [1-0]` - View tag AKA change workspace (for you i3 folks)
+ `super + shift + [1-0]` - Move focused client to tag
+ `super + shift + s` - Floating layout
+ `super + [arrow keys] / hjkl` - Change focus by direction
+ `super + shift + [arrow keys] / [hjkl]` - Move client by direction. Move to edge if it is floating.
+ `super + control + [arrow keys] / [hjkl]` - Resize

#### Mouse on desktop
+ `right click` - App drawer

## Tips / Notes
+ The vertical bar features a transparent picture for padding. Its forced height is configured for Full HD and should be adapted if the vertical resolution of the screen is different.
+ It you want to modify the config don't forget to check out the [API Documentation for AwesomeWM](https://awesomewm.org/apidoc/index.html).
