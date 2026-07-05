# Pipeline Engine

Desktop Framework uses a sequential pipeline engine to automate desktop workflows.

## Pipeline Structure

```text
pipeline/
├── manifest.sh
├── run.sh
└── steps/
    ├── 01-*.sh
    ├── 02-*.sh
    ├── ...
    └── NN-*.sh
```

## Wallpaper Pipeline

```text
01 Select Wallpaper
        ↓
02 Apply Wallpaper
        ↓
03 Generate Colors (Wallust)
        ↓
04 Generate Theme
        ↓
05 Reload Modules
        ↓
06 Save State
```

## Execution

```bash
desktop wallpaper random
```

The pipeline executes each step sequentially and stops immediately if a step fails.
