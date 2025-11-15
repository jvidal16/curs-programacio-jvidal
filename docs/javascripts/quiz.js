// Sistema de qüestionaris interactius
class Quiz {
  constructor(containerId) {
    this.container = document.getElementById(containerId);
    this.questions = [];
    this.score = 0;
    this.answered = 0;
  }

  addQuestion(question) {
    this.questions.push(question);
  }

  checkAnswer(questionIndex, selectedValue) {
    const question = this.questions[questionIndex];
    const resultElement = document.getElementById(`result-${questionIndex}`);
    const buttons = document.querySelectorAll(`#question-${questionIndex} input[type="radio"]`);
    const submitBtn = document.querySelector(`#question-${questionIndex} .submit-btn`);

    if (!selectedValue) {
      resultElement.innerHTML = '⚠️ Si us plau, selecciona una opció';
      resultElement.className = 'quiz-result warning';
      return;
    }

    // Deshabilitar botons després de respondre
    buttons.forEach(btn => btn.disabled = true);
    submitBtn.disabled = true;

    if (selectedValue === question.correct) {
      resultElement.innerHTML = `✅ <strong>Correcte!</strong> ${question.explanation}`;
      resultElement.className = 'quiz-result correct';
      this.score++;
    } else {
      resultElement.innerHTML = `❌ <strong>Incorrecte.</strong> ${question.explanation}`;
      resultElement.className = 'quiz-result incorrect';
    }

    this.answered++;
    this.updateProgress();
  }

  updateProgress() {
    const progressElement = document.getElementById('quiz-progress');
    if (progressElement && this.answered === this.questions.length) {
      const percentage = Math.round((this.score / this.questions.length) * 100);
      let message = '';
      let className = '';

      if (percentage >= 80) {
        message = '🎉 Excel·lent!';
        className = 'excellent';
      } else if (percentage >= 60) {
        message = '👍 Bé!';
        className = 'good';
      } else {
        message = '📚 Pots millorar';
        className = 'needs-improvement';
      }

      progressElement.innerHTML = `
        <div class="quiz-final-score ${className}">
          <h3>${message}</h3>
          <p>Puntuació: ${this.score} / ${this.questions.length} (${percentage}%)</p>
        </div>
      `;
    }
  }

  reset() {
    this.score = 0;
    this.answered = 0;
    const inputs = this.container.querySelectorAll('input[type="radio"]');
    const buttons = this.container.querySelectorAll('.submit-btn');
    const results = this.container.querySelectorAll('.quiz-result');

    inputs.forEach(input => {
      input.disabled = false;
      input.checked = false;
    });

    buttons.forEach(btn => btn.disabled = false);
    results.forEach(result => result.innerHTML = '');

    const progressElement = document.getElementById('quiz-progress');
    if (progressElement) {
      progressElement.innerHTML = '';
    }
  }
}


// Funció global per comprovar resposta
/*function checkQuizAnswer(quizId, questionIndex) {
  const selectedInput = document.querySelector(`#question-${questionIndex} input[name="q${questionIndex}"]:checked`);
  const selectedValue = selectedInput ? selectedInput.value : null;

  if (window[quizId]) {
    window[quizId].checkAnswer(questionIndex, selectedValue);
  }
}
*/
function checkQuizAnswer(quizId, questionIndex) {
  console.log('=== DEBUG checkQuizAnswer ===');
  console.log('quizId:', quizId);
  console.log('questionIndex:', questionIndex);
  
  const selectedInput = document.querySelector(`#question-${questionIndex} input[name="q${questionIndex}"]:checked`);
  console.log('selectedInput:', selectedInput);
  
  const selectedValue = selectedInput ? selectedInput.value : null;
  console.log('selectedValue:', selectedValue);
  
  console.log('window[quizId]:', window[quizId]);
  
  if (window[quizId]) {
    console.log('Quiz trobat! Cridant checkAnswer...');
    window[quizId].checkAnswer(questionIndex, selectedValue);
  } else {
    console.error('ERROR: Quiz no trobat!');
    console.log('window:', window);
  }
  console.log('=== FI DEBUG ===');
}

// Funció global per reiniciar quiz
function resetQuiz(quizId) {
  if (window[quizId]) {
    window[quizId].reset();
  }
}
