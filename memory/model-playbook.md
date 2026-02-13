# Model Orchestration Playbook (MOP)

## Obiettivo
Orchestrare i modelli per massimizzare velocità, qualità e risparmio quota Plus, alternando tra Albero Primario e Secondario.

## 🌳 Alberi Modelli (Definitivi 2026-02-13)

### 1. Albero Primario (Standard - Plus)
*Utilizzo consigliato per task tecnici, scrittura codice e precisione massima.*
- **Default:** `gpt-5.1-codex-mini` (OAuth Plus)
- **Fallback 1:** `gpt-5.3-codex` (OAuth Plus)
- **Fallback 2:** `gemini-3-flash` (OAuth Google)

### 2. Albero Secondario (Risparmio - Gemini)
*Utilizzo consigliato quando la quota Plus è bassa o per task generici.*
- **Default:** `gemini-3-flash` (OAuth Google)
- **Fallback:** `gemini-3-pro` (OAuth Google)

## Regole di Instradamento
- **Reportistica (La Prima / Digest):** Usano esplicitamente `Gemini 3 Pro` (OAuth) per la massima qualità editoriale.
- **Chat Standard:** Segue l'albero attualmente attivo (Primario o Secondario).
- **Sub-agents:** Usano il default dell'albero attivo, salvo task tecnici complessi dove scalano su `gpt-5.3-codex`.

## Override manuale Teo
- Teo può forzare lo switch tra Albero Primario e Secondario in ogni momento.
- Override manuale ha priorità immediata.

## UX / conferme
- Dopo ogni switch o azione richiesta, inviare ack esplicito: **"Fatto ✅"**.
