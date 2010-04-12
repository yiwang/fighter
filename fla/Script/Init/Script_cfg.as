#initclip 1
////////////////////////////////////////////////////////////
//Class Config
function Config(){
	this.roleList=new Array();
	this.bgList;
	//////////
	this.isBgMove;
	this.isCollision;
	//this.isBorder;
	this.isNoColor;
	//////////
	this.difficulty;
	this.language;
	//exe
	this.init();
}
//////////////////////////////////////////////////////////
Config.prototype.setBgList=function(bg){
	b=en_initBg;
	c=(b.length-2)*Math.random();
	if(bg=="Random"){
		bg=b[Math.round(c)+1].data;
	}
	this.bgList=bg;
}
//////////////////////////////////////////////////////////
Config.prototype.setRoleName=function(index,name){
	a=this.roleList[index];
	b=en_initRoleName;
	c=(b.length-2)*Math.random();
	if(name=="Random"){
		name=b[Math.round(c)+1].data;
	}
	if(_root.isNoColor.getValue()){
		//name+="_NC";//for role20
	}
	a.name=name;
}
//////////////////////////////////////////////////////////
Config.prototype.setRoleCPU=function(index,isCPU){
	a=this.roleList[index];
	a.isCPU=isCPU;
}
//////////////////////////////////////////////////////////
Config.prototype.init=function(){
	this.roleList[0]=new RoleMap(false,//isCPU
								 keyLeftList,//keyList
								 "initLeftRolePos",
								 0,//depth
								 null,//name
								 "leftRoleBlood");//roleBlood
	this.roleList[1]=new RoleMap(true,//isCPU
								 keyRightList,//keyList
								 "initRightRolePos",//initRolePos
								 1,//depth
								 null,//name
								 "rightRoleBlood");//roleBlood
}
////////////////////////////////////////////////////////////
//Class RoleMap
function RoleMap(isCPU,
				 keyList,
				  initRolePos,
				  depth,
				  name,
				  roleBlood
				  ){
	this.isCPU=isCPU;
	this.keyList=keyList;
	this.initRolePos=initRolePos;
	this.depth=depth;
	this.name=name;
	this.roleBlood=roleBlood;
}
////////////////////////////////////////////////////////////

#endinitclip
