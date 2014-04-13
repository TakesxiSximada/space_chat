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

  this.word = word;
  this.size = 10;
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

  //  衝突判定
  isCollision: function(debli) {
    if (Math.pow(this.label.x - debli.label.x, 2) +
        Math.pow(this.label.y - debli.label.y, 2) >
         Math.pow(this.size + debli.size, 2)) {
      return true;
    }
    return false;
  },
  
  collision: function () {
    console.log("collision");
  }

  create: function (callback) {
    var saveObject = {
      angle: this.rad,
      word: this.word,
      size: this.size,
      height: this.distance,
      deleted: false,
      object_type_id: 1
    };
    $.ajax({
      type: 'POST',
      url: '/debris.json',
      data: saveObject,
      //data: JSON.stringify(saveObject),
      success: callback,
      dataType: 'json'
    });
  }

}
