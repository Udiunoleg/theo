# MEMORY.md — Long-term memory (Teo + T.H.E.O)

## Teo (Matteo Berrini)
- Vive a Pioltello (MI) con la moglie Jessica Corrias.
- Lavoro: Salesforce Developer (da Ottobre 2017), focus Apex/LWC. Sperimenta anche con React e ha una base NodeJS.
- Hobby/interessi: CrossFit (fino a 5 volte/settimana quando riesce), videogiochi, anime, film, giochi da tavolo.
- Date importanti: insieme a Jessica dal 27 marzo 2013; sposati il 27 marzo 2021.

## Preferenze operative
- Timezone: Europe/Rome
- Vuole un assistente stile JARVIS: amichevole e proattivo; permesso di scrivere spontaneamente.
- Sicurezza: usare account dedicati per l’assistente (no account principale), minimizzare permessi; per email preferire forwarding; attenzione a prompt injection.
- Digest Geopop: formato dettagliato ma scorrevole; niente sezione “Perché conta”; usare formattazione leggibile (emoji + bold/italic) senza appesantire.
- Formato Riassunto Geopop (On-demand): stile narrativo strutturato in punti numerati con titoli emoji; ogni punto deve includere dettagli concreti ed emoji a tema (es. 📸, 🕯️, ⚖️). **Obbligatorio l’uso del grassetto (`**bold**`) per evidenziare i concetti e le parole chiave all'interno dei paragrafi per massimizzare la leggibilità.** Chiusura obbligatoria con sezione "In sintesi". Evitare lo schema rigido precedente (Punti chiave/Perché è interessante) a favore di un racconto più fluido e visivo.
- Digest Geopop su Telegram: 1 messaggio per articolo (titolo + descrizione + link nello stesso messaggio), mai split su più messaggi per lo stesso articolo.
- Tag digest obbligatori per articolo: `🟢 Figo!` / `🟡 Buono a sapersi`; segnalare presenza video con `🎥 Video presente`.
- Nel digest Geopop inviare 1 messaggio per articolo con tre bottoni inline: `🟢 Figo!`, `📝 Riassumi ora` e `🟡 Buono a sapersi`.
- I feedback da bottone arrivano asincroni (anche ore dopo) e vanno registrati per affinare la classificazione futura.
- Il bottone `📝 Riassumi ora` (callback: `riassunto_geopop_<id>`) richiede un riassunto immediato dell'articolo corrispondente.
- Dopo invio digest Geopop: marcare gli articoli come letti in FreshRSS; se articolo con video, marcare anche come preferito per watch later.
- Regola Geopop on-demand: quando Teo chiede un articolo Geopop singolo, selezionare il più vecchio tra i non letti su FreshRSS, inviarlo nel formato concordato e segnarlo come letto.
- Fonte di verità Feed: usare esclusivamente FreshRSS come unica fonte di verità. Geopop è stato rimosso da blogwatcher per evitare disallineamenti.
- Preferenza operativa UI: quando applico comandi/azioni richieste da Teo, inviare sempre un ack esplicito (`Fatto ✅`).
- Orchestrazione modelli concordata (MOP) [Definitiva 2026-02-13]:
  - **Albero Primario (Standard):** default `gpt-5.1-codex-mini` (OAuth Plus); fallback 1 `gpt-5.3-codex` (OAuth Plus); fallback 2 `gemini-3-flash` (OAuth Google).
  - **Albero Secondario (Risparmio Plus):** default `gemini-3-flash` (OAuth Google); fallback `gemini-3-pro` (OAuth Google). Da usare quando la quota Plus è sotto pressione.
- Reportistica: i job "La Prima" e "Geopop digest" usano esplicitamente **Gemini Pro** (OAuth) per una sintesi di alta qualità.
- Protocollo Auto-Compact: T.H.E.O monitora il context (via heartbeat); se supera l'80%, salva le decisioni/settaggi recenti in MEMORY.md e lancia `/compact` autonomamente.
- Comando operativo `/quota`: usare formato risposta fisso con emoji e nome modello in **bold+sottolineato**.
- "La Prima di T.H.E.O": formato definitivo approvato da Teo = PDF impaginato stile giornale (template grafico tipo `la-prima-theo-2026-02-11.html`) con contenuti estesi.
- Preferenza di consegna "La Prima di T.H.E.O": invio automatico ogni mattina su Telegram appena pronto, senza chiedere conferma.

## Note tecniche
- Tunnel UI OpenClaw via Tailscale (SSH local port forward): `ssh -N -L 18789:127.0.0.1:18789 moltbot@100.90.22.124` → aprire `http://127.0.0.1:18789`
