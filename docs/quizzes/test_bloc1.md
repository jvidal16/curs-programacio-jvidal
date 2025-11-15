# Autoavaluació Bloc 1

Respon les següents preguntes per avaluar els teus coneixements sobre el Bloc 1.

<div class="quiz-container" id="quiz-bloc1">

<!-- Pregunta 1 -->
<div class="quiz-question" id="question-0">
  <h4>Pregunta 1: Quina NO és una característica de la programació estructurada?</h4>
  <div class="quiz-options">
    <div class="quiz-option">
      <input type="radio" id="q0a" name="q0" value="a">
      <label for="q0a">Ús de seqüències</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q0b" name="q0" value="b">
      <label for="q0b">Ús de salts incondicionals (GOTO)</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q0c" name="q0" value="c">
      <label for="q0c">Ús de seleccions</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q0d" name="q0" value="d">
      <label for="q0d">Ús d'iteracions</label>
    </div>
  </div>
  <button class="submit-btn" onclick="checkQuizAnswer('quizBloc1', 0)">Comprovar resposta</button>
  <div id="result-0" class="quiz-result"></div>
</div>

<!-- Pregunta 2 -->
<div class="quiz-question" id="question-1">
  <h4>Pregunta 2: Quin és l'objectiu principal del pseudocodi?</h4>
  <div class="quiz-options">
    <div class="quiz-option">
      <input type="radio" id="q1a" name="q1" value="a">
      <label for="q1a">Escriure codi que l'ordinador pugui executar directament</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q1b" name="q1" value="b">
      <label for="q1b">Dissenyar la lògica sense preocupar-nos de la sintaxi exacta</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q1c" name="q1" value="c">
      <label for="q1c">Substituir tots els llenguatges de programació</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q1d" name="q1" value="d">
      <label for="q1d">Fer el codi més difícil d'entendre</label>
    </div>
  </div>
  <button class="submit-btn" onclick="checkQuizAnswer('quizBloc1', 1)">Comprovar resposta</button>
  <div id="result-1" class="quiz-result"></div>
</div>

<!-- Pregunta 3 -->
<div class="quiz-question" id="question-2">
  <h4>Pregunta 3: Quin tipus de dada utilitzaries per emmagatzemar l'edat d'una persona?</h4>
  <div class="quiz-options">
    <div class="quiz-option">
      <input type="radio" id="q2a" name="q2" value="a">
      <label for="q2a">TEXT</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q2b" name="q2" value="b">
      <label for="q2b">ENTER</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q2c" name="q2" value="c">
      <label for="q2c">REAL</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q2d" name="q2" value="d">
      <label for="q2d">BOOLEÀ</label>
    </div>
  </div>
  <button class="submit-btn" onclick="checkQuizAnswer('quizBloc1', 2)">Comprovar resposta</button>
  <div id="result-2" class="quiz-result"></div>
</div>

<!-- Pregunta 4 -->
<div class="quiz-question" id="question-3">
  <h4>Pregunta 4: Quin d'aquests noms de variable és incorrecte?</h4>
  <div class="quiz-options">
    <div class="quiz-option">
      <input type="radio" id="q3a" name="q3" value="a">
      <label for="q3a">nomAlumne</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q3b" name="q3" value="b">
      <label for="q3b">2reprovats</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q3c" name="q3" value="c">
      <label for="q3c">nota_final</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q3d" name="q3" value="d">
      <label for="q3d">esAprouat</label>
    </div>
  </div>
  <button class="submit-btn" onclick="checkQuizAnswer('quizBloc1', 3)">Comprovar resposta</button>
  <div id="result-3" class="quiz-result"></div>
</div>

<!-- Pregunta 5 -->
<div class="quiz-question" id="question-4">
  <h4>Pregunta 5: Quina és la diferència entre una variable i una constant?</h4>
  <div class="quiz-options">
    <div class="quiz-option">
      <input type="radio" id="q4a" name="q4" value="a">
      <label for="q4a">Cap diferència</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q4b" name="q4" value="b">
      <label for="q4b">La constant té un nom més curt</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q4c" name="q4" value="c">
      <label for="q4c">La variable pot canviar de valor, la constant no</label>
    </div>
    <div class="quiz-option">
      <input type="radio" id="q4d" name="q4" value="d">
      <label for="q4d">La constant només pot ser numèrica</label>
    </div>
  </div>
  <button class="submit-btn" onclick="checkQuizAnswer('quizBloc1', 4)">Comprovar resposta</button>
  <div id="result-4" class="quiz-result"></div>
</div>

<!-- Progrés i resultat final -->
<div id="quiz-progress"></div>

<div style="text-align: center; margin-top: 24px;">
  <button class="reset-btn" onclick="resetQuiz('quizBloc1')">🔄 Reiniciar test</button>
</div>

</div>

<script>
window.addEventListener('load', function() {
  // Funció d'inicialització
  function initQuiz() {
    console.log('🔍 Verificant classe Quiz:', typeof Quiz);
    
    if (typeof Quiz === 'undefined') {
      console.error('❌ ERROR: La classe Quiz no està definida!');
      console.error('Comprova que quiz.js s\'ha carregat correctament.');
      return; // ✅ Ara sí pots usar return
    }
    
    console.log('✅ Classe Quiz trobada!');
    
    // Inicialitzar el quiz
    window.quizBloc1 = new Quiz('quiz-bloc1');
    console.log('✅ Quiz inicialitzat:', window.quizBloc1);

    // Afegir preguntes
    quizBloc1.addQuestion({
      correct: 'b',
      explanation: 'La programació estructurada evita els salts incondicionals (GOTO).'
    });

    quizBloc1.addQuestion({
      correct: 'b',
      explanation: 'El pseudocodi permet dissenyar la lògica sense sintaxi exacta.'
    });

    quizBloc1.addQuestion({
      correct: 'b',
      explanation: 'L\'edat és un número sense decimals (ENTER).'
    });

    quizBloc1.addQuestion({
      correct: 'b',
      explanation: 'Els noms de variables no poden començar amb un número.'
    });

    quizBloc1.addQuestion({
      correct: 'c',
      explanation: 'La variable pot canviar de valor, la constant no.'
    });
    
    console.log('✅ Preguntes afegides:', quizBloc1.questions.length);
  }
  
  // Cridar la funció
  initQuiz();
});
</script>