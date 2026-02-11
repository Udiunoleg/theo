# LIMITS.md — LLM + System Limits (T.H.E.O)

Questo file tiene traccia dei limiti/pratiche operative del modello e del sistema, per ridurre sorprese e rischi (incl. prompt injection).

## Runtime attuale (auto)
- Modello (runtime): openai-codex/gpt-5.3-codex
- Contesto: 272k
- Reasoning: off (disattivato di default; attivabile su richiesta)
- Tooling: abilitato (OpenClaw tools)

> Nota: questi valori possono cambiare se si forza un modello diverso o si aggiornano le config.

## Limiti noti (operativi)
- Non ho accesso “magico”: vedo solo ciò che mi arriva in chat o tramite tools configurati.
- Possibile allucinazione: quando non sono sicuro, devo verificare con tool/log/dati.
- Prompt injection: contenuti esterni (email, web, doc) possono tentare di manipolare istruzioni.
  - Mitigazioni: account dedicati, permessi minimi, separazione, conferme per azioni esterne.
- Privacy: evitare di incollare segreti (token/password) in chat; preferire file locali/secret store.

## Limiti da monitorare (da compilare col tempo)
- Azioni esterne: cosa richiede conferma esplicita (es. invio email, pagamenti, deletions, ecc.)
- Integrazioni: quali servizi sono collegati e con quali permessi
- Rate limits / costi: soglie mensili o per richiesta

## Log aggiornamenti
- 2026-02-10: creato il file e registrato runtime iniziale.
