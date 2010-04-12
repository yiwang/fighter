#initclip 50
//////////////////////////////////////////////////
ActUp.prototype=new UpAction();
function ActUp(self,other){
	a=self.keyInfo.downActList;
	b=a[a.length-1];
	if((b=="up"||b=="fistup")
		 &&self.state.flagUp==0){
		return true;
	}	
}
ActUp.prototype.onEnterFrame=function(){
	super.onEnterFrame(1);
}
//////////////////////////////////////////////////
ActFUpL.prototype=new UpAction();
function ActFUpL(self,other){
	a=self.keyInfo.downActList;
	b=a[a.length-1];
	if((b=="frontup"||b=="fistfrontup")
		&&self.state.flagUp==0){
		return true;
	}	
}
ActFUpL.prototype.onEnterFrame=function(){
	super.onEnterFrame(2);
}
//////////////////////////////////////////////////
ActBUpL.prototype=new UpAction();
function ActBUpL(self,other){
	a=self.keyInfo.downActList;
	b=a[a.length-1];
	if((b=="backup"||b=="fistbackup")
		&&self.state.flagUp==0){
		return true;
	}	
}
ActBUpL.prototype.onEnterFrame=function(){
	super.onEnterFrame(-2);
}
//////////////////////////////////////////////////
ActRun.prototype=new Forward();
function ActRun(self,other){
	a=self.keyInfo.downActList;
	if(a.slice(a.length-3,a.length).toString()=="front,front,front"
		 &&self.state.flagUp==0){
		return true;
	}
}
ActRun.prototype.onEnterFrame=function(){
	super.onEnterFrame("_pBRun");
}
//////////////////////////////////////////////////
ActFront.prototype=new Forward();
function ActFront(self,other){
	a=self.keyInfo.downActList;
	if(a[a.length-1]=="front"
		&&self.state.flagUp==0){
		return true;
	}
}
ActFront.prototype.onEnterFrame=function(){
	super.onEnterFrame("_pBack");
}
//////////////////////////////////////////////////
ActBRun.prototype=new BasicAction();
function ActBRun(self,other){
	a=self.keyInfo.downActList;
	if(a.slice(a.length-3,a.length).toString()=="back,back,back"
		 &&self.state.flagUp==0){
		return true;
	}
}
ActBRun.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	if(this._currentframe==4){
		this.self.state.isAble=true;
	}
}
///////////////////////////////////////////////////////
ActBack.prototype=new BasicAction();
function ActBack(self,other){
	a=self.keyInfo.downActList;
	if(a[a.length-1]=="back"
		&&self.state.flagUp==0){
		return true;
	}
}
ActBack.prototype.onEnterFrame=function(){
	super.onEnterFrame();
	if(this._currentframe==4){
		this.self.state.isAble=true;
	}
}
//////////////////////////////////////////////////
ActDown.prototype=new BasicAction();
function ActDown(self,other){
	a=self.keyInfo.downActList;
	if(a[a.length-1]=="down"
		&&self.state.flagUp==0){
		return true;
	}
}
#endinitclip
