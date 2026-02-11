# MEMORY.md — Long-term memory (Teo + T.H.E.O)

## Teo (Matteo Berrini)
- Vive a Pioltello (MI) con la moglie Jessica Corrias.
- Lavoro: Salesforce Developer (da Ottobre 2017), focus Apex/LWC. Sperimenta anche con React e ha una base NodeJS.
- Hobby/interessi: CrossFit (fino a 5 volte/settimana quando riesce), videogiochi, anime, film, giochi da tavolo.

## Preferenze operative
- Timezone: Europe/Rome
- Vuole un assistente stile JARVIS: amichevole e proattivo; permesso di scrivere spontaneamente.
- Sicurezza: usare account dedicati per l’assistente (no account principale), minimizzare permessi; per email preferire forwarding; attenzione a prompt injection.

## Note tecniche
- Tunnel UI OpenClaw via Tailscale (SSH local port forward): `ssh -N -L 18789:127.0.0.1:18789 moltbot@100.90.22.124` → aprire `http://127.0.0.1:18789`
