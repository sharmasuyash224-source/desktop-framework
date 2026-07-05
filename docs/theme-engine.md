# Theme Engine

The Theme Engine generates desktop themes from the active wallpaper palette.

## Architecture

```text
Theme Engine
        │
        ▼
Palette
        │
        ▼
Generators
        │
        ├── Waybar
        ├── Hyprlock
        ├── SwayNC
        └── Rofi
```

## Generator Layout

```text
generator/
├── manifest.sh
└── generate.sh
```

## Workflow

```text
Wallpaper
      ↓
Wallust
      ↓
Palette
      ↓
Generators
      ↓
Generated Configuration
```

Each generator is independent and can be added or removed without affecting the rest of the framework.
