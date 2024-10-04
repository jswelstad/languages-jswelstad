
# GitHub Pages - Simple Website with Date and Time

## Introduction
Jack Swelstad wanted to create a simple website using GitHub Pages with HTML, CSS, and JavaScript to display the current date and time. This document summarizes the requirements, the provided code, troubleshooting steps, and explanations.

## Original Request
Jack wanted to use GitHub Pages to create a simple website that tells the time, without a working backend component.

### Initial Code Provided
#### HTML (index.html)
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Current Time</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Current Time</h1>
        <div id="time" class="time-display">00:00:00</div>
    </div>
    <script src="script.js"></script>
</body>
</html>
```

#### CSS (styles.css)
```css
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #282c34;
    color: #61dafb;
}

.container {
    text-align: center;
}

.time-display {
    font-size: 4em;
    margin-top: 20px;
}
```

#### JavaScript (script.js)
```js
function updateTime() {
    const timeElement = document.getElementById('time');
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    timeElement.textContent = \`\${hours}:\${minutes}:\${seconds}\`;
}

setInterval(updateTime, 1000);
updateTime();
```

## Troubleshooting and Folder Structure
Jack encountered an issue where only a blank white page appeared. Several troubleshooting steps were suggested:
- Verify file paths.
- Ensure the repository is public.
- Update GitHub Pages settings to use the correct branch and folder (`docs`).
- Check browser console for errors.
- Clear cache and verify case sensitivity of file names.
- Ensure GitHub Pages is fully deployed.

Jack also asked if it was okay to put all files in a folder called `docs`. It was confirmed that it is fine, but adjustments were required:
- Update GitHub Pages settings to select the `docs` folder.
- Ensure file paths in `index.html` match the `docs` structure.

## Adding a Date Counter
Jack requested a date counter alongside the time. The updated code is as follows:

### Updated HTML (index.html)
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Current Date and Time</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Current Date and Time</h1>
        <div id="date" class="date-display">YYYY-MM-DD</div>
        <div id="time" class="time-display">00:00:00</div>
    </div>
    <script src="script.js"></script>
</body>
</html>
```

### Updated CSS (styles.css)
```css
.date-display {
    font-size: 2em;
    margin-top: 10px;
}
```

### Updated JavaScript (script.js)
```js
function updateDateTime() {
    const dateElement = document.getElementById('date');
    const timeElement = document.getElementById('time');
    
    const now = new Date();
    
    // Get date in YYYY-MM-DD format
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    dateElement.textContent = \`\${year}-\${month}-\${day}\`;
    
    // Get time in HH:MM:SS format
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    timeElement.textContent = \`\${hours}:\${minutes}:\${seconds}\`;
}

setInterval(updateDateTime, 1000);
updateDateTime();
```

## Explanation of HTML, CSS, and JavaScript
Jack wanted a detailed explanation of the HTML, CSS, and JavaScript used.

- **HTML**: Defines the structure of the web page. Tags like `<div>`, `<h1>`, and `<script>` are used to add content and functionality.
- **CSS**: Styles the HTML elements. Flexbox properties (`display: flex`, `justify-content`, and `align-items`) are used for centering content, and other styles are applied to change colors and font sizes.
- **JavaScript**: Makes the page dynamic by updating the time every second. Functions like `updateDateTime()` and methods like `setInterval()` are used to change the content of the page continuously.

## Placing the Date in the Top Right Corner
Jack requested to place the date in the top right corner. The CSS was updated as follows:

### Updated CSS (styles.css)
```css
.date-display {
    position: absolute;
    top: 10px;
    right: 20px;
    font-size: 1.5em;
}
```

- **position: absolute**: Positions the date relative to the `<body>` element.
- **top** and **right**: Set the position of the date to the top right corner.

## Conclusion
This markdown file documents the creation of a simple date and time website using HTML, CSS, and JavaScript hosted on GitHub Pages, along with explanations and troubleshooting steps.
