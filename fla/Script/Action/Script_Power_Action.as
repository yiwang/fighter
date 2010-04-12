#initclip 20
//////////////////////////////////////////////////
PowerAction.prototype=new BasicAction();
function PowerAction(){
}
PowerAction.prototype.onEnterFrame=function(str){
	super.onEnterFrame();
	a=eval(this.self.name+".actPower."+str);
	for(frame in a.frameArray){
		if(a.frameArray[frame]==this._currentframe){
			for(flagUp in a.flagUpArray){
				if(a.flagUpArray[flagUp]==this.other.state.flagUp) {
					if(null==a.power
					   &&Math.abs(this.self.pos.x-this.other.pos.x)<a.disX){
						game.whenHit(this.self,this.other,a.degree,a.isStop);
						trace("ook");
					}else if(null==a.media){
						game.attachPower(this.self,this.other,a.power);
					}else{
						this.self.obj_actPower=a;
						game.attachMediaPower(this.self,this.self,a.media);
					}
					break;
				}
			}//break
		}
	}
/*	if(this._currentframe==a.frame){
		for(flagUp in a.flagUpArray){
			if(a.flagUpArray[flagUp]==this.other.state.flagUp) {
				if(null==a.media){
					game.attachPower(this.self,this.other,a.power);
				}else{
					this.self.obj_actPower=a;
					game.attachMediaPower(this.self,this.self,a.media);
				}
				break;
			}
		}
	}*/
}
//////////////////////////////////////////////////
ActPower_back_fist.prototype=new PowerAction();
function ActPower_back_fist(self,other){
	a=self.keyInfo.downActList;
	if((self.keyInfo.keyAct=="ActPower_back_fist"
	   ||a.slice(a.length-2,a.length).toString()=="back,fist"
		||a.slice(a.length-3,a.length).toString()=="back,fist,fist")
		&&self.state.flagUp==0){
		return true;
	}	
}
ActPower_back_fist.prototype.onEnterFrame=function(){
	super.onEnterFrame("back_fist");
}
//////////////////////////////////////////////////
ActPower_back_front_fist.prototype=new PowerAction();
function ActPower_back_front_fist(self,other){
	a=self.keyInfo.downActList;
	if((self.keyInfo.keyAct=="ActPower_back_front_fist"
		||a.slice(a.length-3,a.length).toString()=="back,front,fist"
		||a.slice(a.length-4,a.length).toString()=="back,front,fist,fist"
		||a.slice(a.length-4,a.length).toString()=="back,front,front,fist")
		&&self.state.flagUp==0){
		return true;
	}	
}
ActPower_back_front_fist.prototype.onEnterFrame=function(){
	super.onEnterFrame("back_front_fist");
}
//////////////////////////////////////////////////
ActPower_down_front_fist.prototype=new PowerAction();
function ActPower_down_front_fist(self,other){
	a=self.keyInfo.downActList;
	if((self.keyInfo.keyAct=="ActPower_down_front_fist"
		||a.slice(a.length-3,a.length).toString()=="down,front,fist"
		||a.slice(a.length-4,a.length).toString()=="down,front,fist,fist"
		||a.slice(a.length-4,a.length).toString()=="down,front,front,fist")
		&&self.state.flagUp==0){	   
		return true;
	}	
}
ActPower_down_front_fist.prototype.onEnterFrame=function(){
	super.onEnterFrame("down_front_fist");
}
#endinitclip
