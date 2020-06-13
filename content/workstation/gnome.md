+++
title = "GNOME"
+++

## Change Default Terminal

```
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/kitty
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ""
```

Kitty doesn't need `-e` or similar to run a program on launch

Alternative to the above is re-symlinking

```
/usr/bin/x-terminal-emulator
```
