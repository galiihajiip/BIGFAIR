# B1GFAIR Landing Page — Design Document

## Product Summary

**BIGFAIR / B1GFAIR** is Indonesia's national education festival and Gen-Z self-development event platform. It brings together seminars, talkshows, competitions, bazaar/UMKM, networking sessions, and inspirational speaker events across multiple cities. The platform provides event discovery, ticketing (e-ticket), order tracking, e-certificate, and attendee profiles.

## Landing Page Objective

Serve as the **front door** for BIGFAIR — introducing the brand, communicating value, showcasing upcoming events, and driving users toward event discovery and app download. This is a static landing page; no backend integration yet.

## Target Users

- University students (mahasiswa)
- Gen-Z (18–27)
- Young professionals
- Anyone seeking career growth, self-development, and networking experiences

## Design Principles

1. **Premium event festival feel** — not generic SaaS, not childish
2. **Clean and modern** — clear hierarchy, generous whitespace, polished cards
3. **Credible and understated** — no fake statistics, no AI slop, no emoji spam
4. **Responsive-first** — designed for desktop, tablet, and mobile
5. **Performance-conscious** — no external images, all visuals built with Flutter

## Color Palette

| Token            | Hex       | Usage                          |
|------------------|-----------|--------------------------------|
| primaryPurple    | `#6D28D9` | Primary brand, containers      |
| deepViolet       | `#2E1065` | Hero background, CTA panels    |
| electricPurple   | `#8B5CF6` | Accents, glows                 |
| lavenderMist     | `#F3E8FF` | Light section backgrounds      |
| eventGold        | `#F6C85F` | Secondary CTA, highlights      |
| magentaGlow      | `#D946EF` | Accent glow                    |
| inkBlack         | `#111014` | Footer background              |
| charcoal         | `#1F1B2E` | Dark sections, phone mockup    |
| cloudWhite       | `#FBFAFF` | Light text on dark backgrounds |
| mutedGray        | `#6B6675` | Body text, secondary labels    |
| borderLavender   | `#E9D5FF` | Card borders, dividers         |

Full M3 surface system tokens are defined in `app_colors.dart`.

## Typography

| Role       | Font              | Weight  | Sizes               |
|------------|-------------------|---------|----------------------|
| Display    | Sora              | 800     | 72px, 56px, 42px     |
| Headline   | Sora              | 700     | 40px, 32px, 24px     |
| Label      | Sora              | 600     | 14px                 |
| Body       | Plus Jakarta Sans | 400–500 | 18px, 16px, 14px     |

Maximum 2 font families. Loaded via `google_fonts` package.

## Sections

| # | Section             | Key Content                                    |
|---|---------------------|------------------------------------------------|
| 1 | LandingNavbar       | Logo, nav links, Masuk/Lihat Event buttons     |
| 2 | HeroSection         | Headline, subheadline, CTAs, phone mockup      |
| 3 | TrustStrip          | 4 stat items (Multi-kota, 10K+, etc.)          |
| 4 | FeaturedEvents      | 3 event cards (Surabaya, Bandung, Yogyakarta)  |
| 5 | BenefitsSection     | 5 benefit cards with icons                     |
| 6 | HowItWorksSection   | 5-step timeline (horizontal/vertical)          |
| 7 | CitiesSection       | 8 city chips with availability status          |
| 8 | AppPreviewSection   | 4 mini app screen cards                        |
| 9 | FaqSection          | 5 expandable FAQ items                         |
| 10| FinalCtaSection     | Deep violet CTA panel                          |
| 11| LandingFooter       | Logo, 4 link columns, copyright                |

## Reusable Components

- `ResponsiveContainer` — max-width wrapper with adaptive padding
- `SectionHeader` — title + optional subtitle
- `PrimaryButton` — filled/outlined/ghost variants, hover scale
- `GlassCard` — semi-transparent card with backdrop blur
- `HoverLift` — mouse hover translateY effect

## Responsive Behavior

| Breakpoint | Width       | Padding | Grid Cols |
|------------|-------------|---------|-----------|
| Mobile     | < 700px     | 20px    | 1         |
| Tablet     | 700–1024px  | 40px    | 2         |
| Desktop    | > 1024px    | 72px    | 3–4       |

Max content width: 1240px.

## Border Radius Tokens

- Buttons/chips: `999` (pill)
- Cards: `20–28`
- Large CTA panel: `32`
- Icon badges: `14`

## Accessibility Notes

- All interactive elements use `MouseRegion` with appropriate cursors
- Color contrast follows WCAG guidelines (light text on dark backgrounds)
- Semantic heading hierarchy maintained
- All text is selectable
- Expandable FAQ uses native `ExpansionTile` with built-in a11y

## Future Integration Notes

- CTA buttons currently use placeholder callbacks — will link to event pages and app store
- Navbar links can be wired to scroll-to-section or route navigation
- Event data is local mock — will be replaced by API calls
- Authentication (Masuk/Daftar) buttons are placeholders for login/register flows
- E-ticket and e-certificate features are described but not functional yet

## QA Checklist

- [x] `flutter analyze` — 0 issues
- [x] `flutter build web` — successful build
- [x] All 11 sections implemented
- [x] Responsive layout (mobile, tablet, desktop)
- [x] All text in Indonesian
- [x] No external image dependencies
- [x] No broken imports
- [x] No unused files
- [x] FAQ accordion expand/collapse works
- [x] Hover effects on event cards and city cards
- [x] Mobile navbar dropdown works
- [x] Phone mockup with floating chips renders correctly
- [x] Color palette matches brand specification
- [x] Typography uses Sora + Plus Jakarta Sans only
- [ ] Cross-browser testing (Chrome, Firefox, Safari)
- [ ] Performance profiling on lower-end devices
