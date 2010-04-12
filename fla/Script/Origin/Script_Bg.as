#initclip 6
bgChurchList=[{bg:BgNear,clip:"church2",isAble:true,depth:2,speed:5},
			  {bg:BgFar,clip:"church1",isAble:true,depth:1,speed:3}
			  ];
bgTreeList=[{bg:BgNear,clip:"tree2",isAble:true,depth:2,speed:5},
			  {bg:BgFar,clip:"tree1",isAble:true,depth:1,speed:3}
			  ];
//////////////////////////////////////////////
Bg.prototype=new MovieClip();
function Bg(){
	this.isAble;
	this.isAbleToRight=true;
	this.isAbleToLeft=true;
}
Bg.prototype.onEnterFrame=function(disX){
	if(this._x>disX){
		this.isAbleToRight=false;	
	}else{
		this.isAbleToRight=true;
	}
	if(this._x<-disX){
		this.isAbleToLeft=false;
	}else{
		this.isAbleToLeft=true;
	}
}
//////////////////////////////////////////////
BgFar.prototype=new Bg();
function BgFar(){
}
BgFar.prototype.onEnterFrame=function(){
	super.onEnterFrame(50);
}
//////////////////////////////////////////////
BgNear.prototype=new Bg();
function BgNear(){
}
BgNear.prototype.onEnterFrame=function(){
	super.onEnterFrame(80);
}
#endinitclip
