const setupElement = document.getElementById('setup');
const punchlineElement = document.getElementById('punchline');
const revealPunchlineBtn = document.getElementById('reveal-punchline-btn');
const newJokeBtn = document.getElementById('new-joke-btn');

// Function to fetch a new joke
async function getNewJoke() {
  try {
    const response = await fetch('/joke');
    const joke = await response.json();

    // Update the setup and punchline
    setupElement.innerText = joke.setup;
    punchlineElement.innerText = joke.punchline;

    // Hide the punchline and reveal-punchline button initially
    punchlineElement.style.display = 'none';
    revealPunchlineBtn.style.display = 'block'; // Show "Reveal Punchline" button
    newJokeBtn.style.display = 'none'; // Hide "Get New Joke" button
  } catch (error) {
    console.error('Error fetching joke:', error);
    setupElement.innerText = 'Failed to generate joke.';
    punchlineElement.innerText = '';
  }
}

// Function to reveal the punchline
function revealPunchline() {
  punchlineElement.style.display = 'block'; // Show the punchline
  revealPunchlineBtn.style.display = 'none'; // Hide "Reveal Punchline" button
  newJokeBtn.style.display = 'block'; // Show "Get New Joke" button
}

// Add event listeners
newJokeBtn.addEventListener('click', getNewJoke);
revealPunchlineBtn.addEventListener('click', revealPunchline);
