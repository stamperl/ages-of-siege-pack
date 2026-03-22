# Ages Of Siege Candidate Mod List

## Purpose

This document turns the planning docs into a practical pack assembly list.

It defines:

- required mods
- optional mods
- expected dependencies
- which side they belong on
- the order we should integrate them

This is for the `MVP pack` on `Minecraft 1.20.1` with `Fabric`.

## Pack Assembly Rules

Before listing mods, these are the rules we should follow:

1. Add mods in phases, not all at once.
2. Treat dependencies as first-class entries, not hidden details.
3. Prefer mods with active 1.20.1 Fabric support and clear documentation.
4. Avoid duplicate-purpose mods unless there is a very clear reason.
5. Keep client-only QoL separate from gameplay-critical mods.

## Side Legend

- `Client`: only needed on the client
- `Server`: only needed on the server
- `Both`: should be installed on both sides

## Phase 0: Foundation

These are the first mods to install before any gameplay features.

### Required

- `Fabric Loader`
  - side: `Both`
  - role: loader

- `Fabric API`
  - side: `Both`
  - role: shared API base for most Fabric mods

- `Mod Menu`
  - side: `Client`
  - role: inspect installed mods and open config screens

### Recommended

- `Cloth Config API`
  - side: `Client` or `Both` depending on selected mod requirements
  - role: config screens for many Fabric mods

- `Fabric Language Kotlin`
  - side: `Both`
  - role: dependency for several popular utility mods

## Phase 1: QoL And Performance Baseline

This phase should make the pack usable and pleasant before we start gameplay integration.

### Required QoL

- `EMI`
  - side: `Client`
  - role: item and recipe viewer

- `EMI Loot`
  - side: `Client`
  - role: loot table visibility inside EMI
  - note: requires `EMI`

- `Jade`
  - side: `Client`, with `Both` preferred when modded server info matters
  - role: in-world inspection HUD

- `Inventory Profiles Next`
  - side: `Client`
  - role: sorting, loadouts, inventory management
  - note: depends on `Fabric API`, `Fabric Language Kotlin`, `libIPN`, and `Mod Menu`

### Required Performance

- `Sodium`
  - side: `Client`
  - role: rendering performance

- `Lithium`
  - side: `Both`
  - role: logic and tick performance

- `ModernFix`
  - side: `Both`
  - role: load-time, memory, and stability improvements

- `FerriteCore`
  - side: `Both`
  - role: memory optimization

- `Dynamic FPS`
  - side: `Client`
  - role: reduce background resource usage

### Optional QoL

- `Jade Addons`
  - side: `Client` or `Both` depending on server info needs
  - role: richer machine and storage overlays

- minimap / waypoint mod
  - side: `Client`
  - role: navigation
  - note: choose later to avoid unnecessary overlap early

## Phase 2: Core Gameplay Mods

This is the first real identity layer of the pack.

### Required

- `Origins`
  - side: `Both`
  - role: player identity and role framework
  - use in project: commander / engineer / defender archetypes

- `Modern Industrialization`
  - side: `Both`
  - role: industrial progression backbone
  - use in project: machinery, ore processing, automation depth
  - note: pair with EMI and Jade from day one

- `Guard Villagers (Fabric/Quilt)`
  - side: `Both`
  - role: MVP defender framework
  - use in project: wall archers, gate guards, patrols, follow orders

- `Illager Invasion`
  - side: `Both`
  - role: hostile siege pressure and enemy variety
  - note: requires `Puzzles Lib`, `Fabric API`, and `Forge Config API Port` on Fabric

### Expected Supporting Dependencies

- `Puzzles Lib`
  - side: `Both`
  - role: dependency for `Illager Invasion`

- `Forge Config API Port`
  - side: `Both`
  - role: dependency for some Fabric ports and config-backed mods

### Optional

- `Origins` addons
  - side: `Both`
  - role: more data-driven inspiration or examples
  - note: should not be added until base Origins design is clear

- village enhancement mods
  - side: `Both`
  - role: can improve settlement feel
  - note: defer until Guard Villagers is stable

## Phase 3: Custom Control Layer

This phase is your custom work.

### Required

- `Ages Of Siege Core Mod`
  - side: `Both`
  - role: age tracking, siege state, unlock logic, recipe gating, commander integration

### Suggested Internal Modules

- `Age Manager`
- `Siege Manager`
- `Unlock Manager`
- `Commander Layer`
- `Pack Integration Hooks`

### Data Packs / Config Packs

These should be treated as part of the project:

- recipe adjustments
- age gating data
- loot tuning
- raid or invasion tuning
- guard tuning

## Installation And Integration Order

This is the order we should actually use.

### Step 1: Base Runtime

Install:

- Fabric Loader
- Fabric API
- Mod Menu
- Cloth Config API if needed
- Fabric Language Kotlin

Pass criteria:

- client launches
- world opens
- mod list is clean

### Step 2: QoL

Install:

- EMI
- EMI Loot
- Jade
- Inventory Profiles Next

Pass criteria:

