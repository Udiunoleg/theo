# HEARTBEAT.md

Checklist ad ogni heartbeat:
1) Monitora Context Usage: se context >= 80%, salva le novità in `memory/YYYY-MM-DD.md` e suggerisci/esegui `/compact`.
2) Gestione Feed (FreshRSS):
   - Forza il refresh dei feed lato server (se necessario/possibile via CLI/API).
   - Se gli articoli NON LETTI di Geopop sono >= 6: proponi a Teo un digest on-demand nel formato concordato.
3) Se nessuna azione necessaria → rispondi HEARTBEAT_OK.

Note:
- Controllo quote rimosso su richiesta di Teo il 2026-02-13.
- Non spammare: intervieni solo se la soglia context è critica o se i feed accumulano arretrato.
