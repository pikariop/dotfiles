# OS X specific settings

## Prerequisites

Install
- Xcode, CLI tools
- Homebrew
    - `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- oh-my-zsh
    - `curl -L http://install.ohmyz.sh | sh`
- [Seil](https://pqrs.org/osx/karabiner/seil.html.en)
- [Karabiner](https://pqrs.org/osx/karabiner/index.html.en)
- [NoEjectDelay](https://pqrs.org/osx/karabiner/noejectdelay.html.en) for MacBooks with optical drives
- [iTerm2](http://iterm2.com/)
- [Ukulele](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ukelele) - customize keyboard layouts to remap dead key behavior
- [f.lux](https://justgetflux.com/)

## Usage

- Run
    - `homebrew.sh`
    - `karabiner.sh`
        - Change Eject to Forward Delete (for older Macs)
        - Change Shift-Delete to Forward Delete (newer Macs without Eject)
    - `seil.sh`
        - Change Caps Lock to Escape (vim ftw)

- Import iTerm2 settings
    - Colors based on the awesome [Solarized](http://ethanschoonover.com/solarized) theme

- Symlink dotfiles

- Install custom keyboard layout
    - `sudo cp FinnishCustom.bundle /Library/Keyboard\ Layouts/`
    - `sudo chown -R root:wheel /Library/Keyboard\ Layouts/FinnishCustom.bundle `    - Add layout from System Preferences -> Keyboard -> Input Sources
    - So what is customized within the layout?
        - Dead key behavior of ~ removed, ~ is produced by pressing ¨.
        - ^ and dead-¨ mapped to ⇧¨ and ⌥¨
        - ´ and \` are reversed and non-dead. ⌥´ and ⇧⌥´ produce the dead key alternatives. Why reverse? Because the predefined Finnish way is opposite to U.S. layout, which I code often in, and in OS X, ⌘\` cycles through windows of current app, which doesn't even work with a Finnish layout.

- Using Yosemite? [Fix home phoning](https://fix-macosx.com)

## Todo

Check for options to bootstrap everything
- App installation?
- OS X configuration?
