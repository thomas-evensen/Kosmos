
// ROTATE KOSMOS EVENTS
function addMainMouse()
{
	// mouse event code
	_root.Kosmos.scene.el.onMouseDown = function () 		
	{
		if(_root.Kosmos.scene.doManual)	
		{
			Mouse.hide();
			_root.removeMenubarMouse();
			_root.Kosmos.scene.doHoover 	= false;	
			_root.Kosmos.scene.manualMove	= true;
		}
	}
	_root.Kosmos.scene.el.onMouseUp 	= function () 		
	{ 
		if(_root.Kosmos.scene.doManual)	
		{
			Mouse.show();
			_root.addMenubarMouse();
			_root.Kosmos.scene.doHoover 	= true;	
			_root.Kosmos.scene.manualMove	= false;
		}
	}
}
function removeMainMouse()
{
	delete _root.Kosmos.scene.el.onMouseDown;		
	delete _root.Kosmos.scene.el.onMouseUp;
}

// DOT EVENTS
function addDotMouse()
{
	for(var i=0;i<_root.Kosmos.scene.member().length;i++)
	{
		_root.Kosmos.scene.member(i).el.mc_dot.onRollOver = function()
		{
			if(!_root.Kosmos.scene.sliding && !_root.Kosmos.menuOut)
			{
				_root.Kosmos.scene.doRotate = false;	
			}
		}
		_root.Kosmos.scene.member(i).el.mc_dot.onRollOut = function()
		{
				if(!_root.Kosmos.scene.sliding && !_root.Kosmos.menuOut)
			{
				_root.Kosmos.scene.doRotate = true;
			}
		}
		_root.Kosmos.scene.member(i).el.mc_dot.onRelease = function()
		{
			if(!_root.Kosmos.scene.sliding && !_root.Kosmos.menuOut)
			{
				if(_root.Kosmos.currPerson.id == _root.Crew.personList(this.id) && _root.Kosmos.currKosmos == "person") return;
				
				_root.Kosmos.scene.doRotate = true;
				_root.Kosmos.personKosmos(this.id,2000);
			}
		}
	}
}
function removeDotMouse()
{
	for(var i=0;i<_root.Kosmos.scene.member().length;i++)
	{
		delete _root.Kosmos.scene.member(i).el.mc_dot.onRollOver;
		delete _root.Kosmos.scene.member(i).el.mc_dot.onRollOut;
		delete _root.Kosmos.scene.member(i).el.mc_dot.onRelease;
	}
}

// MENUBAR EVENTS
function  addMenubarMouse()
{
	_root.Kosmos.menu.el.onRollOver = function()
	{	
		if(!_root.Kosmos.menuOut)
		{
			_root.Kosmos.scene.doHoover = false;	
			_root.Kosmos.scene.doManual	= false;
		}
	} 
	_root.Kosmos.menu.el.onRollOut = function()
	{
		if(!_root.Kosmos.menuOut)
			{			
			_root.Kosmos.scene.doHoover = true;	
			_root.Kosmos.scene.doManual	= true;
		}
	} 
	_root.Kosmos.menu.el.onRelease = function()
	{	
		if(!_root.Kosmos.menuOut)
		{
			_root.Kosmos.scene.doHoover = false;	
			_root.Kosmos.scene.doManual	= false;
		}
	} 
	_root.Kosmos.menu.el.onReleaseOutside = function()
	{
		if(!_root.Kosmos.menuOut)
		{
			_root.Kosmos.scene.doHoover = true;	
			_root.Kosmos.scene.doManual	= true;
		}
	}
}
function removeMenubarMouse()
{
	delete _root.Kosmos.menu.el.onRollOver;
	delete _root.Kosmos.menu.el.onRollOut;
	delete _root.Kosmos.menu.el.onRelease;
	delete _root.Kosmos.menu.el.onReleaseOutside;
}