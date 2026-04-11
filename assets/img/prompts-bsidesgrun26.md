# Image Prompts for BSides Groningen 2026 Slides

## 1. Restaurant Supply Chain Metaphor
**For slide: "The Restaurant Metaphor"**

```
A split-screen illustration showing a restaurant kitchen on the left and a software developer's workspace on the right.

Left side: A chef in a restaurant kitchen surrounded by ingredients - vegetables, meats, spices - with delivery trucks and supplier boxes visible in the background. Some ingredients have subtle warning symbols.

Right side: A developer at a desk with code on screen, surrounded by floating package boxes labeled "npm", "PyPI", code libraries. Some packages have subtle warning symbols.

Style: Clean, modern, slightly abstract illustration with a dark blue/purple color scheme. Minimal, professional, suitable for technical presentation.
```

---

## 2. Dependency Iceberg
**For slide: "The Dependency Iceberg"**

```
An iceberg visualization in a dark ocean.

Above the waterline (small, visible part): A single glowing box labeled "Your App" - clean and controlled.

Below the waterline (massive, hidden part): Hundreds of interconnected boxes/nodes representing dependencies, forming a complex web that extends deep underwater. Some nodes are highlighted in red/orange suggesting hidden risks.

Style: Technical diagram meets artistic visualization. Dark background, glowing elements, blue and purple tones with red accent for danger. Clean, modern, suitable for security presentation.
```

---

## 3. The Trust Chain
**For slide: "What is a Supply Chain Attack?"**

```
A chain of connected links stretching horizontally. Each link is labeled: Developer → Package → Registry → CI/CD → Production.

One link in the middle (Package/Dependency) is cracked and glowing red/orange, with malicious code symbols seeping through to the rest of the chain.

Style: Minimalist, dark background, metallic chain links, dramatic lighting on the compromised link. Professional, security-focused aesthetic.
```

---

## 4. The Worm Spreading
**For slide: Shai-Hulud section**

```
A network visualization showing a software ecosystem. Starting from one compromised node (glowing red), tendrils/connections spread outward to hundreds of other nodes, turning them red as the "infection" spreads.

The pattern resembles a worm or organic growth spreading through a digital network.

Style: Abstract, dark background with glowing nodes. Red/orange for compromised, blue/green for healthy. Network topology visualization with organic spreading pattern.
```

---

## 5. Mutable vs Immutable
**For slide: Tag Hijacking section**

```
Two parallel paths shown as railroad tracks:

Left track (Mutable/Dangerous): A sign pointing to "v1.0" but the track switches and redirects to a cliff/danger zone. The sign can be moved.

Right track (Immutable/Safe): A sign with a long hash/SHA pointing to a specific destination. The sign is bolted down, immovable. Track goes straight to safe destination.

Style: Simplified, diagram-style illustration. Red tones for dangerous path, green for safe. Dark background, clear visual metaphor.
```

---

## 6. AI as Attack Amplifier
**For slide: AI Amplifier section**

```
A human figure on the left working slowly on one target (single computer).

On the right, an AI/robot figure simultaneously attacking hundreds of targets (many computers), with speed lines suggesting rapid automated action.

Visual comparison showing scale: Human = 1 target per hour, AI = 1000 targets per second.

Style: Minimalist silhouettes, dark background, dramatic scale contrast. Red accents for attack actions.
```

---

## 7. The Monday Checklist
**For slide: Closing checklist**

```
A shield or security badge icon with a checklist overlay. Six checkboxes with security-related icons next to them. Some boxes are checked in green.

Background suggests a developer workspace becoming more secure/protected.

Style: Clean, modern icon design. Green for completed/safe, subtle glow effect. Professional security aesthetic.
```

---

## 8. Shai-Hulud Kill Chain Overview
**For slide: "The Full Kill Chain"**

