# grandMA3 Command Panel

`grandma3-command-panel.lua` crea un pannello flottante con pulsanti per i
comandi più usati durante la programmazione o il live:

- `GO +` e `GO -`
- `CLEAR`
- selezione degli executor 1, 2 e 3
- attivazione e disattivazione del blackout
- chiusura del pannello

## Installazione

1. Copia `grandma3-command-panel.lua` nella cartella plugin di grandMA3.
2. In grandMA3 importa il file in uno slot del Plugin Pool.
3. Esegui lo slot del plugin.

Il plugin usa soltanto comandi locali grandMA3 tramite `Cmd`; non richiede
connessioni esterne o credenziali.

## Personalizzazione

I comandi sono definiti nella funzione `createPanel`. Per cambiare un pulsante,
modifica il secondo argomento di `addButton`:

```lua
addButton(root, "EXEC 10", "Goto Executor 10", {0.12, 0.30, 0.55, 1.0})
```

Il colore usa componenti RGBA normalizzate tra `0.0` e `1.0`.
