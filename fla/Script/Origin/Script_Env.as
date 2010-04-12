#initclip 5
//Env Class
envList=[{env:EnvEdge,clip:"leftEdge",initPos:"initLeftEdge",depth:50},
		 {env:EnvEdge,clip:"rightEdge",initPos:"initRightEdge",depth:60}
		 ]
//////////////////////////////////////////////
EnvEdge.prototype=new MovieClip();
function EnvEdge(){
	this.pos=new Object();
	this.isCpos=false;
}
//////////////////////////////////////////////
EnvEdge.prototype.init=function(){
	this.pos.x=this._x;
	this.pos.y=this._y;
	_root.initStage.globalToLocal(this.pos);
}
//////////////////////////////////////////////
EnvEdge.prototype.onEnterFrame=function(){	
	if(!this.isCpos){
		this.init();
		this.isCpos=true;
	}
	for(role in game.roleArray){
		self=game.roleArray[role];
		other=game.roleArray[Math.abs(role-1)];
		dis=self.pos.x-this.pos.x;
		switch(this._name){
			case "leftEdge":
				if(dis<0){
					self.actionMask._x=self.action._x+=40;
					if(cfg.isBgMove){//cfg.isBgMove
						game.bgMove(this._name,other);
					}
				}
				break;
			case "rightEdge":
				if(dis>0){
					self.actionMask._x=self.action._x-=40;
					if(cfg.isBgMove){//cfg.isBgMove					
						game.bgMove(this._name,other);
					}
				}
				break;
			default:
		}
	}
}
#endinitclip
