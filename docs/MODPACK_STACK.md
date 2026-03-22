# Ages Of Siege Modpack Stack And Testing Plan

## Goal Of This Document

Pick a practical Minecraft version, choose a realistic mod integration direction, and define how the pack should be built, tested, and maintained as it grows.

This document is focused on:

- mod integration
- version choice
- pack structure
- dependencies
- test workflow
- quality of life baseline

## Recommended Platform

### Recommendation

Use `Minecraft 1.20.1` on `Fabric` for the MVP modpack.

### Why 1.20.1

It has one of the strongest shared compatibility points for:

- Fabric ecosystem stability
- Origins
- siege / invasion support
- NPC guard support
- performance and QoL mods
- mature automation / tech options

It is old enough to have a broad mod library, but modern enough to avoid unnecessary backward-port pain.

### Why Fabric

Fabric is the better fit for the current direction because:

- the existing custom project is already Fabric
- Origins is strongest and most established in the Fabric ecosystem
- Guard Villagers and Illager Invasion are available for Fabric 1.20.1
- Fabric has very strong performance and QoL support
- Fabric is a good fit for a custom integration-heavy control mod

## Important GregTech Decision

### Short Version

For the MVP, do **not** anchor the pack on full GregTech CEu.

Instead, use a `GregTech-like progression mod` on Fabric, with the current best candidate being `Modern Industrialization`.

### Why

You said you like GregTech because of:

- deep progression
- ore processing
- power generation
- production chains

That design goal is correct.

But the actual pack also needs:

- Origins
- NPC defense support
- siege gameplay
- stable integration
- manageable testing

Right now, `Modern Industrialization` is a stronger Fabric-native anchor for MVP than trying to force a full GregTech-centered build.

### Future Rule

If "must be true GregTech" becomes non-negotiable later, we should revisit the loader/platform decision before the project becomes too deep.

Do that early, not halfway through content production.

## Recommended MVP Stack

### Core Progression

- `Modern Industrialization`
  - role: industrial backbone
  - use for ore processing, machine progression, and automation depth

- `Origins`
  - role: player leadership identity
  - use for commander / engineer / defender-style custom origins or origin-adjacent design

- `Guard Villagers`
  - role: early NPC defender framework
  - use for stationing armed village-style defenders and testing command concepts

- `Illager Invasion`
  - role: expands hostile raid pressure and siege enemy variety
  - use as part of the hostile layer in early siege prototypes

### Essential Libraries / Shared Dependencies

These will depend on exact mod versions, but expect common support mods such as:

- `Fabric API`
- `Cloth Config API`
- `Cardinal Components API`
- `Puzzles Lib`
- `Forge Config API Port`
- any required Kotlin or helper libs for selected client utilities

These should be tracked carefully because most compatibility breakage in packs comes from dependency drift.

## Quality Of Life Baseline

QoL should be included from day one. A pack with deep progression and defense planning needs strong usability.

### Required QoL

- `EMI`
  - recipe and item lookup

- `EMI Loot`
  - inspect loot and drops more easily

- `Mod Menu`
  - inspect installed mods and configs

- `Jade`
  - inspect blocks, machines, and entities in-world

- `Jade Addons`
  - better support for modded systems like industrial blocks

- `Inventory Profiles Next`
  - sorting, gear handling, and inventory management

### Strongly Recommended Performance / Stability

- `Sodium`
- `Lithium`
- `ModernFix`
- `FerriteCore`
- `Dynamic FPS`

These should be treated as part of the default pack, not optional extras.

### Nice To Have Later

- map / waypoint tool
- screenshot helper
- config UI helpers
- crash report helpers
- better log surfacing

## Candidate Mod Roles

This is the current recommended role map.

### Technology

- `Modern Industrialization`
  - industrial depth
  - midgame and early late-game backbone

### Player Identity

- `Origins`
  - commander-style player identity
  - custom role design through data-driven powers or pack logic

### Defenders

- `Guard Villagers`
  - practical first NPC defense system
  - supports patrol points, ranged or melee guards, armor and inventory handling

### Siege Pressure

- `Illager Invasion`
  - stronger raid roster
  - helps make the world feel actively hostile

### Custom Project Layer

Your custom mod should eventually manage:

- current age
- siege state
- unlock triggers
- recipe / progression gates
- commander bonuses
- NPC role rules

## MVP Modpack Structure

