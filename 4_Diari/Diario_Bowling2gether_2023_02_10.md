# Bowling2gether | Diario di lavoro
#### Lorenzo Spadea, Luca Lorenzon, Tommaso Castello
### Trevano, 03 02 2023

## Lavori svolti

### Lorenzo Spadea

|Orario        |Lavoro                                         |
|--------------|-----------------------------------------------|
|08:20 - 09:05 | Meeting                         
|09.05 - 09:50 | Creazione DB                                
|10:05 - 10:50 | Creazione environment                               
|10:50 - 11:35 | Folder tree                      
|13:15 - 14:00 | Implementazione Routes                             
|14:00 - 14:45 | Implementazione Routes                              
|15:00 - 15:45 | Implementazione Routes                          
|15:45 - 16:30 | Implementazione Routes                         


### Luca Lorenzon

|Orario        |Lavoro                                         |
|--------------|-----------------------------------------------| 
|08:20 - 09:05 | Meeting                        
|09.05 - 09:50 | Ricerca modelli 3d                                  
|10:05 - 10:50 | Implementazione gioco                  
|10:50 - 11:35 | Implementazione gioco                             
|13:15 - 14:00 | Implementazione gioco                              
|14:00 - 14:45 | Implementazione gioco                       
|15:00 - 15:45 | Implementazione gioco                          
|15:45 - 16:30 | Diario              

### Tommaso Castello

|Orario        |Lavoro                                         |
|--------------|-----------------------------------------------| 
|08:20 - 09:05 | Meeting                                   
|09.05 - 09:50 | Problema proxy                                  
|10:05 - 10:50 | Problema proxy                      
|10:50 - 11:35 | Problema proxy             
|13:15 - 14:00 | Implementazione (ottenere dati giroscopio)                            
|14:00 - 14:45 | Implementazione (ottenere dati giroscopio)                         
|15:00 - 15:45 | Implementazione (ottenere dati giroscopio)                           
|15:45 - 16:30 | Implementazione (ottenere dati giroscopio)                         


##  Problemi riscontrati e soluzioni adottate
Problema proxy (Tommaso): Flutter Doctor da un problema nella sezione HTTP host availability

Soluzione proxy: Impostare le seguenti variabili d'ambiente:
https_proxy=http://localhost:5865

http_proxy=http://localhost:5865

NO_PROXY=localhost;127.0.0.1;LOCALHOST;::1;localhost,127.0.0.1

L'ultima variabile é divisa con la virgola perché il gradle usa la virgola come separatore, pur essendo su windows dove il separatore é il punto e virgola
## Punto della situazione rispetto alla pianificazione
Siamo in orario rispetto al Gantt, nella fase di implementazione

## Programma di massima per la prossima giornata di lavoro
- Lorenzo: Continuo implementazione
- Luca: Continuo implementazione e apprendimento Panda3D
- Tommaso: Continuo implementazione manipolazione dati giroscopio e velocimetro
