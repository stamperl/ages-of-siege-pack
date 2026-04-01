# Ages Of Siege Pack

This repository contains the `Ages Of Siege` modpack, exported pack files, and local tooling used to test the custom siege gameplay with the wider mod stack.

## What This Repo Contains

- `docs/`
  - design notes and planning material
- `modpack/`
  - packwiz source
  - exported `.mrpack`
  - local built `ages-of-siege-control` jar
  - Prism import helper scripts
- `tools/`
  - local utilities and Prism testing setup

## Pack Target

- Minecraft `1.20.1`
- Fabric Loader `0.18.4`
- Java `17`
- packwiz format `1.1.0`

## Custom Mod Dependency

This pack depends on the separate control-mod repository:

- Local source: [Ages Of Siege Control Mod](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Control%20Mod)
- GitHub: [stamperl/ages-of-siege-control-mod](https://github.com/stamperl/ages-of-siege-control-mod)

The built jar is currently mirrored into:

- [modpack\mods\ages-of-siege-control-0.1.0.jar](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Pack\modpack\mods\ages-of-siege-control-0.1.0.jar)
- [tools\prism\instances\Ages Of Siege-0.1.0\minecraft\mods](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Pack\tools\prism\instances\Ages%20Of%20Siege-0.1.0\minecraft\mods)

## Current Pack Shape

- 38 managed mod entries in `modpack/mods`
- custom siege control mod included as a local jar
- Prism-based local testing workflow
- `.mrpack` export for clean imports

## Repository

- Local workspace: [Ages Of Siege Pack](C:\Users\Stamp\OneDrive\Documents\Ages%20Of%20Siege%20Pack)
- GitHub: [stamperl/ages-of-siege-pack](https://github.com/stamperl/ages-of-siege-pack)
