var canvas = document.getElementById("gameCanvas");
var ctx = canvas.getContext("2d");

canvas.width = areaWidth * gridPixels;
canvas.height = areaHeight * gridPixels;

function draw() {
	ctx.fillStyle = backgroundColor;
	ctx.fillRect(0, 0, canvas.width, canvas.height);

	ctx.fillStyle = snekColor;

	for (var i = 0; i < snek.length; i++) {
		ctx.fillRect(snek[i].x * gridPixels, snek[i].y * gridPixels, gridPixels, gridPixels);
	}

	ctx.fillStyle = foodColor;
	ctx.fillRect(foodX * gridPixels, foodY * gridPixels, gridPixels, gridPixels);
}