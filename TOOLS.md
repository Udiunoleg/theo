# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

### SSH

- Accesso UI OpenClaw via tunnel (server dietro Tailscale):
  `ssh -N -L 18789:127.0.0.1:18789 moltbot@100.90.22.124`
  Poi aprire: `http://127.0.0.1:18789`

### GOG (Google Workspace)

- Keyring password: `1Latooscuro!`
- Account principale: `lordfener92@gmail.com`

---

Add whatever helps you do your job. This is your cheat sheet.
