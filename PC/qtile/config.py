from datetime import datetime
from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import *
from libqtile.lazy import lazy
import os
import subprocess

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

mod = "mod4"
terminal = "alacritty"

groups = [Group(i) for i in "123456789"]

follow_mouse_focus = True
dgroups_key_binder = None
cursor_warp = False
bring_front_click = False
auto_fullscreen = True
focus_on_window_activation = "smart"
dgroups_app_rules = []

colors = [
    '#2e3440', '#3B4252', '#434C5E', '#4C566A',              # Polar Night
    '#d8dee9', '#E5E9F0', '#ECEFF4',                        # Snow Storm
    '#8fbcbb', '#88C0D0', '#81A1C1', '#5E81AC',              # Frost
    '#BF616A', '#D08770', '#EBCB8B', '#A3BE8C', '#B48EAD'   # Auora
]


keys = [

    #* Layout *#

    Key([mod], "h", lazy.layout.left()),
    Key([mod], "Left", lazy.layout.left()),

    Key([mod], "l", lazy.layout.right()),
    Key([mod], "Right", lazy.layout.right()),

    Key([mod], "j", lazy.layout.down()),
    Key([mod], "Down", lazy.layout.down()),

    Key([mod], "k", lazy.layout.up()),
    Key([mod], "Up", lazy.layout.up()),

    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),

    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),

    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),

    Key([mod], "i", lazy.layout.grow()),

    Key([mod], "m", lazy.layout.shrink()),

    Key([mod], "n", lazy.layout.normalize()),

    Key([mod], "o", lazy.layout.maximize()),

    Key([mod, "shift"], "space", lazy.layout.flip()),

    Key([mod, "shift"], "space", lazy.layout.rotate()),

    Key([mod], "Return", lazy.spawn(terminal)),

    Key([mod], "b", lazy.spawn("qutebrowser")),

    Key([mod], "d", lazy.spawn(
        "rofi -modi drun,run -show drun -font \"Hack Nerd Font Regular 12\" -show-icons")),
    Key([mod], "w", lazy.spawn("rofi -show window")),
    Key([mod], "s", lazy.spawn("rofi -show ssh")),

    Key([mod], "Tab", lazy.next_layout()),

    Key([mod, "shift"], "q", lazy.window.kill()),

    Key([mod, "shift"], "r", lazy.restart()),

    Key([mod, "control"], "e", lazy.shutdown()),

    Key([mod], "r", lazy.spawncmd())
]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ])


layouts = [
    layout.MonadTall(
        align=1,
        border_focus=colors[8],
        border_normal=colors[1],
        margin=8,
        ratio=0.55
    )
]


widget_defaults = dict(
    font='Hack',
    fontsize=16,
    padding=5)

extension_defaults = widget_defaults.copy()

def seperate():
    widge = widget.Sep(
        padding=4,
        linewidth=2,
        foreground=colors[3]
    )
    return widge


def space():
    return widget.Spacer(bar.STRETCH)

def cpu():
    widge = widget.CPU(
        format="CPU: {load_percent}%",
        background=colors[7],
        foreground=colors[1],
        fontsize=14
    )
    return widge

def workspaces():
    active = colors[4]
    bg = colors[1]
    current_border = colors[7]
    urgent = colors[11]
    widge = widget.GroupBox(
        boderwidth=1,
        fontsize=12,
        margin=3,
        active=active,
        background=bg,
        this_current_screen_border=current_border,
        urgent_border=urgent,
        disable_drag=True,
        hide_unused=True
    )
    return widge

def day():
    widge = widget.Clock(
        format="%a %d %b",
        background=colors[10],
        foreground=colors[4],
        fontsize=14
    )
    return widge

def countdown():
    bg = colors[11]
    day = datetime(2021, 1, 25, 9)
    widge = widget.Countdown(
        date=day,
        background=bg)
    return widge

def time():
    widge = widget.Clock(
        format="%H:%M",
        background=colors[7],
        foreground=colors[1],
    )
    return widge

def init_widgets_list():
    list = [cpu(),
            seperate(),
            space(),
            workspaces(), space(),
            day(), seperate(),
            time(),  seperate(),
            ]
    return list

def get_bar(height=26, background=colors[1], opacity=0.9):
    widgets = init_widgets_list()
    mybar = bar.Bar(widgets, height, background=background, opacity=opacity)
    return mybar

screens = [Screen(bottom=get_bar())]
