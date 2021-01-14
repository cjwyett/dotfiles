# vim:fileencoding=utf-8:ft=python:foldmethod=marker

#source-bash --overwrite-alias / etc/profile

# PATH  {{{

$PATH = [
    "/usr/local/sbin",
    "/usr/local/bin",
    "/usr/bin",
    "/home/cyrus/.local/bin",
    "/home/cyrus/Rust/Cargo/bin"
]

# }}}

# Environment Variables {{{

# XDG
$XDG_CONFIG_HOME = '/home/cyrus/.config'
$XDG_CACHE_HOME = '/home/cyrus/.cache'
$XDG_DATA_HOME = '/home/cyrus/.local/share'

# Prompt
$PROMPT = ("{env_name}"
           "{BOLD_INTENSE_RED}["
           "{BOLD_INTENSE_RED}{user}"
           "{BOLD_RED}@"
           "{BOLD_YELLOW}{hostname}"
           "{BOLD_YELLOW}]"
           "{BOLD_GREEN} in "
           "{BOLD_INTENSE_BLUE}{short_cwd}"
           "{branch_color}{BOLD_INTENSE_PURPLE} "
           "{prompt_end} {RESET}"
           )

# Browser
$BROWSER = '/usr/bin/qutebrowser'

# Julia
$JULIA_DEPOT_PATH = '/home/cyrus/Julia/depot'

# OpenMC
$OPENMC_CROSS_SECTIONS = '/home/cyrus/.local/share/openmc/jeff33/cross_sections.xml'


# Rust
$CARGO_HOME = '/home/cyrus/Rust/Cargo'
$RUSTUP_HOME = '/home/cyrus/Rust/Rustup'

# Task
$TASKDATA = '/home/cyrus/.config/task'
$TASKRC = '/home/cyrus/.config/task/taskrc'


# }}}

# Aliases {{{

aliases['..'] = 'cd ..'

aliases['gc'] = 'git clone'

aliases['h'] = 'sudo hdparm -y /dev/sdb'

aliases['in'] = "task add +in"

aliases['la'] = 'ls -a'

aliases['n'] = 'nvim'

aliases['r'] = 'rm -r'

aliases['Ss'] = 'sudo pacman -Ss'

aliases['S'] = 'sudo pacman -S'

aliases['u'] = ("sudo updatedb && "
                "sudo pacman -Syyu --noconfirm && "
                "yay -Syyu --noconfirm --nodiffmenu && "
                "yay -Yc --noconfirm --nodiffmenu && "
                "yay -Sc --noconfirm --nodiffmenu && "
                "sudo rustup update stable && "
                "cargo install-update -a && "
                "pipupgrade -y && "
                "pipupgrade -s "
                )

aliases['x'] = "nvim ~/.xinitrc"

# }}}

# Load Modules {{{

# xontrib load jedi
xontrib load kitty
# xontrib load mpl

# }}}
