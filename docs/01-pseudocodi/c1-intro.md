# Classe 1: Introducció a la Programació i el Pseudocodi

## Objectius d'aprenentatge
- Comprendre què és un algorisme
- Entendre els principis de la programació estructurada
- Aprendre a utilitzar el pseudocodi com a eina de disseny
- Escriure el primer programa

---

## 1. Què és un algorisme?

!!! note "Definició"
    Un **algorisme** és una seqüència finita i ordenada de passos que resol un problema específic.

### Exemple quotidià: Fer un entrepà

```text
ALGORISME FerEntrapa
INICI
    1. Agafar dues llesques de pa
    2. Posar pernil a una llesca
    3. Posar formatge a l'altra llesca
    4. Ajuntar les dues llesques
    5. Servir l'entrepà
FI
```

### ✏️ Activitat 1: Escriu un algorisme (5 minuts)

Descriu en passos com **fer-te les dents**:

??? success "Solució possible"
    ```text
    ALGORISME RentarDents
    INICI
        1. Agafar el raspall de dents
        2. Posar pasta de dents al raspall
        3. Obrir l'aixeta
        4. Mullar el raspall
        5. Raspallar les dents durant 2 minuts
        6. Esbandir la boca amb aigua
        7. Esbandir el raspall
        8. Tancar l'aixeta
    FI
    ```

---

## 2. Programació Estructurada

!!! info "Característiques"
    La programació estructurada utilitza només tres estructures de control:
    
    - **Seqüència**: Instruccions que s'executen una darrere l'altra
    - **Selecció**: Decisions (IF-THEN-ELSE)
    - **Iteració**: Repeticions (FOR, WHILE)

---

## 3. El Pseudocodi

!!! tip "Per què pseudocodi?"
    El pseudocodi és un llenguatge intermedi entre el llenguatge natural i un llenguatge de programació. Ens permet:
    
    - Dissenyar algorismes sense preocupar-nos de la sintaxi
    - Centrar-nos en la lògica del problema
    - Facilitar la traducció a qualsevol llenguatge de programació

### Convencions del nostre pseudocodi

=== "Estructura bàsica"
    ```pseudocode
    ALGORISME NomAlgorisme
    VARIABLES
        // Declaració de variables
        
    INICI
        // Cos de l'algorisme
        
    FI
    ```

=== "Paraules clau"
    - `ALGORISME`: Inici de l'algorisme
    - `VARIABLES`: Secció de declaració
    - `INICI` / `FI`: Delimiten el cos principal
    - `ESCRIURE`: Mostra informació
    - `LLEGIR`: Captura dades de l'usuari

---

## 4. El primer programa: "Hola món"

```pseudocode
ALGORISME HolaMon
INICI
    ESCRIURE "Hola món!"
FI
```

### 🎯 Activitat 2: Programa de salutació personalitzat

Escriu un programa que mostri el teu nom i el curs:

??? success "Solució"
    ```pseudocode
    ALGORISME Presentacio
    INICI
        ESCRIURE "Hola, sóc [El teu nom]"
        ESCRIURE "Estic cursant Programació Estructurada"
        ESCRIURE "Curs 2024-2025"
    FI
    ```

---

## 💡 Exercicis de Classe

### Exercici 1: Algorisme de la vida diària
Escriu un algorisme per **preparar un cafè**. Ha de tenir almenys 6 passos.

### Exercici 2: Primer pseudocodi
Crea un algorisme en pseudocodi que mostri 3 missatges diferents sobre tu (aficions, ciutat, esport preferit).

### Exercici 3: Anàlisi
Llegeix aquest algorisme i explica què fa:

```pseudocode
ALGORISME Misteri
INICI
    ESCRIURE "Pensa un número de l'1 al 10"
    ESCRIURE "Multiplica'l per 2"
    ESCRIURE "Suma-li 8"
    ESCRIURE "Divideix-lo per 2"
    ESCRIURE "Resta'li el número original"
    ESCRIURE "El resultat és 4!"
FI
```

---

## 🏠 Deures

1. Escriu un algorisme per **anar de casa a l'institut** (mínim 8 passos)
2. Crea un programa en pseudocodi que mostri els dies de la setmana (un `ESCRIURE` per dia)
3. Busca 3 exemples d'algorismes en la teva vida quotidiana i escriu-los

---

## 📝 Resum de la classe

!!! summary "Conceptes clau"
    - ✅ Un algorisme és una seqüència de passos per resoldre un problema
    - ✅ La programació estructurada usa seqüència, selecció i iteració
    - ✅ El pseudocodi és una eina per dissenyar algorismes
    - ✅ Tot programa té una estructura bàsica: ALGORISME, INICI, FI

---

## 🤔 Autoavaluació

!!! question "Pregunta 1"
    Quina NO és una característica de la programació estructurada?
    
    a) Ús de seqüències  
    b) Ús de salts incondicionals (GOTO)  
    c) Ús de seleccions  
    d) Ús d'iteracions

??? success "Resposta"
    **b) Ús de salts incondicionals (GOTO)**  
    La programació estructurada evita els salts incondicionals.

!!! question "Pregunta 2"
    Quin és l'objectiu principal del pseudocodi?
    
    a) Escriure codi que el ordinador pugui executar directament  
    b) Dissenyar la lògica sense preocupar-nos de la sintaxi exacta  
    c) Substituir tots els llenguatges de programació  
    d) Fer el codi més difícil d'entendre

??? success "Resposta"
    **b) Dissenyar la lògica sense preocupar-nos de la sintaxi exacta**
