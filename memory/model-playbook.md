# Model Orchestration Playbook (MOP)

## Obiettivo
Orchestrare Flash / Pro / Codex per massimizzare velocità e qualità, riducendo il consumo di quota Codex.

## Router base
1. **Gemini 3 Flash (default)**
   - Chat rapide, triage, classificazione, task ripetitivi a basso rischio.
2. **Gemini 3 Pro**
   - Contenuti complessi, digest/riassunti strutturati, output editoriali.
3. **Codex**
   - Task tecnici/operativi: shell, file/config, debug, automazioni.

## Regola di instradamento
- Parti da **Flash**.
- Escala a **Pro** per qualità contenutistica.
- Escala a **Codex** solo per esecuzione tecnica o criticità operativa.
- Finito il task tecnico, torna a **Flash**.

## Guardrail Codex (quota settimanale)
- **> 40%**: uso normale (technical-first).
- **<= 40%**: warning, ridurre uso Codex.
- **<= 25%**: modalità conservativa (Codex solo task importanti).
- **<= 15%**: Codex solo task critici/bloccanti.

## Override manuale Teo
- Teo può forzare manualmente il modello in qualsiasi momento.
- Override manuale ha priorità immediata.
- Se non specificato "fino a nuovo ordine", vale per il blocco/task corrente.

## Comando operativo
- `/mop` apre il pannello quick switch con bottoni:
  - ⚡ Flash
  - 🧠 Pro
  - 🛠️ Codex
  - 🔁 MOP (auto)

## UX / conferme
- Dopo ogni switch o azione richiesta, inviare ack esplicito: **"Fatto ✅"**.