```
A vertical sequence of six connected stages forming a descending chain or cascade, viewed from a dramatic side angle. Each stage is a glowing node connected by flowing energy/data streams:

Stage 1 (top): A package box opening, releasing code — the preinstall hook trigger.
Stage 2: A magnifying glass scanning through file cabinets and vaults — secret hunting.
Stage 3: A single worm splitting into dozens of copies spreading outward — propagation.
Stage 4: A terminal/console embedded inside a server rack — persistent access.
Stage 5: Data streams flowing upward into cloud repositories — exfiltration.
Stage 6 (bottom): A detonation/shatter effect — the kill switch destroying evidence.

The entire chain is connected by glowing orange/red tendrils suggesting organic, worm-like spread. Background is dark with warm amber/orange tones. The feel should be ominous and systematic — a machine of exploitation.

Style: Dark cinematic illustration, amber/orange/red color palette on near-black background. Technical but dramatic. Suitable for security presentation on dark slide.
```

---

## 9. Lessons from the Worm
**For slide: "Lessons from the Worm"**

```
A split composition divided diagonally:

Left/top half (danger): A sandworm-inspired creature made of code and data, burrowing through a digital landscape of npm packages, GitHub repos, and CI/CD pipelines. Trails of stolen secrets (keys, tokens, passwords) float in its wake. Red and orange tones.

Right/bottom half (defense): A series of shield-like barriers — a cooldown timer, a locked vault (OIDC), a monitoring dashboard with alerts, an ignore-scripts toggle. Green and teal tones. The barriers are blocking the worm's path.

The diagonal split creates tension between attack and defense.

Style: Dark background, dramatic contrast between red/orange (attack) and green/teal (defense) halves. Abstract, modern, slightly organic feel for the worm. Clean geometric feel for the defenses. Suitable for security presentation.
```

---

### Prompt #10 — Part 6: Breaking the Chain (part-defense.png)

**Option A — Digital mesh / safety net**
> Abstract dark artistic background evoking digital protection and resilience. Interconnected geometric lattice of soft green glowing nodes and lines forming a protective mesh pattern, like a security fabric or safety net stretched across deep black space. Some nodes pulse brighter, suggesting active defenses. Faint hexagonal shapes and circuit traces fade into the dark edges. Very dark, moody, atmospheric. Emerald green and teal on near-black. No text, no people, no recognizable objects. Painterly, ethereal, cinematic. 16:9 aspect ratio.

**Option B — Ancient fortress with bioluminescence**
> Dark moody landscape of an ancient fortress wall overgrown with glowing bioluminescent vines, standing strong against a stormy sky. The wall has layers of different materials — stone, iron, living wood — suggesting defense in depth. Soft green and teal bioluminescence pierces through darkness. Atmospheric fog, cinematic lighting from below. Very dark, painterly, abstract. No text, no people. 16:9 aspect ratio.

**Option C — Layered shields of light**
> Dark abstract painting of layered shields of light, translucent green and teal veils overlapping in front of deep black void. Each layer slightly different texture — woven, crystalline, fluid — suggesting multiple defense strategies. Soft glow where layers intersect. Minimal, moody, atmospheric. Oil painting style, dark gallery aesthetic. No text, no objects. 16:9 aspect ratio.

---

## Excalidraw Diagram Ideas

For hand-drawn style diagrams that can be created in Excalidraw:

### Supply Chain Flow Diagram
- Boxes connected by arrows: Developer → Dependencies → Registry → CI/CD → Production
- Red "X" or skull on compromised component
- Arrows showing how compromise spreads downstream

### Transitive Dependencies Tree
- Tree structure starting from "Your App" at top
- Branches to direct dependencies (labeled)
- Further branches to transitive dependencies (many, unlabeled)
- Color coding: green (top), yellow (middle), red (deep transitive)

### Attack Pattern Matrix
- Grid with attacks on rows, patterns on columns
- Check marks or colored cells showing which attacks used which patterns
- Color legend for different pattern types

### OIDC vs PAT Comparison
- Two columns: "Long-lived PAT" vs "OIDC Token"
- Visual showing PAT as a permanent key that can be stolen
- Visual showing OIDC as temporary, scoped, auto-expiring
