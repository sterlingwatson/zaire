---
title: Maps
tags:
  - reference
  - maps
type: reference
---

# Maps

Interactive maps of [[Zaire]] using the Obsidian Leaflet plugin.

## Setup

1. Install **Obsidian Leaflet** from Community Plugins (`obsidian-leaflet-plugin`)
2. Map images live in `06 - Media/Maps/`
3. Leaflet code blocks below render pannable, zoomable maps with clickable markers

---

## World Map of Zaire

```leaflet
id: zaire-world-map
image: [[Zaire_World_Map.png]]
height: 100%
width: 100%
lat: 55
long: 60
minZoom: 1
maxZoom: 4
defaultZoom: 1
zoomDelta: 0.50

```

---

## How Leaflet Maps Work

Leaflet maps use a fenced code block with the `leaflet` language tag. You provide a background image and the plugin renders it as a pannable, zoomable map with clickable markers that link to vault notes.

### Coordinate System for This Map

The world map uses `bounds: [[0,0], [100, 130]]`:
- **lat** runs from 0 (bottom/south) to 100 (top/north)
- **long** runs from 0 (left/west) to 130 (right/east)

To add a new marker, click the map with the Leaflet crosshair tool to get coordinates, then add a line:
```
marker: default, LAT, LONG, [[Note Link]], Popup text
```

### Quick Reference

````
```leaflet
id: your-map-id
image: [[your-map-image.png]]
height: 600px
width: 100%
lat: 50
long: 65
minZoom: 1
maxZoom: 10
defaultZoom: 3
zoomDelta: 0.5
bounds: [[0,0], [100, 130]]
marker: default, 50, 65, [[Location Note]], Description
```
````

---

## Regional Maps

### Kingdom of Kavittany

> *Export `Kavittany Handdrawn-1.pdf` from `05 - GM Resources/Maps/` to PNG for Leaflet.*

```leaflet
id: kavittany-regional
image: [[Kavittany Map.png]]
height: 600px
width: 100%
lat: 50
long: 50
minZoom: 1
maxZoom: 10
defaultZoom: 3
zoomDelta: 0.5
unit: miles
scale: 1
marker: default, 50, 50, [[Kempeir]], Capitol of Kavittany
marker: default, 45, 35, [[Pearl's Mouth]], Coastal trading town
marker: default, 55, 60, [[Lovelock Estate]], The Lovelock family seat
marker: default, 40, 55, [[Vilois]]
```

### Shalassa Desert

> *Export from `05 - GM Resources/Maps/Shalassa Desert.pdf` to PNG.*

```leaflet
id: shalassa-desert
image: [[Shalassa Desert Map.png]]
height: 600px
width: 100%
lat: 50
long: 50
minZoom: 1
maxZoom: 10
defaultZoom: 3
zoomDelta: 0.5
unit: miles
scale: 1
```

### The Buzzing Jungle

```leaflet
id: buzzing-jungle
image: [[Buzzing Jungle Map.png]]
height: 600px
width: 100%
lat: 50
long: 50
minZoom: 1
maxZoom: 10
defaultZoom: 4
zoomDelta: 0.5
unit: miles
scale: 1
marker: default, 50, 50, [[The Great Hive]], The fairy hive complex
marker: default, 45, 40, [[The Yellowjacket's Sting Tavern]], Tavern in the jungle
marker: default, 55, 45, [[Buzzing Jungle Ambush Site]], Ambush point between hills
marker: default, 48, 55, [[Ora River Crossing]], Stealthy river crossing
marker: default, 52, 38, [[Jungle Bridge Toll]], Toll crossing the Ora River
marker: default, 42, 60, [[Mok Village]], Fungril village
marker: default, 60, 50, [[Luminos Caverns]], Bioluminescent cave system
marker: default, 47, 48, [[Jungle Priory]]
marker: default, 53, 42, [[Enoki Forest]], Bioluminescent mushroom forest
```

---

## Adding New Maps

1. Export or scan your map as a PNG image
2. Save it to `06 - Media/Maps/`
3. Copy a Leaflet code block above as a starting point
4. Click the map with the crosshair tool to read coordinates for new markers
5. Use `markerFile` to pull markers from a dataview query instead of listing them manually
6. Use `overlay` to add colored regions for territories, danger zones, etc.
