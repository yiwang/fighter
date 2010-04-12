#initclip 10000
/////////////////////////////////////////////////////////////////
//Space Class
function Space(bgList,envList,powerList,roleList){
	this.bgList=eval(bgList);
	this.envList=envList;
	this.powerList=powerList;
	this.roleList=roleList;
	//allocate new memory for  'Array'
	this.bgArray=new Array();
	this.envArray=new Array();
	this.roleArray=new Array();
	this.isSameRole=false;
	//exe
	this.init();
}
////////////////////////////////////////////////////////////
Space.prototype.end=function(){
	for(roleMap in this.roleArray){
		this.roleArray[roleMap].end();
		delete this.roleArray[roleMap];
	}
	delete this.bgArray;
	delete this.envArray;
	delete this.roleArray;
}
////////////////////////////////////////////////////////////
Space.prototype.init=function(){
	this.addBackGround();//背景
	this.addEnv();//边界
	this.addPower();
	this.addRole();
	//self & other in keyInfo
	for(role in this.roleArray){
		a=this.roleArray[role];
		//trace(a.name);
		if(role==0){
			a.keyInfo.atVal=1;
		}
		if(role==1){
			a.keyInfo.atVal=-1;
		}
		a.keyInfo.self=a;
		a.keyInfo.other=this.roleArray[Math.abs(role-1)];
		this.attachRoleAction(a,a.name+"_init");
	}
}
////////////////////////////////////////////////////////////
Space.prototype.gameOver=function(self,other){
	if(self.state.flagUp==0){
		this.attachRoleAction(self,self.name+"_endVictoryGround");
	}else{
		this.attachRoleAction(self,self.name+"_endVictoryUp");		
	}
	if(other.state.flagUp==0){
		this.attachRoleAction(other,other.name+"_endFailureGround");
	}else{
		this.attachRoleAction(other,other.name+"_endFailureUp");		
	}
	self.state.isAble=false;
	other.state.isAble=false;
}
////////////////////////////////////////////////////////////
Space.prototype.lifeChange=function(self,other,degree){
	if(0>(other.state.lifeVal-=degree/2)){
		other.blood._xscale=0;
		this.gameOver(self,other);
	}else{
		other.blood._xscale-=degree/2;
	}
}
////////////////////////////////////////////////////////////
Space.prototype.whenHit=function(self,other,degree,isStop){
	a=other.keyInfo.downActList;
	b=other.name;
	switch(other.state.flagUp){
		case 0:
			switch(a[a.length-1]){
				case "backdown":
					this.attachRoleAction(other,b+"_pDef");
					if(Math.random ()<0.5){
						this.lifeChange(self,other,degree*0.3);
					}
					break;
				case "back":
					if(Math.random ()<0.5){
						this.attachRoleAction(other,b+"_pDefBack");
						if(Math.random ()<0.5){
							this.lifeChange(self,other,degree*0.3);
						}
					}else{
						this.attachRoleAction(other,b+"_pBeenHitBack");
						this.lifeChange(self,other,degree*0.6);
					}
					break;
				default:
					if(isStop){
						this.attachRoleAction(other,b+"_pBeenHit");
					}else if(degree<10){
						this.attachRoleAction(other,b+"_pBeenHitBack");
					}else{
						this.attachRoleAction(other,b+"_pDown");
					}
					this.lifeChange(self,other,degree);
			}
			break;
		case 1:			
		case 2:
		case -2:
			switch(a[a.length-1]){
				case "backdown":
					if(Math.random ()<0.5){
						this.lifeChange(self,other,degree*0.3);
					}				
					//defenced				
					break;
				case "back":
					if(Math.random ()<0.5){
					//defenced
					}else{
						this.attachRoleAction(other,b+"_pUpDown");
						this.lifeChange(self,other,degree*0.6);
					}
					break;
				default:
					this.attachRoleAction(other,b+"_pUpDown");
					this.lifeChange(self,other,degree);
			}			
			break;
		default:
	}
}
////////////////////////////////////////////////////////////////
Space.prototype.attachMediaPower=function(self,other,clip){
	clipName=self.depth+clip;					
	//trace(clipName);
	_root.initStage.attachMovie(clip,clipName,self.depth+100);//about depth
	self.lastPower=self.power=eval("_root.initStage."+clipName);//last & this;
	self.power._x=other.pos.x;
	self.power._y=other.pos.y;
	self.power._xscale=self.keyInfo.atVal*50;
	self.power._yscale=50;
}
////////////////////////////////////////////////////////////////
Space.prototype.attachPower=function(self,other,clip){
	clipName=self.depth+clip;			
	//trace(clipName);
	_root.initStage.attachMovie(clip,clipName,self.depth+200);//about depth
	self.lastPower=self.power=eval("_root.initStage."+clipName);//last & this;
	self.power._x=other.pos.x;
	self.power._y=other.pos.y;
	self.power._xscale=self.keyInfo.atVal*50;
	self.power._yscale=50;
}
////////////////////////////////////////////////////////////////
Space.prototype.attachRoleAction=function(role,clip){
	clipName=role.depth+clip+i++;
	//trace(clipName);
	_root.initStage.attachMovie(clip,clipName,role.depth+13);//about depth
	role.lastAction=role.action=eval("_root.initStage."+clipName);
	role.action._x=role.pos.x;
	role.action._y=role.pos.y;
	role.action._xscale=role.keyInfo.atVal*32;
	role.action._yscale=32;
	//* //for mask
	if(this.isSameRole//in case of same role
	   &&role.depth==1){
		//role.action.duplicateMovieClip(clipName+"_Mask",role.depth+23,maskObj);
		mask=role.action//Mask=eval("_root.initStage."+clipName+"_Mask");
		mColor = new Color(mask);
		mColor.setRGB(0x0066FF);
		mask._alpha=30;
	}//*/
	/* //for mask
	if(this.isSameRole//in case of same role
	   &&role.depth==1){	
		maskObj=new MovieClip();
		maskObj.onEnterFrame=function(){
			//empty function to mask
		}
		role.action.duplicateMovieClip(clipName+"_Mask",role.depth+23,maskObj);
		mask=role.actionMask=eval("_root.initStage."+clipName+"_Mask");
		mColor = new Color(mask);
		mColor.setRGB(0x0066FF);
		mask._alpha=30;
	}//*/
}
////////////////////////////////////////////////////////////////
Space.prototype.keyAction=function(self,other){
	if(self.state.isAble){
		for(actionMap in self.actionList){
			if(self.actionList[actionMap].action(self,other)){
				this.attachRoleAction(self,self.actionList[actionMap].clip);
				break;//good idea for efficiency
				//trace(actionMap);//very funny:first stored last come out
			}
		}
	}
}
////////////////////////////////////////////////////////////
Space.prototype.addPower=function(){
	for(PowerMap in this.powerList){
		a=this.powerList[PowerMap];
		Object.registerClass(a.clip,a.power);
	}
}
//////////////////////////////////////////////////////////
//人物配置
Space.prototype.addRole=function(){
	if(this.roleList[0].name==this.roleList[1].name){
		this.isSameRole=true;
	}
	for(roleMap in this.roleList){
		a=this.roleList[roleMap];
		b=this.roleArray[roleMap]=new Actor(a.isCPU,
										a.keyList,
										eval(a.initRolePos),
										a.depth,
										a.name,
										eval(a.roleBlood));
	}
}
//////////////////////////////////////////////////////////
Space.prototype.check_key=function(){
	for(i in this.roleArray){
		a=this.roleArray[i].keyInfo;
		if(!a.isCPU){
			a.chAct();
		}
	}
}
///////////////////////////////////////////////////////////
Space.prototype.bgMove=function(edgeName,other){
	c=this.bgList[0].speed/this.bgList.length;
	for(bgMap in this.bgArray){
		a=this.bgArray[bgMap];
		b=this.bgList[bgMap].speed;
		//b=(bgMap+10)*0.3;//no use
		if(a.isAble){
			switch(edgeName){
				case "leftEdge":
					if(a.isAbleToRight
					   &&rightEdge.pos.x-other.pos.x>10){
						a._x+=b;
						other.actionMask._x=other.action._x+=c;
					}
					break;
				case "rightEdge":
					if(a.isAbleToLeft
					   &&leftEdge.pos.x-other.pos.x<-10){
						a._x-=b;
						other.actionMask._x=other.action._x-=c;					
					}
					break;
				default:
			}
		}
	}
}
///////////////////////////////////////////////////////////
Space.prototype.addBackground=function(){
	for(bgMap in this.bgList){
		a=this.bgList[bgMap];
		Object.registerClass(a.clip,a.bg);
		_root.initStage.attachMovie(a.clip,a.clip,a.depth);
		b=this.bgArray[bgMap]=eval("_root.initStage."+a.clip);
		b.isAble=a.isAble;//set isAble
	}
}
///////////////////////////////////////////////////////////
Space.prototype.addEnv=function(){
	for(envMap in this.envList){
		a=this.envList[envMap];
		Object.registerClass(a.clip,a.env);
		_root.attachMovie(a.clip,a.clip,a.depth);
		b=this.envArray[envMap]=eval(a.clip);
		b._x=eval(a.initPos)._x;
		b._y=eval(a.initPos)._y;
	}
}
#endinitclip