- recipe viewer works
- loot viewer works
- overlay works
- inventory hotkeys work

### Step 3: Performance

Install:

- Sodium
- Lithium
- ModernFix
- FerriteCore
- Dynamic FPS

Pass criteria:

- no startup crash
- no rendering corruption
- no obvious world stutter regression

### Step 4: Industry Backbone

Install:

- Modern Industrialization

Pass criteria:

- recipes visible in EMI
- world creation works
- early machine progression is accessible
- Jade shows machine info well enough

### Step 5: Player Identity

Install:

- Origins

Pass criteria:

- origin selection works
- respawn / save reload works
- no conflicts with industrial content

### Step 6: Defenders

Install:

- Guard Villagers

Pass criteria:

- guards spawn or can be created
- inventory and commands work
- pathfinding is stable around simple walls

### Step 7: Siege Pressure

Install:

- Puzzles Lib
- Forge Config API Port
- Illager Invasion

Pass criteria:

- world generates without errors
- hostile structures generate correctly
- raids and hostile encounters do not hard-crash

### Step 8: Custom Integration

Install:

- Ages Of Siege Core Mod
- associated data packs / config pack

Pass criteria:

- age state can be tracked
- at least one siege event can be detected or simulated
- at least one age unlock can occur

## Required Test Checklist For Each Phase

After each phase, run:

- client boot
- create new world
- save and quit
- reload world
- inspect mod configs
- inspect logs for repeat warnings or dependency issues

After gameplay phases, also run:

- spawn relevant entities
- test recipe visibility
- test one combat scenario
- test one save after using the new systems

## Notes On Mod Roles

### Origins

Origins should initially be used for `player identity`, not full progression control.

Recommended MVP use:

- commander-style traits
- engineer-style traits
- defender-style traits

It should flavor the experience without becoming the entire pack's unlock system.

### Modern Industrialization

This should provide the `deep production` backbone.

Use it for:

- ore processing
- machine progression
- power
- logistics support

Do not try to rewrite all of MI at the start. Instead, gate access to meaningful milestones.

### Guard Villagers

This is the first implementation of NPC defenders, not the final answer forever.

Use it first for:

- stationing guards
- equipping defenders
- testing patrol / hold concepts

If later AI needs exceed what Guard Villagers can do, the custom mod can layer more rules or eventually move to a different NPC solution.

### Illager Invasion

This is best used as the `hostile roster expansion` for early siege prototyping.

It should make enemy pressure more interesting without forcing us to fully custom-build enemy waves immediately.

## Optional Later Candidates

These are not for the first pack build, but are worth keeping in mind.

- custom origin data packs
- additional village / faction flavor mods
- map or waypoint utility
- structure control tools
- server-side admin/debug helpers
- more advanced raid tuning mods

## What We Are Deliberately Avoiding For Now

- full GregTech CEu stack
- huge kitchen-sink mod count
- multiple overlapping tech mods
- multiple overlapping NPC systems
- multiple overlapping recipe viewers
- multiple major worldgen overhauls

## First Build Recommendation

The first actual pack assembly should target this minimum stack:

- Fabric API
- Mod Menu
- Cloth Config API if required
- Fabric Language Kotlin
- EMI
- EMI Loot
- Jade
- Inventory Profiles Next
- Sodium
- Lithium
- ModernFix
- FerriteCore
- Dynamic FPS
- Modern Industrialization
- Origins
- Guard Villagers
- Puzzles Lib
- Forge Config API Port
- Illager Invasion

Then test before adding anything else.

## Sources Used

- [Origins on Modrinth](https://modrinth.com/mod/origins)
- [Modern Industrialization on Modrinth](https://modrinth.com/mod/modern-industrialization)
- [Guard Villagers (Fabric/Quilt) on Modrinth](https://modrinth.com/mod/guard-villagers-%28fabricquilt%29)
- [Illager Invasion on Modrinth](https://modrinth.com/mod/illager-invasion)
- [EMI on Modrinth](https://modrinth.com/mod/emi/)
- [EMI Loot on Modrinth](https://modrinth.com/mod/qbbO7Jns/)
- [Mod Menu on Modrinth](https://modrinth.com/mod/ModMenu)
- [Sodium on Modrinth](https://modrinth.com/mod/sodium/)
- [Lithium on Modrinth](https://modrinth.com/mod/lithium/version/mc1.20.1-0.11.2)
- [ModernFix on Modrinth](https://modrinth.com/mod/modernfix/)
- [Inventory Profiles Next on Modrinth](https://modrinth.com/mod/inventory-profiles-next/)
- [Jade on Modrinth](https://modrinth.com/mod/jade/)
- [Dynamic FPS on Modrinth](https://modrinth.com/project/LQ3K71Q1)
- [FerriteCore (Fabric) on CurseForge](https://www.curseforge.com/minecraft/mc-mods/ferritecore-fabric)
- [Prism Launcher official site](https://prismlauncher.org/)
- [packwiz on GitHub](https://github.com/packwiz/packwiz)
