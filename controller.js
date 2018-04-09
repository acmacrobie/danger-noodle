function gameOver() {
	clearInterval(timer);
	alert ("Game Over");
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
	}
}

document.addEventListener("keydown", handleKeypress, false);

createFood();

timer = setInterval(turn, interval);