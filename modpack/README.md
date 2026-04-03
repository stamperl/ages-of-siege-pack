# Ages Of Siege Modpack

This folder contains the live `packwiz` source for the `Ages Of Siege` pack.

## Target Versions

- Minecraft `1.20.1`
- Fabric Loader `0.18.4`
- Java `17`

## What Is In Here

- [pack.toml](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Pack\modpack\pack.toml)
- [index.toml](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Pack\modpack\index.toml)
- `mods/*.pw.toml` for managed CurseForge/Modrinth entries
- the local built [ages-of-siege-control-0.1.0.jar](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Pack\modpack\mods\ages-of-siege-control-0.1.0.jar)
- the local built [ages-of-siege-traders-0.1.0.jar](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Pack\modpack\mods\ages-of-siege-traders-0.1.0.jar)
- the exported `.mrpack`

## Gameplay Role

The pack provides the wider environment around the custom control mod:

- survival and exploration baseline
- defender and siege-supporting content mods
- UI, QoL, and performance mods for testing
- local bundled copies of the `Ages Of Siege Control Mod` and `Age Of Siege Traders`

## Dependency Note

The pack expects the custom gameplay mods from:

- [Ages Of Siege Control Mod](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Control%20Mod)
- [Age Of Siege Traders](C:\Users\Stamp\OneDrive\Documents\_tmp_age_of_siege_traders)

When gameplay code changes land, rebuild the relevant repo and replace the jar in `modpack/mods/` before exporting the pack again. Both custom jars should be bundled in the pack for the pack to work.
