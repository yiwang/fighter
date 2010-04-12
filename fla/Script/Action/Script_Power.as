
#initclip 20
//////////////////////////////////////////////////////////////
//Power Class
MedPower.prototype=new MovieClip();
function MedPower(){
	this.self;
	this.other;
}
MedPower.prototype.onEnterFrame=function(){
	if(this._currentframe==2){
		role=this._name.charAt(0);
		this.self=game.roleArray[role];
		this.other=game.roleArray[Math.abs(role-1)];
	}
	//for pos
	var point=new Object();
	point.x=this.pos._x;
	point.y=this.pos._y;
	this.localToGlobal(point);
	_root.initStage.globalToLocal(point);
	this.self.medPowerPos.x=point.x;
	this.self.medPowerPos.y=point.y;
	//end
	if(Math.abs(this.self.medPowerPos.x-this.other.pos.x)<this.self.obj_actPower.disX){
		game.attachPower(this.self,this.other,this.self.obj_actPower.power);
		this.removeMovieClip();		
	}
	if(this._currentframe==this._totalframes){
		this.removeMovieClip();
	}
}
//////////////////////////////////////////////////////////////
//Power Class
Power.prototype=new MovieClip();
function Power(){
	this.self;
	this.other;
}
Power.prototype.onEnterFrame=function(obj_p){
	if(this._currentframe==2){
		role=this._name.charAt(0);
		this.self=game.roleArray[role];
		this.other=game.roleArray[Math.abs(role-1)];
	}
	for(frame in obj_p.frameArray){
		if(obj_p.frameArray[frame]==this._currentframe
			&&Math.abs(this._x-this.other.pos.x)<obj_p.disX){
			for(flagUp in obj_p.flagUpArray){
				if(obj_p.flagUpArray[flagUp]==this.other.state.flagUp) {
					game.whenHit(this.self, this.other, obj_p.degree,obj_p.isStop);
					break;
				}
			}
			break;
		}
	}
	if(this._currentframe==this._totalframes){
		this.removeMovieClip();
	}
}
//////////////////////////////////////////////////////////////
PowerSimple.prototype=new Power();
function PowerSimple(){
}
PowerSimple.prototype.onEnterFrame=function(){
	super.onEnterFrame(eval(this.self.name+".power."+this._name.slice(1)));
}
//////////////////////////////////////////////////////////////
PowerQuake.prototype=new Power();
function PowerQuake(){
}
PowerQuake.prototype.onEnterFrame=function(){
	super.onEnterFrame(eval(this.self.name+".power."+this._name.slice(1)));
	if(this._currentframe==2){
		oldX=_root.initStage._x;
		oldY=_root.initStage._y;
		//trace(oldX);
		//trace(oldY);
	}
	if(this._currentframe>=7){
		_root.initStage._x+=(Math.random()*10-5);
		_root.initStage._y+=(Math.random()*10-5);
	}
	if(this._currentframe==this._totalframes){
		_root.initStage._x=oldX;
		_root.initStage._y=oldY;
	}
}
#endinitclip
