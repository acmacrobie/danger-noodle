function gameOver() {
	clearInterval(timer);
	myAudio1.play();
	
	var scoreName = prompt("Game Over. Please enter your name.");

	saveScore(score, scoreName);
}

function checkWalls() {
	if (xPos < 0 || xPos >= areaWidth || yPos < 0 || yPos >= areaHeight) {
		gameOver();
	}
}

function checkCollision() {
	for (var i = 0; i < snek.length; i++) {
		if (snek[i].x == xPos && snek[i].y == yPos) {
			gameOver();

			break;
		}
	} 
}

function grow() {
	snekLength += growLength;
}

function setSpeed() {
	if (interval > speedCap) {
		clearInterval(timer);
		interval -= speedDelta;
		timer = setInterval(turn, interval);
	}
}

function checkFood() {
	if (foodX == xPos && foodY == yPos) {
		grow();
		createFood();
		setSpeed();
		score += scoreIncrease;
	}
}

function storeLocation() {
	snek.push({x:xPos, y:yPos});
	
	if (snek.length > snekLength) {
		var oldest = snek.shift();
	}
}

function createFood() {
	foodX = Math.floor(Math.random() * areaWidth);
	foodY = Math.floor(Math.random() * areaHeight);

	for (var i = 0; i < snek.length; i++) {
		if (snek[i].x == foodX && snek[i].y == foodY) {
			foodX = Math.floor(Math.random() * areaWidth);
			foodY = Math.floor(Math.random() * areaHeight);
			
			i = -1;
		}
	}
}

function turn() {
	xPos += xDir;
	yPos += yDir;

	checkWalls();
	checkCollision();
	checkFood();

	storeLocation();

	draw();
}

function handleKeypress(e) {
	switch (e.keyCode) {
		case 37:
			if (xDir != 1) {
				xDir = -1;
				yDir = 0;
			}

			break;

		case 38:
			if (yDir != 1) {
				xDir = 0;
				yDir = -1;
			}

			break;

		case 39:
			if (xDir != -1) {
				xDir = 1;
				yDir = 0;
			}

			break;

		case 40:
			if (yDir != -1) {
				xDir = 0;
				yDir = 1;
			}

			break;

		case 87:
			if (yDir == 0) {
				yPos -= 1;
			}

			break;

		case 83:
			if (yDir == 0) {
				yPos += 1;
			}

			break;

		case 65:
			if (xDir == 0) {
				xPos -= 1
			}

			break;

		case 68:
			if (xDir == 0) {
				xPos += 1
			}

			break;
	}
}

function startGame() {
	myAudio1 = document.createElement('audio');
	myAudio1.src = 'Loud_Nigra.mp3'

	document.addEventListener("keydown", handleKeypress, false);

	createFood();

	timer = setInterval(turn, interval);
}
