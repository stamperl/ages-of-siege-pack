# Ages Of Siege Modpack Design

## One-Line Pitch

A modular Minecraft progression experience where the player builds a defensible base, survives scheduled siege events, and unlocks new ages of technology, production, and defense.

## Project Direction

This project should start as:

- a curated modpack for the heavy systems
- a small custom control mod for progression and sieges
- a design that can grow age-by-age without rewriting the core loop

The goal is not to build every system from scratch. The goal is to make existing systems feel like one cohesive game.

## Core Player Loop

1. Start in the current age with limited tools, recipes, and defenses.
2. Gather resources and expand the base.
3. Build infrastructure for production, storage, power, and defense.
4. Prepare for a timed or triggered siege.
5. Survive the siege.
6. Unlock the next age.
7. Gain access to stronger tech, better processing, and stronger defenses.
8. Face harder siege behavior in the next cycle.

## Design Pillars

- `Base First`: the player should win because they built a smart, layered base, not just because they have high damage gear.
- `Progress Through Pressure`: age unlocks should come from surviving sieges, not just grinding materials.
- `Deep Industry`: later ages should add meaningful production chains such as power generation, ore processing, and logistics.
- `Modular Growth`: each age should be a content module that plugs into the same core rules.
- `Hero Leadership`: player identity matters through role/origin choices and commanding defenders.

## Architecture

The project should be split into three layers.

### 1. Modpack Layer

Provides the major systems:

- tech progression
- automation and logistics
- storage and item routing
- player origins / classes
- NPC or guard framework
- combat / invasion support

This layer should do the heavy lifting so the custom code stays small.

### 2. Custom Core Mod

Provides the game rules:

- age state tracking
- siege scheduling and victory checks
- unlock handling
- recipe / machine gating hooks
- NPC command roles
- progression UI or simple status feedback

This is the heart of the experience and should stay clean and narrow.

### 3. Content Modules

Each age can later be treated like a module:

- unlock conditions
- available recipes
- siege enemy roster
- available defenses
- available power and processing options

This makes future expansion easier.

## MVP Scope

Phase 1 should be intentionally small.

### Included In MVP

- `3 ages`
  - Primitive Age
  - Medieval Age
  - Early Industrial Age
- `1 custom siege progression system`
- `1 custom unlock system`
- `1 player leadership layer`
- `basic NPC defense assignment concept`
- `basic recipe gating by age`

### Not Included In MVP

- futuristic ages
- huge quest book progression
- advanced diplomacy or factions
- fully simulated colony management
- giant multi-branch research trees
- dozens of siege enemy types
- full custom automation systems

## Age Breakdown

### Age 1: Primitive

Theme:

- survival
- hand tools
- wood, stone, fire
- basic fortification

Player goals:

- establish shelter
- gather food and fuel
- make primitive walls and traps
- prepare for first siege

Production level:

- manual gathering
- simple smelting or primitive fire processing
- no deep automation

Defenses:

- walls
- chokepoints
- spike traps
- elevated archer positions if NPCs are available

Siege threat:

- light raiders
- melee swarm pressure
- weak structure breaking

Unlock reward:

- medieval crafting tier
- stronger materials
- basic military organization

### Age 2: Medieval

Theme:

- ironworking
- fortifications
- organized defense
- early mechanical systems

Player goals:

- upgrade walls and gates
- create dedicated defense positions
- equip defenders
- improve material flow and storage

Production level:

- improved smelting
- basic ore improvement
- low-tier mechanical support

Defenses:

- reinforced walls
- gatehouses
- towers
- archers
- early siege counter-tools

Siege threat:

- tougher raiders
- shielded attackers
- basic ranged pressure
- primitive siege tools or gate-breakers

Unlock reward:

- industrial infrastructure
- power generation start
- deeper ore processing

### Age 3: Early Industrial

Theme:

- machines
- power
- bulk processing
- ammunition and engineered defense

Player goals:

- establish the first real industrial backbone
- keep power and material lines running during sieges
- defend larger, more valuable structures

Production level:

- early power generation
- ore processing chain
- better logistics and storage support

Defenses:

- improved barriers
- powered traps
- ammunition-fed defenses
- specialized defender roles

Siege threat:

- explosives
- stronger breach tools
- sustained pressure on infrastructure

Unlock reward:

- marks the end of MVP
- opens path to electrical age later

## Recommended MVP System Modules

These should be designed as separate modules even if they ship together.

### Module A: Age Manager

Responsibilities:

- stores current age
- checks unlock conditions
- advances age
- exposes current age to other systems

Why modular:

- every future system will read from this

### Module B: Siege Manager

Responsibilities:

- starts siege events
- tracks active siege state
- checks success or failure
- scales siege rules by age

Why modular:

- future enemy packs and siege types can plug into this

### Module C: Unlock / Gate Manager

Responsibilities:

- enables or disables recipes, structures, or machines by age
- controls what content becomes legal after each siege

Why modular:

- clean separation between progression rules and content mods

### Module D: Commander Layer

Responsibilities:

- defines the player's leadership role
- applies bonuses based on chosen origin / class
- handles simple NPC assignment categories

Suggested first NPC roles:

- wall archer
- gate guard
- patrol
- reserve defender

Why modular:

- can start simple and expand into more advanced command systems later

## Existing Mods vs Custom Work

### Existing Mods Should Handle

- long-form tech progression
- machine networks
- ore processing depth
- storage and logistics
- player origin / role identity
- NPC base behavior

### Custom Mod Should Handle

- the age ladder
- siege pacing
- victory-based progression
- system integration
- defense role rules

## Progression Philosophy

The player should not unlock a new age just because they crafted a table.

A better rule is:

- resources let you prepare
- infrastructure lets you endure
- siege survival grants advancement

That keeps the modpack focused on defense and escalation rather than pure crafting grind.

## MVP Success Criteria

Phase 1 is successful if:

- the player can clearly understand the current age
- the player can prepare for a siege
- a siege happens and can be won or lost
- winning unlocks the next age
- each age changes both production and defense options
- the experience already feels like "build, defend, advance"

## Early Open Questions

- Which specific tech mod should anchor midgame progression?
- Which NPC / guard mod is best for stationing defenders on walls?
- Should ages unlock from one major siege each or smaller repeated waves?
- Should the player choose one permanent leadership origin or several unlockable doctrines?
- How much of the recipe gating should be hard-locked versus soft-guided?

## Recommended Next Design Step

Create a second document for:

- exact age unlock conditions
- candidate mod list
- MVP siege rules
- commander / origin concepts
- first playable milestone plan
