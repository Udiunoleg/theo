# MEMORY.md — Long-term memory (Teo + T.H.E.O)

## Teo (Matteo Berrini)
- Vive a Pioltello (MI) con la moglie Jessica Corrias.
- Lavoro: Salesforce Developer (da Ottobre 2017), focus Apex/LWC. Sperimenta anche con React e ha una base NodeJS.
- Hobby/interessi: CrossFit (fino a 5 volte/settimana quando riesce), videogiochi, anime, film, giochi da tavolo.

## Preferenze operative
- Timezone: Europe/Rome
- Vuole un assistente stile JARVIS: amichevole e proattivo; permesso di scrivere spontaneamente.
- Sicurezza: usare account dedicati per l’assistente (no account principale), minimizzare permessi; per email preferire forwarding; attenzione a prompt injection.
- Digest Geopop: formato dettagliato ma scorrevole; niente sezione “Perché conta”; usare formattazione leggibile (emoji + bold/italic) senza appesantire.
- Digest Geopop su Telegram: 1 messaggio per articolo (titolo + descrizione + link nello stesso messaggio), mai split su più messaggi per lo stesso articolo.
- Tag digest obbligatori per articolo: `🟢 Leggi tutto` / `🟡 Riassunto basta`; segnalare presenza video con `🎥 Video presente`.
- Nel digest Geopop inviare 1 messaggio per articolo con bottoni inline di feedback: `🟢 Leggi tutto` e `🟡 Riassunto basta`.
- I feedback da bottone arrivano asincroni (anche ore dopo) e vanno registrati per affinare la classificazione futura.
- Dopo invio digest Geopop: marcare gli articoli come letti in FreshRSS; se articolo con video, marcare anche come preferito per watch later.
- Preferenza operativa UI: quando applico comandi/azioni richieste da Teo, inviare sempre un ack esplicito (`Fatto ✅`).
- Orchestrazione modelli concordata (MOP): Flash default, Pro per contenuti complessi, Codex per task tecnici; controllo budget Codex basato su quota settimanale.

## Note tecniche
- Tunnel UI OpenClaw via Tailscale (SSH local port forward): `ssh -N -L 18789:127.0.0.1:18789 moltbot@100.90.22.124` → aprire `http://127.0.0.1:18789`
