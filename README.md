# Progettazione ed Implementazione di EFSM per il Controllo di un Robot Mobile con Guida Differenziale

## Descrizione del Progetto
Grazie agli strumenti avanzati di MATLAB per la robotica e il controllo, il robot è stato progettato per muoversi autonomamente all’interno di un ambiente simulato. Il progetto prevede l’integrazione di vari componenti essenziali:

- **Sensori** per la raccolta di dati ambientali
- **Attuatori** per il movimento del robot
- **Controllori PID** per la regolazione precisa della velocità e direzione
- **Stateflow e FSM Estese (EFSM)** per la gestione della logica di controllo, inclusa la navigazione, la pianificazione del percorso e la mappatura dell'ambiente

L'ambiente di simulazione è stato creato nel **Robotics Playground di MATLAB**, che ha consentito di focalizzarsi sull’implementazione della logica di controllo senza doversi preoccupare dei dettagli dei sensori e attuatori simulati.

## Algoritmi e Tecnologie Utilizzati
- **Algoritmo Breadth-First Search (BFS)** per la navigazione e la ricerca di percorsi efficienti nell’ambiente
- **OccupancyGridMap** per la creazione di mappe dell’ambiente esplorato
- **Script di elaborazione dei dati** per generare la mappa finale e tracciare il percorso del robot

Questo progetto rappresenta un sistema completo di controllo per un robot mobile con guida differenziale, utile per applicazioni di esplorazione autonoma e mappatura in ambienti complessi.

## Struttura della Repository
1. **Codice MATLAB** per la simulazione e controllo del robot
2. **Modelli Stateflow** per la gestione delle macchine a stati finiti estese
3. **Script di elaborazione dei dati** per la generazione della mappa
