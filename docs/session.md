# Session Manager

The Session Manager controls the lifecycle of the desktop environment.

## Commands

```bash
desktop session start
desktop session stop
desktop session restart
desktop session status
```

## Managed Services

* Hyprpaper
* Waybar
* SwayNC
* Playerctld

## Startup Flow

```text
Start Session
      ↓
Start Services
      ↓
Restore Wallpaper
      ↓
Generate Theme
      ↓
Reload Modules
      ↓
Desktop Ready
```
