#initclip 30
//////////////////////////////////////////////////
/*HitUp.prototype = new FallAction();
function HitUp() {
}
HitUp.prototype.onEnterFrame = function(frame, disX, degree,flagUp) {
	super.onEnterFrame();
	if (this._currentframe == frame 
		&& Math.abs(this.self.pos.x-this.other.pos.x)<disX) {
		switch (this.other.state.flagUp) {
			case flagUP :
				game.whenHit(this.self, this.other,degree);
				break;
			default :
				game.whenHit(this.self, this.other,degree);		
		}
	}
};
*//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//trace(JS.hit.fist.flagUpArray);
//////////////////////////////////////////////////
UpHit.prototype = new FallAction();
function UpHit() {
}
UpHit.prototype.onEnterFrame = function(obj_h) {
	super.onEnterFrame();
	if (this._currentframe == obj_h.frame
		&& Math.abs(this.self.pos.x-this.other.pos.x)<obj_h.disX) {
		for(flagUp in obj_h.flagUpArray){
			if(obj_h.flagUpArray[flagUp]==this.other.state.flagUp) {
				game.whenHit(this.self, this.other, obj_h.degree);
				break;
			}
		}			
	}
};
//////////////////////////////////////////////////
Hit.prototype = new BasicAction();
function Hit() {
}
Hit.prototype.onEnterFrame = function(obj_h) {
	super.onEnterFrame();
	if (this._currentframe == obj_h.frame
		&& Math.abs(this.self.pos.x-this.other.pos.x)<obj_h.disX) {
		for(flagUp in obj_h.flagUpArray){
			if(obj_h.flagUpArray[flagUp]==this.other.state.flagUp) {
				game.whenHit(this.self, this.other, obj_h.degree);
				break;
			}
		}			
	}
};
//////////////////////////////////////////////////
ActFUpFist.prototype = new UpHit();
function ActFUpFist(self, other) {
	a = self.keyInfo.downActList;
	b = a[a.length-1];
	if ((b == "fist" || b == "fistup" || b == "fistfront" || b == "fistfrontup") && self.state.flagUp == 2) {
		return true;
	}
}
ActFUpFist.prototype.onEnterFrame = function() {
	super.onEnterFrame(eval(this.self.name+".hit.fUpFist"));
};
//////////////////////////////////////////////////
ActBUpFist.prototype = new UpHit();
function ActBUpFist(self, other) {
	a = self.keyInfo.downActList;
	b = a[a.length-1];
	if ((b == "fist" || b == "fistup" || b == "fistback" || b == "fistbackup") && self.state.flagUp == -2) {
		return true;
	}
}
ActBUpFist.prototype.onEnterFrame = function() {
	super.onEnterFrame(eval(this.self.name+".hit.bUpFist"));
};
//////////////////////////////////////////////////
ActUpFist.prototype = new UpHit();
function ActUpFist(self, other) {
	a = self.keyInfo.downActList;
	b = a[a.length-1];
	if ((b == "fist" || b == "fistup") && self.state.flagUp == 1) {
		return true;
	}
}
ActUpFist.prototype.onEnterFrame = function() {
	//trace(eval(this.self.name+".hit.upFist"));
	super.onEnterFrame(eval(this.self.name+".hit.upFist"));
};
//////////////////////////////////////////////////
ActFist.prototype = new Hit();
function ActFist(self, other) {
	a = self.keyInfo.downActList;
	b = a[a.length-1];
	if ((b == "fist" || b == "fistfront") 
		 && self.state.flagUp == 0) {
		return true;
	}
}
ActFist.prototype.onEnterFrame = function() {
	super.onEnterFrame(eval(this.self.name+".hit.fist"));
	//trace(eval(this.self.name+".hit.fist.flagUpArray"));
};
#endinitclip
