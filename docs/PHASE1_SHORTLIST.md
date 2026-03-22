# Ages Of Siege Phase 1 Shortlist

## Purpose

This document locks the `Phase 1` mod shortlist for the first playable pack target.

It is intentionally smaller than the full candidate list.

The goal is to:

- prove the pack boots reliably
- prove the core fantasy works
- avoid early mod bloat

## Phase 1 Design Goal

The first playable version should answer one question:

`Can we make a fun early base-defense experience with light progression, NPC defenders, and the beginning of industrial depth?`

If the answer is yes, then we expand.

## Locked Platform

- `Minecraft 1.20.1`
- `Fabric`

## Locked Phase 1 Mod Shortlist

### Foundation

- `Fabric API`
- `Mod Menu`
- `Cloth Config API` if required by the selected versions
- `Fabric Language Kotlin`

### QoL

- `EMI`
- `Jade`
- `Inventory Profiles Next`

### Performance / Stability

- `Sodium`
- `Lithium`
- `ModernFix`
- `FerriteCore`
- `Dynamic FPS`

### Core Gameplay

- `Origins`
- `Modern Industrialization`
- `Guard Villagers`
- `Puzzles Lib`
- `Forge Config API Port`
- `Illager Invasion`

## Why These Made The Cut

### Origins

Kept because it supports the commander / specialist fantasy without requiring us to build a class system from scratch.

### Modern Industrialization

Kept because it gives us the industrial progression backbone with much lower integration risk than trying to force full GregTech into the MVP.

### Guard Villagers

Kept because it gives us a practical way to test wall defenders, guard assignments, and a defended settlement fantasy.

### Illager Invasion

Kept because it gives us a stronger hostile roster and better siege pressure for prototyping than vanilla alone.

### EMI and Jade

Kept because a progression-heavy pack becomes frustrating quickly without recipe lookup and world inspection.

### Performance Mods

Kept because pack stability and usability matter from day one.

## Mods Deliberately Deferred

These are not rejected forever. They are just postponed.

### Deferred QoL

- `EMI Loot`
  - useful, but not essential for the first integration pass

- minimap / waypoint mods
  - useful, but not core to proving the concept

- Jade Addons
  - helpful, but not necessary until machine overlays feel lacking

### Deferred Gameplay

- Origins addons
  - we should first verify plain Origins works for our design direction

- extra village enhancement mods
  - we should not pile more AI and behavior complexity on top of Guard Villagers yet

- additional tech mods
  - we want one clear progression backbone in Phase 1

- extra raid / invasion mods
  - one hostile expansion is enough for the first pass

## Phase 1 Success Criteria

Phase 1 is successful if all of the following are true:

- the pack boots cleanly
- a new world can be created and reloaded
- Origins works
- Modern Industrialization works and is visible in EMI
- Guard Villagers function in a defended settlement
- Illager Invasion does not destabilize normal play
- the pack already feels like the start of a "build, defend, progress" experience

## Phase 1 Test Order

Install and test in this order.

### Step 1

- Fabric API
- Mod Menu
- Cloth Config API if needed
- Fabric Language Kotlin

### Step 2

- EMI
- Jade
- Inventory Profiles Next

### Step 3

- Sodium
- Lithium
- ModernFix
- FerriteCore
- Dynamic FPS

### Step 4

- Modern Industrialization

### Step 5

- Origins

### Step 6

- Guard Villagers

### Step 7

- Puzzles Lib
- Forge Config API Port
- Illager Invasion

## What We Build Around This Shortlist

The custom project should target this exact Phase 1 stack.

That means the first custom systems should assume:

- one industrial backbone
- one identity framework
- one NPC defense framework
- one hostile expansion framework

This keeps the custom integration layer small and focused.

## What Not To Do In Phase 1

- do not add more tech mods
- do not add more NPC mods
- do not add more invasion mods
- do not add big worldgen overhauls
- do not add huge quest systems yet
- do not try to solve every future age now

## Recommended Next Step

Create the `packwiz` skeleton for this shortlist and assemble it in the exact test order above.
