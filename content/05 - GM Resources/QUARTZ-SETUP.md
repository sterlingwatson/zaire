---
title: Quartz Publishing Setup
tags:
  - reference
  - meta
type: reference
---

# Publishing This Vault with Quartz

## Quick Start

1. Install Quartz v4: `npx quartz create`
2. Copy this vault's content into the Quartz `content/` directory
3. Configure `quartz.config.ts` (see below)
4. Build: `npx quartz build --serve`

## Recommended quartz.config.ts

```ts
const config: QuartzConfig = {
  configuration: {
    pageTitle: "Zaire Campaign Wiki",
    enableSPA: true,
    enablePopovers: true,
    locale: "en-US",
    baseUrl: "your-domain.github.io/daggerheart",
    ignorePatterns: [
      "99 - Archive",
      "00 - Templates",
      ".obsidian",
      "05 - GM Resources/PDFs",
      "06 - Media"
    ],
    theme: {
      typography: { header: "Schibsted Grotesk", body: "Source Sans Pro", code: "IBM Plex Mono" },
      colors: {
        lightMode: { light: "#faf8f8", lightgray: "#e5e5e5", gray: "#b8b8b8", darkgray: "#4e4e4e", dark: "#2b2b2b", secondary: "#7b4f9e", tertiary: "#b47fcc", highlight: "rgba(123,79,158,0.15)" },
        darkMode: { light: "#161618", lightgray: "#393639", gray: "#646464", darkgray: "#d4d4d4", dark: "#ebebec", secondary: "#b47fcc", tertiary: "#7b4f9e", highlight: "rgba(180,127,204,0.15)" },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({ priority: ["frontmatter", "filesystem"] }),
      Plugin.SyntaxHighlighting(),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({ enableSiteMap: true, enableRSS: true }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}
```

## Folder Mapping

| Vault Folder | Published As | Notes |
|---|---|---|
| 01 - Campaigns | `/campaigns/` | Session logs, adventures |
| 02 - Characters | `/characters/` | PCs and NPCs |
| 03 - World | `/world/` | Locations, lore, factions, gods, items |
| 05 - GM Resources | `/gm-resources/` | Only non-PDF content publishes |
| 00 - Templates | *ignored* | Not published |
| 99 - Archive | *ignored* | Not published |

## What to Exclude from Publishing

If you want certain content GM-only (not visible to players), add `draft: true` to that file's frontmatter. Quartz's `RemoveDrafts` filter will skip it.

## Wikilinks

This vault uses `[[wikilinks]]` throughout. Quartz handles these natively via `ObsidianFlavoredMarkdown` with `markdownLinkResolution: "shortest"`, which matches Obsidian's default behavior.
