var speedCap = 80;
var areaWidth = 20;
var areaHeight = 20;
var gridPixels = 30;
var backgroundColor = "#bbc1cc";
var snekColor = "#000000";
var foodColor = "#FF0000";
var growLength = 1;
var speedDelta = 5;
var scoreIncrease = 10;
var scoreColor = "green";
var scoreFont = "30px Arial";

var snekLength;
var snek;
var foodX;
var foodY;
var xDir;
var yDir;
var interval;
var timer;
var drawTimer;
var xPos;
var yPos;
var score;
var myAudio1;
var isExploding;

function initModel() {
	snekLength = 3;
	snek = [];
	xDir = 0;
	yDir = 1;
	interval = 100;
	xPos = areaWidth / 2;
	yPos = areaHeight / 2;
	score = 0;
	isExploding = false;
}