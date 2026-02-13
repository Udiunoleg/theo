# HEARTBEAT.md

## Usage guardrails (OpenClaw internal quota)

Obiettivo: avvisare Teo **solo** quando la quota giornaliera supera (used >=) 50%, 90%, 100%.

Checklist ad ogni heartbeat:
1) Leggi lo stato con `session_status`.
2) Monitora Context Usage: se context >= 80%, salva le novità in `memory/YYYY-MM-DD.md` e suggerisci/esegui `/compact`.
3) Estrai la percentuale **Day ... left**.
   - Calcola `used = 100 - left`.
3) Leggi `memory/heartbeat-state.json` e controlla `usageAlerts.day.lastNotified`.
4) Se `used >= 50` e lastNotified < 50 → invia avviso e set lastNotified=50.
   Se `used >= 90` e lastNotified < 90 → avviso e set lastNotified=90.
   Se `used >= 100` e lastNotified < 100 → avviso e set lastNotified=100.
5) Se nessuna soglia nuova superata → rispondi HEARTBEAT_OK.

Formato avviso (breve):
- "Uso giornaliero OpenClaw: ~{used}% (resta {left}%). Soglia {threshold}% superata." 

Note:
- Queste sono quote interne OpenClaw, non billing provider.
- Non spammare: massimo un avviso per soglia.
