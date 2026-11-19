
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Krillion - Deep Dive</title>

<style>
body {
  background: #071b2d;
  color: white;
  font-family: Arial, sans-serif;
  text-align: center;
  margin: 0;
  padding: 25px;
}

.container {
  max-width: 600px;
  margin: auto;
  background: #102d45;
  padding: 25px;
  border-radius: 18px;
}

h1 {
  color: #36d6e7;
  font-size: 38px;
}

.question {
  font-size: 25px;
  margin: 30px 0;
}

input {
  width: 85%;
  padding: 14px;
  border-radius: 8px;
  border: none;
  font-size: 17px;
}

button {
  background: #13b8d1;
  color: white;
  border: none;
  padding: 14px 25px;
  margin: 10px;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
}

button:hover {
  background: #078ba5;
}

#timer {
  font-size: 30px;
  color: #ffd166;
}

#result {
  font-size: 22px;
  margin: 20px;
}
</style>
</head>

<body>

<div class="container">

<h1>🌊 KRILLION</h1>
<p>How deep can you dive?</p>

<h2 id="round">Question 1 / 7</h2>
<div id="timer">25</div>

<div class="question" id="question">
Name a country in Europe
</div>

<input id="answer" placeholder="Enter your answer">

<br>

<button onclick="submitAnswer()">LOCK IN ANSWER</button>

<div id="result"></div>
<h2 id="score">Score: 0</h2>

<button onclick="nextQuestion()" id="next"
style="display:none">NEXT QUESTION</button>

</div>

<script>

const questions = [
{
q: "Name a country in Europe",
answers: {
france: 10,
germany: 10,
italy: 10,
iceland: 90,
andorra: 300,
liechtenstein: 500,
"san marino": 800
}
},
{
q: "Name an ocean animal",
answers: {
shark: 10,
dolphin: 10,
octopus: 40,
narwhal: 400,
"sea cucumber": 700,
oarfish: 1000
}
},
{
q: "Name a football club",
answers: {
liverpool: 10,
arsenal: 20,
ajax: 100,
benfica: 100,
atalanta: 250
}
},
{
q: "Name a planet",
answers: {
earth: 10,
mars: 10,
saturn: 10,
pluto: 80,
eris: 600
}
},
{
q: "Name an African country",
answers: {
egypt: 10,
kenya: 20,
ghana: 40,
namibia: 150,
eswatini: 500
}
},
{
q: "Name a superhero",
answers: {
batman: 10,
superman: 10,
spiderman: 10,
moonknight: 300,
"blue beetle": 400
}
},
{
q: "Name an Asian country",
answers: {
china: 10,
india: 10,
japan: 10,
bhutan: 300,
"timor-leste": 600
}
}
];

let current = 0;
let score = 0;
let time = 25;
let timer;
let finished = false;

function loadQuestion() {
  if (current >= questions.length) {
    document.querySelector(".container").innerHTML =
      `<h1>🏆 GAME COMPLETE!</h1>
       <h2>Your score: ${score}</h2>
       <button onclick="location.reload()">PLAY AGAIN</button>`;
    return;
  }

  finished = false;
  time = 25;

  document.getElementById("round").innerText =
    `Question ${current + 1} / 7`;

  document.getElementById("question").innerText =
    questions[current].q;

  document.getElementById("answer").value = "";
  document.getElementById("answer").disabled = false;
  document.getElementById("result").innerText = "";
  document.getElementById("next").style.display = "none";

  clearInterval(timer);

  timer = setInterval(() => {
    time--;
    document.getElementById("timer").innerText = time;

    if (time <= 0) {
      submitAnswer();
    }
  }, 1000);
}

function submitAnswer() {
  if (finished) return;
  finished = true;
  clearInterval(timer);

  const answer = document.getElementById("answer")
    .value.trim().toLowerCase();

  const points = questions[current].answers[answer];

  if (points !== undefined) {
    score += points;
    document.getElementById("result").innerText =
      `🎉 Correct! +${points} points`;
  } else {
    document.getElementById("result").innerText =
      "❌ Incorrect or time's up!";
  }

  document.getElementById("score").innerText =
    `Score: ${score}`;

  document.getElementById("answer").disabled = true;
  document.getElementById("next").style.display = "inline-block";
}

function nextQuestion() {
  current++;
  loadQuestion();
}

loadQuestion();

</script>
</body>
</html>
