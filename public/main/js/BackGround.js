function BackGround (bgfilename, mvlength, childlayer) {
	this.bgfilename = bgfilename;
	this.mvlength = mvlength;
	this.childlayer = childlayer;
	this.imagewidth = 200;
	this.center = {x1:100, x2:300, y:200 };
    this.back = tm.display.Sprite("star", 200, 200).addChildTo(childlayer);
    this.back2 = tm.display.Sprite("star", 200, 200).addChildTo(childlayer);
    this.back.setPosition(this.center.x1,this.center.y);
    this.back2.setPosition(this.center.x2,this.center.y);
    this.WIDTH = 600;
}

BackGround.prototype = {

	update: function() {
		this.center.x1 += this.mvlength;
		if(this.center.x1 > 700) this.center.x1 = this.imagewidth/2;
		if(this.center.x1 <-100) this.center.x1 = this.WIDTH;
		this.back.setPosition(this.center.x1,this.center.y);
		this.center.x2 += this.mvlength;
		if(this.center.x2 > 700) this.center.x2 = this.imagewidth/2;
		if(this.center.x2 <-100) this.center.x2 = this.WIDTH;
	    this.back2.setPosition(this.center.x2,this.center.y);
	},

	setCenter: function(x, y) {
		this.center.x1 = x;
		this.center.x2 = x+this.imagewidth;
		this.center.y = y;
	},

}
