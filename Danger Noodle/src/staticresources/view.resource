var canvas;
var ctx;

function initView() {
	canvas = document.getElementById("gameCanvas");
	ctx = canvas.getContext("2d");

	canvas.width = areaWidth * gridPixels;
	canvas.height = areaHeight * gridPixels;
}

function draw() {
	ctx.fillStyle = backgroundColor;
	ctx.fillRect(0, 0, canvas.width, canvas.height);

	ctx.fillStyle = snekColor;

	for (var i = 0; i < snek.length; i++) {
		ctx.fillRect(snek[i].x * gridPixels, snek[i].y * gridPixels, gridPixels, gridPixels);
		//ctx.beginPath();
		//ctx.arc(snek[i].x * gridPixels + (gridPixels / 2), snek[i].y * gridPixels + (gridPixels / 2), gridPixels / 2, 0, Math.PI * 2, true);
		//ctx.fillStyle = snekColor;
		//ctx.fill(); 
	}

	ctx.fillStyle = foodColor;
	ctx.fillRect(foodX * gridPixels, foodY * gridPixels, gridPixels, gridPixels);
	//ctx.beginPath();
	//ctx.arc(foodX * gridPixels + (gridPixels / 2), foodY * gridPixels + (gridPixels / 2), gridPixels / 2, 0, Math.PI * 2, true);
	//ctx.fillStyle = foodColor;
	//ctx.fill();
	ctx.font = scoreFont;
	ctx.fillStyle = scoreColor;
	ctx.fillText(score,canvas.width / 2, 50);
}