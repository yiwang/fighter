#initclip 5000
//////////////////////////////////////////////////////////////
//State Class
function State(){
	this.lifeVal=100;
	this.flagUp=0;
	this.isAble=false;	
}
////////////////////////////////////////////////////Role Class
////////////////////////////////////////////////////Actor Class Now!
//for the reason of contrast of namespace
function Actor(isCPU,keyList,initPos,depth,name,blood){
	this.isCPU=isCPU;
	this.keyInfo=new KeyInfo(isCPU,keyList);	
	this.state=new State();
	this.depth=depth;
	this.name=name;
	this.blood=blood;	
	this.stillList=new Array();
	this.actionList=new Array();
	this.passList=new Array();
	this.lastAction=new Object();
	this.lastAction.pos=initPos;
	this.action;
	this.actionMask;
	this.pos=new Object();
	this.pos.x=initPos._x;
	this.pos.y=initPos._y;
	initStage.globalToLocal(this.pos);//init pos
	this.lastPower;
	this.power;
	this.medPowerPos=new Object();
	this.obj_actPower;
	//exe
	this.init();
}
///////////////////////////////////////////////////
Actor.prototype.end=function (){
	this.keyInfo.end();
	delete this.keyInfo;
	delete this.state;
	delete this.stillList;
	delete this.actionList;
	delete this.passList;	
	delete this.lastAction;
	delete this.pos;
}
///////////////////////////////////////////////////
Actor.prototype.init=function(){
	var f=true;
	for(actionMap in _stillList){
		a=this.stillList[actionMap]={clip:this.name+_stillList[actionMap].clip,
						action:_stillList[actionMap].action};
		f=f&&Object.registerClass(a.clip,a.action);
	}
	for(actionMap in _actionList){
		a=this.actionList[actionMap]={clip:this.name+_actionList[actionMap].clip,
						action:_actionList[actionMap].action};
		f=f&&Object.registerClass(a.clip,a.action);
	}
	for(actionMap in _passList){
		a=this.passList[actionMap]={clip:this.name+_passList[actionMap].clip,
						action:_passList[actionMap].action};
		f=f&&Object.registerClass(a.clip,a.action);
	}
	//trace(this.name);
	//trace(f);
}
/*
///////////////////////////////////////////////////PeopleRole Class
PeopleRole.prototype=new Role();
function PeopleRole(keyList,
					initPos,depth,name,blood){
	super(initPos,depth,name,blood);	
	this.keyInfo=new KeyInfo(keyList);
	//exe
}
////////////////////////////////////////////////////ComputerRole Class
CPURole.prototype=new Role();
function CPURole(keyList,initPos,depth,name,blood){
	super(initPos,depth,name,blood);
	this.keyInfo=new KeyInfo(keyList);
}//*/
#endinitclip
