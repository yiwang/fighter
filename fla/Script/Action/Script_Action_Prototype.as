#initclip 10
	
//Action Class
Action.prototype=new MovieClip();
function Action(){
	this.self;
	this.other;
	this.point=new Object();//temp var, for speed reason
}
Action.prototype.onEnterFrame=function(){//important cycle here
	if(this._currentframe==2){
		role=this._name.charAt(0)
		this.self=game.roleArray[role];
		this.other=game.roleArray[1-role];
		this.self.state.isAble=false;
	}
	//for pos
	this.point.x=this.pos._x;
	this.point.y=this.pos._y;
	this.localToGlobal(this.point);
	_root.initStage.globalToLocal(this.point);
	this.self.pos.x=this.point.x;
	this.self.pos.y=this.point.y;
	if(this.self.pos.x<this.other.pos.x){
		this.self.keyInfo.atVal=1;
	}else{
		this.self.keyInfo.atVal=-1;
	}
}
Action.prototype.onUnload=function(){
	//trace("Unload"+this.self.action);
}
///////////////////////////////////////////////////
Still.prototype=new Action();
function Still(){
	//this.old_xscale;//important property
}
Still.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	/*if(this._currentframe==2){
		this.old_xscale=this._xscale;
	}*/
	this.self.state.isAble=true;
	if(this._currentframe==this._totalframes
	   &&this.self.action==this){
		this._xscale=this.self.keyInfo.atVal*32;
		/*this._yscale=32;
		if(this._xscale!=this.old_xscale){
			this.self.actionMask._xscale*=-1;
		}
		this.old_xscale=this._xscale;*/		
	}
}
///////////////////////////////////////////////////
BasicAction.prototype=new Action();
function BasicAction(){	
}
BasicAction.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	if(this._currentframe==this._totalframes){
//		this.self.lastAction=this.self.action;
		game.attachRoleAction(this.self,this.self.name+"_still");
		this.self.state.isAble=true;
	}
}
//////////////////////////////////////////////////
Forward.prototype=new BasicAction();
function Forward(self,other){
}
Forward.prototype.onEnterFrame=function(clip){
	super.onEnterFrame();
	if(this._currentframe==4){
		this.self.state.isAble=true;
	}
/////////////////////cfg.isCollision
if(cfg.isCollision){
	if(this._currentframe>=3){
		a=this.other.keyInfo.downActList;		
		if(Math.abs(this.self.pos.x-this.other.pos.x)<50
			&&this.other.state.flagUp==0){
			switch(a[a.length-1]){
				case "front":
					this.self.state.isAble=false;
					this.other.state.isAble=false;
					//this.self.actionMask._x=this.self.action._x-=this.self.keyInfo.atVal*10;
					//this.other.actionMask._x=this.other.action._x-=this.other.keyInfo.atVal*10;					
					break;
				case undefined:
					game.attachRoleAction(this.other,this.other.name+clip);
					//this.self.actionMask._x=this.self.action._x-=this.self.keyInfo.atVal*10;
				default:
					game.attachRoleAction(this.other,this.other.name+clip);
					//this.self.actionMask._x=this.self.action._x-=this.self.keyInfo.atVal*10;
			}
		}
	}
}
}
//////////////////////////////////////////////////
UpAction.prototype=new BasicAction();
function UpAction(){
}
UpAction.prototype.onEnterFrame=function(flagUp){
	super.onEnterFrame();
	if(this._currentframe==2){
		this.self.state.flagUp=flagUp;
		this.self.state.isAble=true;		
	}
	if(this._currentframe==6){
		this.self.state.flagUp=0;
		this.self.state.isAble=false;
	}	
}
//////////////////////////////////////////////////
FallAction.prototype=new BasicAction();
function FallAction(){
}
FallAction.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	if(this._currentframe==5){
		this.self.state.flagUp=0;
		this.self.state.isAble=false;
	}	
}
//////////////////////////////////////////////////
StillPass.prototype=new BasicAction();
function StillPass(self,other){
}
StillPass.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	this.self.state.isAble=true;
}
//////////////////////////////////////////////////
StillStart.prototype=new BasicAction();
function StillStart(self,other){
}
StillStart.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	if(this._currentframe==3
	   &&this.self.keyInfo.keyAct==undefined){
		this.stop();
		this.self.actionMask.stop();
	}else{
		this.play();
		this.self.actionMask.play();		
	}
}
//////////////////////////////////////////////////
StillEnd.prototype=new Action();
function StillEnd(self,other){
}
StillEnd.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	if(this._currentframe==this._totalframes){
		this.stop();
		this.self.actionMask.stop();
	}
}
//////////////////////////////////////////////////
Pass.prototype=new BasicAction();
function Pass(self,other){
}
Pass.prototype.onEnterFrame=function(){
	super.onEnterFrame();
}
//////////////////////////////////////////////////////////////
PassUpDown.prototype=new FallAction();
function PassUpDown(self,other){
}
PassUpDown.prototype.onEnterFrame=function(){
	super.onEnterFrame();
}

#endinitclip
