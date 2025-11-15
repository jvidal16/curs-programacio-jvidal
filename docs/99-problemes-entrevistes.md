# Problemes d'Entrevistes de Programació - Nivell Principiant

!!! info "Informació del document"
    **Nivell**: Principiant (6 mesos d'experiència)  
    **Temps estimat**: 8 setmanes de pràctica  
    **Enfocament**: Arrays, Strings, Bucles i Lògica Bàsica

---

## 🎯 Introducció

Aquesta llista conté **25 problemes essencials** per a estudiants amb aproximadament 6 mesos d'experiència en programació. Tots els problemes estan seleccionats de plataformes reconegudes i inclouen enllaços directes i solucions publicades.

!!! tip "Consell d'estudi"
    No miris la solució immediatament! Prova de resoldre cada problema durant 20-30 minuts abans de consultar la resposta.

---

## 🔢 Arrays Bàsics

### 1. Remove Duplicates from Sorted Array

!!! question "Enunciat"
    Donada una array ordenada, elimina els duplicats "in-place" i retorna la nova longitud.

**Exemple:**
```python
Input: [1,1,2,2,3]
Output: [1,2,3] (longitud = 3)
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/remove-duplicates-from-sorted-array/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa dos índexs (pointers): un per recórrer l'array i un altre per marcar la posició dels elements únics.

=== "Conceptes clau"
    - Two pointers
    - In-place modification
    - Arrays ordenats

---

### 2. Move Zeroes

!!! question "Enunciat"
    Mou tots els zeros al final de l'array mantenint l'ordre dels altres elements.

**Exemple:**
```python
Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/move-zeroes/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Mantén un índex per a la posició dels elements no-zero. Recorre l'array i intercanvia elements.

=== "Conceptes clau"
    - Two pointers
    - Array manipulation
    - In-place operations

---

### 3. Find Numbers with Even Number of Digits

!!! question "Enunciat"
    Compta quants nombres en una array tenen un nombre parell de dígits.

**Exemple:**
```python
Input: [12,345,2,6,7896]
Output: 2  # 12 té 2 dígits, 7896 té 4 dígits
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/find-numbers-with-even-number-of-digits/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Converteix cada nombre a string i comprova si la longitud és parell.

=== "Conceptes clau"
    - Conversió de tipus
    - Bucles
    - Comptadors

---

### 4. Squares of a Sorted Array

!!! question "Enunciat"
    Donada una array ordenada d'enters, retorna una array dels seus quadrats, també ordenada.

**Exemple:**
```python
Input: [-4,-1,0,3,10]
Output: [0,1,9,16,100]
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/squares-of-a-sorted-array/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Solució simple: eleva cada element al quadrat i ordena. Solució òptima: usa two pointers.

=== "Conceptes clau"
    - Operacions matemàtiques
    - Ordenació
    - Two pointers (solució avançada)

---

### 5. Contains Duplicate

!!! question "Enunciat"
    Retorna `true` si hi ha algun duplicat en l'array.

**Exemple:**
```python
Input: [1,2,3,1]
Output: true
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/contains-duplicate/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa un Set (conjunt) per guardar elements vistos, o ordena l'array primer.

=== "Conceptes clau"
    - HashSet/Set
    - Ordenació
    - Cerca lineal

---

### 6. Maximum Subarray

!!! question "Enunciat"
    Troba la suma més gran possible d'una subarray consecutiva.

**Exemple:**
```python
Input: [-2,1,-3,4,-1,2,1,-5,4]
Output: 6  # Subarray: [4,-1,2,1]
```

=== "Informació"
    - **Dificultat**: :orange_circle: Fàcil-Mitjana
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/maximum-subarray/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Algoritme de Kadane: mantén la suma màxima actual i la suma màxima global.

=== "Conceptes clau"
    - Dynamic Programming (introducció)
    - Algoritme de Kadane
    - Subarrays

---

### 7. Third Maximum Number

!!! question "Enunciat"
    Troba el tercer nombre més gran en una array. Si no existeix, retorna el màxim.

**Exemple:**
```python
Input: [3,2,1]
Output: 1
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/third-maximum-number/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Mantén tres variables per als tres nombres més grans mentre recorres l'array.

=== "Conceptes clau"
    - Variables de seguiment
    - Comparacions
    - Edge cases

---

## 📝 Strings Bàsics

### 8. Reverse String

!!! question "Enunciat"
    Inverteix una cadena de caràcters.

**Exemple:**
```python
Input: ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/reverse-string/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa dos pointers: un a l'inici i un al final. Intercanvia i mou els pointers cap al centre.

=== "Conceptes clau"
    - Two pointers
    - String manipulation
    - In-place modification

---

### 9. Reverse Integer

!!! question "Enunciat"
    Inverteix els dígits d'un nombre enter.

**Exemple:**
```python
Input: 123
Output: 321

Input: -123
Output: -321
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/reverse-integer/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa operacions de mòdul (%) i divisió entera (//) per extreure dígits.

=== "Conceptes clau"
    - Operacions matemàtiques
    - Mòdul i divisió
    - Overflow handling

---

### 10. Valid Palindrome

!!! question "Enunciat"
    Determina si una cadena és un palíndrom (ignorant majúscules i caràcters especials).

**Exemple:**
```python
Input: "A man, a plan, a canal: Panama"
Output: true
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/valid-palindrome/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Neteja la string primer (només alfanumèrics, lowercase) i usa two pointers.

=== "Conceptes clau"
    - String processing
    - Two pointers
    - Character validation

---

### 11. Valid Anagram

!!! question "Enunciat"
    Comprova si dues cadenes són anagrames.

**Exemple:**
```python
Input: s = "anagram", t = "nagaram"
Output: true
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/valid-anagram/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Ordena ambdues strings i compara, o usa un HashMap per comptar freqüències.

=== "Conceptes clau"
    - Ordenació
    - HashMap/Dictionary
    - Comptatge de freqüències

---

### 12. First Unique Character in a String

!!! question "Enunciat"
    Troba l'índex del primer caràcter que només apareix una vegada.

**Exemple:**
```python
Input: "leetcode"
Output: 0  # La 'l' és el primer caràcter únic
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/first-unique-character-in-a-string/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Primer passa: compta freqüències. Segona passa: troba el primer amb freqüència 1.

=== "Conceptes clau"
    - HashMap
    - Dos passades
    - Comptatge de freqüències

---

### 13. Fizz Buzz

!!! question "Enunciat"
    Retorna array de strings de l'1 al n:
    
    - "Fizz" si múltiple de 3
    - "Buzz" si múltiple de 5
    - "FizzBuzz" si múltiple de 3 i 5
    - El número com string en altres casos

**Exemple:**
```python
Input: n = 5
Output: ["1","2","Fizz","4","Buzz"]
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/fizz-buzz/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa condicionals per comprovar divisibilitat. Atenció a l'ordre: comprova 15 abans de 3 i 5.

=== "Conceptes clau"
    - Condicionals
    - Mòdul
    - Bucles

---

### 14. Reverse Words in a String III

!!! question "Enunciat"
    Inverteix cada paraula en una frase però manté l'ordre de les paraules.

**Exemple:**
```python
Input: "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/reverse-words-in-a-string-iii/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Divideix la string en paraules, inverteix cada paraula, i torna a ajuntar.

=== "Conceptes clau"
    - String split/join
    - String reversal
    - Arrays de strings

---

## 🔄 Bucles i Lògica Bàsica

### 15. Palindrome Number

!!! question "Enunciat"
    Determina si un nombre enter és palíndrom (sense convertir a string).

**Exemple:**
```python
Input: 121
Output: true

Input: -121
Output: false
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/palindrome-number/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Inverteix el número matemàticament (sense string) i compara.

=== "Conceptes clau"
    - Operacions matemàtiques
    - Bucles
    - Edge cases (negatius)

---

### 16. Plus One

!!! question "Enunciat"
    Donada una array que representa un nombre (cada element és un dígit), suma 1.

**Exemple:**
```python
Input: [1,2,3]
Output: [1,2,4]

Input: [9,9]
Output: [1,0,0]
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/plus-one/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Comença pel final. Si el dígit és 9, posa'l a 0 i continua (carry). Sinó, suma 1 i retorna.

=== "Conceptes clau"
    - Carry en suma
    - Bucles inversos
    - Edge cases

---

### 17. Single Number

!!! question "Enunciat"
    En una array on cada element apareix dues vegades excepte un, troba l'element únic.

**Exemple:**
```python
Input: [2,2,1]
Output: 1
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/single-number/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa l'operació XOR (^). La propietat clau: a ^ a = 0, i a ^ 0 = a.

=== "Conceptes clau"
    - Bit manipulation
    - XOR operation
    - Propietats matemàtiques

---

### 18. Missing Number

!!! question "Enunciat"
    Donada una array amb n nombres de 0 a n, troba el nombre que falta.

**Exemple:**
```python
Input: [3,0,1]
Output: 2
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/missing-number/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Suma esperada (0+1+2+...+n) menys la suma actual = nombre que falta.

=== "Conceptes clau"
    - Fórmula de Gauss
    - Suma d'arrays
    - Propietats matemàtiques

---

### 19. Majority Element

!!! question "Enunciat"
    Troba l'element que apareix més de n/2 vegades en una array.

**Exemple:**
```python
Input: [3,2,3]
Output: 3
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/majority-element/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Solució simple: ordena i agafa l'element del mig. Solució òptima: Boyer-Moore Voting Algorithm.

=== "Conceptes clau"
    - Ordenació
    - HashMap
    - Boyer-Moore algorithm

---

### 20. Add Binary

!!! question "Enunciat"
    Suma dos nombres binaris (representats com strings).

**Exemple:**
```python
Input: a = "11", b = "1"
Output: "100"
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/add-binary/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Recorre des del final, suma bit a bit amb carry, com la suma manual.

=== "Conceptes clau"
    - String manipulation
    - Carry en suma
    - Bucles

---

## 🔍 Cerca i Comparació Simple

### 21. Search Insert Position

!!! question "Enunciat"
    Troba la posició on s'hauria d'inserir un valor en una array ordenada.

**Exemple:**
```python
Input: nums = [1,3,5,6], target = 5
Output: 2
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/search-insert-position/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Cerca binària simple. Si no el trobes, `left` serà la posició d'inserció.

=== "Conceptes clau"
    - Binary Search
    - Arrays ordenats
    - Índexs

---

### 22. Two Sum

!!! question "Enunciat"
    Troba dos índexs que sumen un valor objectiu.

**Exemple:**
```python
Input: nums = [2,7,11,15], target = 9
Output: [0,1]  # nums[0] + nums[1] = 2 + 7 = 9
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/two-sum/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa un HashMap. Per cada element, comprova si (target - element) ja està al mapa.

=== "Conceptes clau"
    - HashMap/Dictionary
    - Complement search
    - O(n) time complexity

---

### 23. Best Time to Buy and Sell Stock

!!! question "Enunciat"
    Troba el màxim benefici comprant i venent una acció una vegada.

**Exemple:**
```python
Input: [7,1,5,3,6,4]
Output: 5  # Compra a 1, ven a 6
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Mantén el preu mínim vist fins ara i el màxim benefici possible.

=== "Conceptes clau"
    - Greedy approach
    - Variables de seguiment
    - Una passada

---

### 24. Find the Difference

!!! question "Enunciat"
    Donades dues strings `s` i `t` on `t` és `s` amb un caràcter extra afegit, troba el caràcter extra.

**Exemple:**
```python
Input: s = "abcd", t = "abcde"
Output: "e"
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/find-the-difference/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    XOR tots els caràcters, o suma els valors ASCII i resta.

=== "Conceptes clau"
    - XOR
    - ASCII values
    - Character manipulation

---

### 25. Happy Number

!!! question "Enunciat"
    Un nombre és "feliç" si la suma dels quadrats dels seus dígits eventualment arriba a 1.

**Exemple:**
```python
Input: 19
Output: true

Explicació:
1² + 9² = 82
8² + 2² = 68
6² + 8² = 100
1² + 0² + 0² = 1
```

=== "Informació"
    - **Dificultat**: :green_circle: Fàcil
    - **Enllaç**: [LeetCode](https://leetcode.com/problems/happy-number/)
    - **Solució disponible**: :white_check_mark: Sí

=== "Pista"
    Usa un Set per detectar cicles. Si entres en un cicle sense arribar a 1, no és feliç.

=== "Conceptes clau"
    - Cycle detection
    - HashSet
    - Mathematical operations

---

## 📚 Recursos Addicionals

!!! success "Plataformes Recomanades"
    - **[LeetCode](https://leetcode.com/)** - Filtra per "Easy" i temàtiques específiques
    - **[HackerRank](https://www.hackerrank.com/)** - "Interview Preparation Kit"
    - **[GeeksforGeeks](https://www.geeksforgeeks.org/)** - Articles amb explicacions detallades
    - **[NeetCode](https://neetcode.io/)** - Vídeos explicatius en anglès

---

## 🗓️ Pla d'Estudi Recomanat

!!! example "Calendari de 8 Setmanes"

    === "Setmanes 1-2: Arrays"
        **Problemes**: #1 - #7  
        **Objectiu**: Dominar manipulació bàsica d'arrays  
        **Conceptes**: Two pointers, in-place operations
        
    === "Setmanes 3-4: Strings"
        **Problemes**: #8 - #14  
        **Objectiu**: Operacions amb cadenes de text  
        **Conceptes**: String processing, reversals, anagrames
        
    === "Setmanes 5-6: Bucles i Lògica"
        **Problemes**: #15 - #20  
        **Objectiu**: Lògica matemàtica i bucles  
        **Conceptes**: XOR, operacions matemàtiques, carry
        
    === "Setmanes 7-8: Cerca Simple"
        **Problemes**: #21 - #25  
        **Objectiu**: Cerca i comparació  
        **Conceptes**: Binary search, HashMap, cycle detection

---

## 💡 Consells per a l'Estudi

!!! tip "Estratègia de Resolució"
    1. **Llegeix l'enunciat amb atenció** - Entén què demana exactament
    2. **Escriu exemples** - Prova amb 2-3 casos diferents
    3. **Pensa abans de programar** - Esbossa el pseudocodi
    4. **Implementa** - Escriu el codi pas a pas
    5. **Prova** - Comprova amb els exemples i edge cases
    6. **Optimitza** - Hi ha una solució millor?

!!! warning "Errors Comuns a Evitar"
    - ❌ Mirar la solució massa aviat
    - ❌ No provar amb edge cases (arrays buides, un sol element, etc.)
    - ❌ No pensar en la complexitat temporal i espacial
    - ❌ Només practicar al ordinador (practica també en paper!)

!!! info "Quan et quedis encallat"
    1. Torna a llegir l'enunciat
    2. Prova amb un exemple més petit
    3. Pensa en força bruta primer, després optimitza
    4. Si portes >30 minuts, mira una pista (no la solució completa)
    5. Si veus la solució, tanca-la i prova de nou l'endemà

---

## 🎯 Preparació per a Entrevistes

!!! note "Durant l'Entrevista"
    **Comunica't clarament:**
    
    - Pensa en veu alta
    - Explica el teu raonament
    - Pregunta si tens dubtes
    - Discuteix complexitat temporal/espacial
    - Menciona alternatives

!!! success "Bones Pràctiques"
    ✅ Escriu codi net i llegible  
    ✅ Usa noms de variables descriptius  
    ✅ Gestiona els edge cases  
    ✅ Prova el teu codi amb exemples  
    ✅ Mantén la calma i pensa amb claredat

---

## 📊 Seguiment del Progrés

!!! example "Taula de Seguiment"
    Pots crear una taula per fer seguiment del teu progrés:

    | # | Problema | 1a Intent | 2n Intent | Dominat |
    |---|----------|-----------|-----------|---------|
    | 1 | Remove Duplicates | ⬜ | ⬜ | ⬜ |
    | 2 | Move Zeroes | ⬜ | ⬜ | ⬜ |
    | ... | ... | ... | ... | ... |

---

!!! quote "Recorda"
    *"La pràctica consistent és més important que la intensitat esporàdica. Dedica temps cada dia, encara que siguin 30 minuts, i veuràs resultats!"*

---

**Document creat per a estudiants de programació amb 6 mesos d'experiència**  
**Última actualització**: 2025-11-15
