/*
 * 言葉のゴミ。
 * tmlibを読み込んで使ってね！
 */


/**
 * コンストラクタ 
 **/
function WordDebli (word) {
	this.rad   = Math.PI / 2.0 * 3;
	this.speed = 0.01 + Math.random() * 0.02;
	this.speed *= Math.random() < 0.5 ? 1 : -1;
	this.distance = 30;	//	現在の惑星からの距離
	this.emitSpeed = 2 + Math.random() * 1;
	this.maxDistance = 100 + Math.random() * 200;
	this.label = tm.display.Label(word);
	this.center = { x: 0, y: 0 };
}

WordDebli.prototype = {
		
	update: function() {
		this.rad += this.speed;
		//	maxDistanceまでdistanceを上げる
		this.distance += this.emitSpeed;
		if (this.distance > this.maxDistance) {
			this.distance = this.maxDistance;
		}

		//	回す
		this.label.x = Math.cos(this.rad) * this.distance + this.center.x;
        this.label.y = Math.sin(this.rad) * this.distance + this.center.y;

	},

	setCenter: function(x, y) {
		this.center.x = x;
		this.center.y = y;
	},

}
