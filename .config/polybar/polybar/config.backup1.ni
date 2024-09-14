include-file = ~/.config/polybar/themes/colors.ini
include-file = ~/.config/polybar/modules.ini
include-file =  ~/.config/polybar/separators.ini

[bar/bar]
width =                                 100%:-40
offset-x = 					            18
offset-y = 					            5

;height = 					            58
height =                                33pt
radius = 					            15
line-size =                             0

override-redirect =                     true
wm-restack =                            i3
enable-ipc =                            true

background =                            ${colors.bg2}
foreground =                            ${colors.fg0}

border-size =                           6
border-color =                          ${colors.bg2}
border-radius =                         0

padding-right =                         0
module-margin-left =                    0
module-margin-right =                   0

font-0 =                                "Hack Nerd Font:size=13;3"
font-1 = Material Design Icons Desktop:size=16;3
font-2 = Material Design Icons Desktop:size=20;5
font-3 = JetBrainsMono Nerd Font:size=27;6
font-4 = JetBrainsMono Nerd Font:size=17;5
font-5 = JetBrainsMono Nerd Font:size=11;4
font-6 = Material Design Icons Desktop:size=16;4
font-7 = Sofia Pro:style=Bold:size=18;0
font-8 = Material Design Icons Desktop:size=18;4
font-9 = Feather:style=Bold:size=18;6
font-10 = Material Design Icons Desktop:size=20:style=bold;5
font-11 = Sofia Pro:style=Bold:size=14;3
font-12 = Material Design Icons Desktop:size=14;3
font-13 = JetBrainsMono Nerd Font:size=14;4
font-14 = Grid Styles:size=18;4

modules-left =                          wallpaper date right1
modules-center =                        left1 xworkspaces right1
modules-right =                         left1 network temp pulseaudio cpu powermenu 

cursor-click = 	                        pointer
cursor-scroll =                         ns-resize

click-left = 
click-middle = 
click-right =
scroll-up =
scroll-down =
double-click-left =
double-click-middle =
double-click-right =