The pack should be organized in a way that supports growth.

### Layer 1: Base Pack

- loader
- libraries
- QoL
- performance

### Layer 2: Feature Pack

- tech
- origins
- defenders
- hostile expansions

### Layer 3: Custom Control Layer

- custom integration mod
- configs
- data packs
- recipe gates
- progression tuning

This separation helps future maintenance and debugging.

## Recommended Build And Distribution Workflow

### Pack Management

Use `packwiz` to manage the modpack source.

Why:

- git-friendly
- handles CurseForge and Modrinth metadata
- clean version control
- easier mod updates
- better than manually storing random jar files in git

### Launcher

Use `Prism Launcher` for local testing and instance management.

Why:

- easy separate instances
- easy Java selection
- easy modpack import / export workflow
- good for keeping test environments clean

## Recommended Local Workflow

### Pack Source Repository

Create a separate repository or repo section for the modpack source:

- pack metadata
- config files
- scripts
- data packs
- custom mod jar or linked dev build

### Custom Mod Repository

Keep the custom Fabric mod in its own normal source layout.

That lets you:

- develop code cleanly
- build jars predictably
- drop or link the built jar into the pack during testing

### Testing Instances

Maintain at least three Prism instances:

- `Dev Pack`
  - fast-changing local pack
- `Stable Test`
  - only updated after passing checks
- `Clean Install`
  - simulates a fresh player install

This catches a lot of pack issues early.

## How We Should Test As The Pack Grows

Do not add mods in huge batches if you can avoid it.

### Recommended Add Process

1. Add one major mod or one small related batch.
2. Launch client.
3. Confirm world creation works.
4. Confirm logs have no major startup errors.
5. Test recipe viewer and config screens.
6. Test interaction with the current core mods.
7. Commit once stable.

### Test Gates

Every significant pack change should pass:

- `Client boot test`
- `World creation test`
- `Load existing test world`
- `Recipe viewer test`
- `Save and quit test`
- `Second launch test`

### Feature Test Gates For This Project

As the pack develops, also test:

- guard spawning and control
- raid / invasion behavior
- machine progression visibility in EMI
- recipe locks by age
- unlock transition after siege
- multiplayer sync later if needed

## Suggested Milestone Test Plan

### Milestone 1: Base Pack Boots

Pass criteria:

- pack launches cleanly
- QoL stack works
- performance stack works
- all core mods appear correctly

### Milestone 2: Defense Sandbox

Pass criteria:

- Guard Villagers works
- player can equip / station defenders
- invasion enemies spawn correctly
- no critical AI or pathfinding crashes

### Milestone 3: Industry Sandbox

Pass criteria:

- Modern Industrialization progression loads correctly
- EMI and Jade display useful data
- early machine chain works

### Milestone 4: First Custom Progression Slice

Pass criteria:

- one age exists
- one siege condition exists
- one unlock transition exists

## Compatibility Risks

These are the main risks to watch.

### Risk 1: GregTech Identity vs Fabric Stability

If you chase full GregTech identity too hard, you may end up fighting the ecosystem instead of building the game.

Mitigation:

- use Modern Industrialization for MVP
- preserve the "deep industry" feel in progression design

### Risk 2: NPC AI Not Matching Siege Fantasy

Guards may be good enough for MVP, but not enough for later large-scale fortress gameplay.

Mitigation:

- design the commander system as modular
- treat Guard Villagers as a first implementation, not the final one

### Risk 3: Too Many Mods Too Early

Large mod counts make debugging miserable.

Mitigation:

- add mods in controlled batches
- keep a changelog
- keep a stable testing instance

### Risk 4: Recipe Gating Complexity

Age-locking content across many mods can become a maintenance problem.

Mitigation:

- gate only the content that matters to progression
- prefer milestone-based unlocks over mass-editing everything at once

## Recommended Version Decision

For now, the project should proceed as:

- `Minecraft 1.20.1`
- `Fabric`
- `Modern Industrialization` instead of full GregTech for MVP
- `Origins + Guard Villagers + Illager Invasion` as the first gameplay support stack
- `packwiz + Prism Launcher` as the dev and test workflow

## Recommended Next Step

Build a `Phase 1 candidate mod list` with:

- required mods
- optional mods
- dependencies
- side designation
  - client only
  - server only
  - both
- first integration order

That should be the next planning document before we actually assemble the pack.
