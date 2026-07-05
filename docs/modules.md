# Modules

Desktop Framework uses a modular architecture.

Each module follows the same structure.

```text
module/
├── manifest.sh
├── doctor.sh
├── start.sh
├── stop.sh
├── status.sh
├── theme.sh
└── hooks/
```

## Available Modules

* Waybar
* Wallpaper
* Hyprlock
* SwayNC
* Rofi
* Powermenu

## Module Lifecycle

```text
Load
 ↓
Doctor
 ↓
Start
 ↓
Status
 ↓
Theme
 ↓
Stop
```
