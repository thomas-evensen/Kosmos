
dynamic class kosmos.Menu
{
	var m_el:MovieClip;
	var m_infoImage:MovieClip;
	var m_theMenu:MovieClip;
	
	// projects menu
	var links:Array;	

	public function Menu(p_x:Number, p_y:Number, p_depth:Number)
	{
		m_el                  = _root.attachMovie("mc_menu_bar", "menubar", p_depth);
		m_el._x               = p_x;
		m_el._y	              = p_y;

		m_theMenu			  = _root.attachMovie("mc_menu", "menu", p_depth-1);
		m_theMenu._visible    = false;
		
		m_infoImage           = _root.attachMovie("mc_image", "image", p_depth-2);
		m_infoImage._visible  = false;
		
		links				  = new Array();
		
		// mouse method for close button 
		m_theMenu.mc_menu_close.onRelease = function()
		{
			_root.Kosmos.menu.closeMenu();
		}	
	} 
	
	// CREATE PROJECTS MENU						
	public function makeProjects()
	{		
		var pList = _root.Crew.project().listStuff();
		var x = -120;
		var y = 0;
		for(i=0; i<pList.length;i++)
		{			
			links[i] 				= m_theMenu.content_projects.attachMovie("mc_menu_projects_text", "link"+i, 600+i);
			links[i].title.text 	= _root.Crew.project(pList[i]).display;
			links[i].category.text	= _root.Crew.project(pList[i]).category;
			links[i].id				= pList[i];
			
			if(i%8==0)	{	x += 115;	y = 0	}			
			// placement
			links[i]._x 			= x;
			links[i]._y 			= y * 33;		
			y++;
			
			links[i].onRelease = function()
			{
				_root.Kosmos.menu.closeMenu();
				_root.Kosmos.projectKosmos(this.id,2000);
			}			
		}
	}

	// CREATE PERSON MENU						
	public function makePerson()
	{		
		// hide/show the web link
		if(_root.Kosmos.currPerson.url=="")				m_theMenu.person_url._visible = false;
		else											m_theMenu.person_url._visible = true;
		// hide/show the project link
		if(_root.Kosmos.currPerson.project().length==0)	m_theMenu.person_project._visible = false;
		else											m_theMenu.person_project._visible = true;

		m_theMenu.person_description._visible			= true;
		m_theMenu.person_projects._visible				= false;
		m_theMenu.person_description.text				= _root.Kosmos.currPerson.description;
		
		//remove any old links
		for(var i=0;i<links.length;i++)	links[i].removeMovieClip();

		// create the persons links
		var x = -115;
		var y = 0;
		for(i=0; i<_root.Kosmos.currPerson.project().length;i++)
		{			
			links[i] 				= m_theMenu.person_projects.attachMovie("mc_menu_projects_text", "link"+i, 600+i);
			links[i].title.text 	= _root.Crew.project(_root.Kosmos.currPerson.project(i)).display;
			links[i].category.text	= _root.Crew.project(_root.Kosmos.currPerson.project(i)).category;
			links[i].id				= _root.Crew.project(_root.Kosmos.currPerson.project(i)).id;
			
			if(i%8==0)	{	x += 115;	y = 0	}			
			// placement
			links[i]._x 				= x;
			links[i]._y 				= y * 33;		
			y++;
			
			links[i].onRelease = function()
			{
				_root.Kosmos.menu.closeMenu();
				_root.Kosmos.menu.sceneChange();
				_root.Kosmos.projectKosmos(this.id,2000);
			}			
		}
	}

	// CREATE PROJECT MENU						
	public function makeProject()
	{		
		// hide/show the web link
		if(_root.Kosmos.currProject.url=="")			m_theMenu.project_url._visible = false;
		else											m_theMenu.project_url._visible = true;

		var pList = _root.Kosmos.currProject.worker().listStuff();
		
		// hide/show the workers link
		if(pList.length==0)								m_theMenu.project_worker._visible = false;
		else											m_theMenu.project_worker._visible = true;

		m_theMenu.project_description._visible			= true;
		m_theMenu.project_workers._visible				= false;
		m_theMenu.project_description.text				= _root.Kosmos.currProject.description;

		//remove any old links
		for(var i=0;i<links.length;i++)	links[i].removeMovieClip();

		// create the persons links
		var x = -115;
		var y = 0;
		for(i=0; i<pList.length;i++)
		{					
			links[i] 				= m_theMenu.project_workers.attachMovie("mc_menu_workers_text", "link"+i, 600+i);
			links[i].title.text 	= _root.Crew.person(pList[i]).display;
			links[i].role.text		= _root.Kosmos.currProject.worker(pList[i]).role;
			links[i].id				= _root.Crew.person(pList[i]).num;
			
			var C = new Color(links[i].title);
			if(_root.Crew.person(pList[i]).gender == "boy")	C.setRGB(0x00ffff);
			else	C.setRGB(0xff006a);
			
			if(i%8==0)	{	x += 115;	y = 0	}			
			// placement
			links[i]._x 			= x;
			links[i]._y 			= y * 33;		
			y++;
			
			links[i].onRelease = function()
			{
			  _root.Kosmos.menu.closeMenu();
			  _root.Kosmos.menu.sceneChange();
			  _root.Kosmos.personKosmos(this.id,2000);
			}					
		}
	}


	//change the text of the menubar
	public function setBarText()
	{
		var C = new Color(m_el.mc_menu_bar_current.box);
	
		if(_root.Kosmos.menuOut)
		{
			m_el.mc_menu_bar_current.box.text = "Back to kosmos";
			C.setRGB(0xffffff);
		}
		else 
		{	
			if(_root.Kosmos.currKosmos=="person")
			{
				m_el.mc_menu_bar_current.box.text = _root.Kosmos.currPerson.display;
				
				if(_root.Kosmos.currPerson.gender == "boy")	C.setRGB(0x00ffff);
				else	C.setRGB(0xff006a);
			}
			else
			{
				m_el.mc_menu_bar_current.box.text = _root.Kosmos.currProject.display;
				C.setRGB(0x00ff00);
			}
		}
	}
	
	
	// open up the image mc and change frame on the menubar
	public function sceneChange()
	{
		// if we're manually moving the kosmos... don't do a thing
		if(_root.Kosmos.scene.manualMove) return;
		
		// fix to prevent kosmos click from menu
		if(m_theMenu._visible) return;

		//if image is out.. then remove it and go back to kosmos
		if(_root.Kosmos.menuOut)
		{		
			m_infoImage._visible = false;
			
			_root.Kosmos.scene.doManual = true;
			_root.Kosmos.scene.doHoover = true;
			_root.Kosmos.scene.doRotate	= true;
			
			_root.Kosmos.menuOut = false;
			
			// set the menubar back to kosmos state
			m_el.gotoAndStop(1);
			
			// change the turnText
			_root.Kosmos.menu.changeTurnText();

			_root.addMainMouse();
			_root.addDotMouse();
		}
		// if image isn't out... make it live
		else
		{
			_root.removeMainMouse();
			_root.removeDotMouse();

			_root.Kosmos.scene.doManual = false;
			_root.Kosmos.scene.doHoover = false;
			_root.Kosmos.scene.doRotate	= false;
		
			m_infoImage._visible = true;
			
			// if current is a person
			if(_root.Kosmos.currKosmos=="person")
			{	
				// load image 
				m_infoImage.placeholder.loadMovie(_root.Crew.personImagePath+_root.Kosmos.currPerson.id+".jpg");
				// set the menubar to the person state
				m_el.gotoAndStop(2);
			}
			// if current is a project
			else
			{
				// load image
				m_infoImage.placeholder.loadMovie(_root.Crew.projectImagePath+_root.Kosmos.currProject.id+".jpg");
				// set the menubar to the project state
				m_el.gotoAndStop(3);
			}
			_root.Kosmos.menuOut = true;
		}
		
		_root.Kosmos.menu.setBarText();	
	}
	
	
	// hide/show the menubar and hide/show the projects/person/project menu 
	public function doMenu()
	{
		// if we're manually moving the kosmos... don't do a thing
		if(_root.Kosmos.scene.manualMove) return;

		// hide the menubar
		_root.removeMenubarMouse();
		m_el._visible 		= false;

		// show the menu
		m_theMenu._visible 	= true;
		
		if(!_root.Kosmos.menuOut)
		{
			_root.removeDotMouse();

			_root.Kosmos.menuOut 		= true;
			_root.Kosmos.scene.doManual = false;
			_root.Kosmos.scene.doHoover	= false;
			
			m_theMenu.gotoAndStop(1);
			
			// create the projects
			_root.Kosmos.menu.makeProjects();		
		}
		else if(_root.Kosmos.currKosmos=="person")
		{
			m_theMenu.gotoAndStop(2);

			// set color and text on the title
			var C = new Color(m_theMenu.title_person);
			if(_root.Kosmos.currPerson.gender == "boy")	C.setRGB(0x00ffff);
			else										C.setRGB(0xff006a);
			m_theMenu.title_person.text = _root.Kosmos.currPerson.display;

			// create person
			_root.Kosmos.menu.makePerson();
		}
		else
		{
			m_theMenu.gotoAndStop(3);
			
			// set the title text
			m_theMenu.title_project.text = _root.Kosmos.currProject.display;

			// create project
			_root.Kosmos.menu.makeProject();
		}		
	}

	public function closeMenu()
	{
		// hide the menu
		m_theMenu._visible 	= false;	
	
		// show the menubar
		m_el._visible 		= true;
		_root.addMenubarMouse();
		
		if(_root.Kosmos.menuOut&&m_theMenu._currentFrame==1)
		{
			_root.Kosmos.menuOut 		= false;
			_root.Kosmos.scene.doManual = true;
			_root.Kosmos.scene.doHoover	= true;

			_root.addDotMouse();
		}
	}


	public function turnTable()
	{
		// if we're manually moving the kosmos... don't do a thing
		if(_root.Kosmos.scene.manualMove) return;
		// safekeeper
		if(m_el.mc_menu_bar_turntable._visible == false)	return;
		// just to make sure these are set

		_root.Kosmos.personKosmos(_root.Kosmos.currPerson.num,2000);	
		_root.Kosmos.menu.changeTurnText();
	}
	
	public function changeTurnText()
	{
		if(_root.Kosmos.currKosmos == "project") 	m_el.mc_menu_bar_turntable._visible = false;
		else if(_root.Kosmos.turned)				m_el.mc_menu_bar_turntable.gotoAndStop(2);
		else										m_el.mc_menu_bar_turntable.gotoAndStop(1);
	}
	
	public function get el():MovieClip			{	return m_el;			} 
	public function get infoImage():MovieClip	{	return m_infoImage;		} 
	public function get theMenu():MovieClip		{	return m_theMenu;		} 

}

