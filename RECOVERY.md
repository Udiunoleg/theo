# RECOVERY.md — Ripristino T.H.E.O da zero (server crash/incidente)

Checklist pratica per reinstallare OpenClaw + workspace + integrazioni.

---

## 0) Prerequisiti

- Nuovo server Linux (Debian/Ubuntu consigliato)
- Accesso SSH
- Repo backup: `git@github.com:Udiunoleg/theo.git`
- Credenziali disponibili (Telegram, Brave, Notion, Google)

---

## 1) Setup base server

```bash
sudo apt update && sudo apt install -y git curl ca-certificates
```

Installa Node/pnpm secondo la doc OpenClaw (versione LTS raccomandata).

Verifica:

```bash
node -v
pnpm -v
```

---

## 2) Installa OpenClaw

Installa OpenClaw CLI/Gateway secondo doc ufficiale.

Verifica:

```bash
openclaw --version
openclaw help
```

---

## 3) Ripristina workspace dal backup Git

```bash
mkdir -p ~/.openclaw
cd ~/.openclaw
git clone git@github.com:Udiunoleg/theo.git workspace
```

Controlla file chiave:

```bash
ls -la ~/.openclaw/workspace
```

Devono esserci almeno: `AGENTS.md`, `SOUL.md`, `USER.md`, `HEARTBEAT.md`, `MEMORY.md`, `memory/`.

---

## 4) Ripristina chiavi SSH per push Git automatici (deploy key)

Copia sul server la chiave privata usata per la repo (`~/.ssh/theo_repo`) + public key.

Permessi:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/theo_repo
chmod 644 ~/.ssh/theo_repo.pub
```

Config SSH:

```bash
cat >> ~/.ssh/config <<'EOF'
Host github-theo
  HostName github.com
  User git
  IdentityFile ~/.ssh/theo_repo
  IdentitiesOnly yes
EOF
chmod 600 ~/.ssh/config
```

Test:

```bash
ssh -T -o StrictHostKeyChecking=accept-new git@github-theo
```

(È normale vedere: authenticated, no shell access.)

---

## 5) Configura OpenClaw (wizard rapido)

```bash
openclaw configure --section gateway --section channels --section web --section skills
```

Imposta almeno:
- Telegram bot token
- Brave web search key
- Skill config (Notion, ecc.)

---

## 6) Ripristina integrazioni principali

## 6.1 Brave (news briefing)
- Verifica che `BRAVE_API_KEY` sia configurata in OpenClaw
- Test:
```bash
openclaw status
```
(oppure test ricerca dalla chat)

## 6.2 Notion
- Reimposta token integrazione (`skills.entries.notion.apiKey`) se mancante
- Verifica che la connection Notion abbia accesso al workspace
- Test: crea una pagina di prova via chat

## 6.3 Google (gog)
Ripristina file locali (se disponibili):
- `~/.config/gogcli/credentials.json`
- token/keyring gog

Se necessario, rifai auth:
```bash
gog auth add theo.udiunoleg@gmail.com --services gmail,calendar,drive,docs,contacts,tasks,sheets --manual
```

Nota: per uso non interattivo serve anche `GOG_KEYRING_PASSWORD` nell’ambiente.

---

## 7) Avvio e verifica finale

```bash
openclaw gateway restart
openclaw status
```

Checklist test:
- [ ] Risposta Telegram ok
- [ ] Briefing news ok
- [ ] Notion create/update ok
- [ ] Calendar read/create ok
- [ ] Gmail read/trash ok

---

## 8) Cron importanti da verificare

Controlla che i job siano presenti/attivi:
- `La Prima di T.H.E.O` (9:30 Europe/Rome)
- reminder CrossFit domenicale

Se necessario:
```bash
openclaw cron list
```

---

## 9) Post-recovery consigliato

- Esegui un commit “recovery check” sul workspace
- Verifica ultimi 2-3 heartbeat senza errori
- Verifica che le policy personalizzate siano rispettate (Netflix rule, stile briefing, Notion styling)

---

## Note operative (Teo)

- Preferire sempre account dedicati T.H.E.O per integrazioni
- Backup workspace su Git privato già attivo
- Notion: applicare sempre icona + cover alle nuove pagine
