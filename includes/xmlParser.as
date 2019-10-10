

function parseXml(p_id)
{
	var file 			= new XML();							// create an xmlobject
	file.ignoreWhite	= true;									// something useful
	file.load(Crew.personXmlPath + p_id + ".xml");				// load the xmlfile defined
	file.onLoad 		= function()							// do stuff when file is loaded
	{	
		// variablehunt v1.0 (tm)
		var s_id:String 			= file.childNodes[0].attributes.id;
		var s_display:String 		= file.childNodes[0].attributes.dname;
		var s_gender:String 		= file.childNodes[0].attributes.gender;
		var s_img:String 			= Crew.personImagePath + file.childNodes[0].attributes.img;
		var s_url:String 			= file.childNodes[0].attributes.url;
		var s_mail:String 			= file.childNodes[0].attributes.mail;
		var s_description:String	= file.childNodes[0].childNodes[0].childNodes[0].nodeValue;		
		
		// add a person
		Crew.addPerson(s_id,s_display,s_gender,s_img,s_url,s_mail,s_description);
		
		// relationhunt...phew... getting just the required stuff
		for(var i=0; i<file.childNodes[0].childNodes[1].childNodes.length; i++)	
		{	
		  var s_fid:String 			= file.childNodes[0].childNodes[1].childNodes[i].attributes.id;
		  var s_frelation:Number	= file.childNodes[0].childNodes[1].childNodes[i].childNodes[0].nodeValue;

		  Crew.person(s_id).addFriend(s_fid, s_frelation);
		}
		
		// if there's still persons left to be parsed...
		if(Crew.xmlParsedPersons<Crew.personList().length-1)
		{	
			// checks how many percent done
			Crew.xmlParsedPersonPercent = Math.round((Crew.xmlParsedPersons/Crew.personList().length)*100);
	
			// increment the parsedPerson count
			Crew.xmlParsedPersons++;
			
			// if debug...
			if(Crew.debug)	trace(s_display + " parsed! / " + Crew.xmlParsedPersonPercent);
	
			// and do the parse again..with the next person			
			parseXml(Crew.personList(Crew.xmlParsedPersons));
		}
		else
		{
			// delete the xml object from memory...
			delete file;
			
			// sets the loaded percent to 100
			Crew.xmlParsedPersonPercent = 100;
			
			if(Crew.debug)	trace("-------END OF PERSONPARSE ("+Crew.xmlParsedPersonPercent+")--------")
		
			// do the project file
				parseProject();	
		}
	}	
}


function parseProject()
{
	var file 			= new XML();							// create an xmlobject
	file.ignoreWhite	= true;									// something useful
	file.load(Crew.projectXmlPath);								// load the xmlfile defined
	file.onLoad 		= function()							// do stuff when file is loaded
	{	
		for(var i=0; i<file.childNodes.length; i++)	 			
		{
			// if projectlist
			if(i==0)
			{
				for(var j=0; j<file.childNodes[i].childNodes.length; j++)	 			
				{
					var s_cid		= file.childNodes[i].childNodes[j].attributes.id;
					var s_cdisplay	= file.childNodes[i].childNodes[j].attributes.display;
					
					Crew.addProjectCategory(s_cid,s_cdisplay);
					
					// debug
					if(Crew.debug)	trace(s_cid + " category added");
				}
			}
			// if project
			else
			{
				var s_id			= file.childNodes[i].attributes.id;
				var s_display		= file.childNodes[i].attributes.display;
				var s_category		= file.childNodes[i].attributes.category;
				var s_img			= Crew.projectImagePath + file.childNodes[i].attributes.img;
				var s_url			= file.childNodes[i].attributes.url;	
				var s_description	= file.childNodes[i].childNodes[0].childNodes[0].nodeValue;
				
				// add project
				Crew.addProject(s_id,s_display,s_category,s_img,s_url,s_description);
				
				if(Crew.debug)	trace("-----------");
				
				for(var j=0; j<file.childNodes[i].childNodes[1].childNodes.length; j++)	
				{
					var s_wid 		= file.childNodes[i].childNodes[1].childNodes[j].attributes.id;
					var s_role		= file.childNodes[i].childNodes[1].childNodes[j].attributes.role;
					
					// add worker to current project
					Crew.project(s_id).addWorker(s_wid,s_role);

					// added current project to person object
					Crew.person(s_wid).addProject(s_id);
					
					if(Crew.debug)	trace(s_wid + " added as involved in: " + s_id);
				}
				
				// checks how many percent done
				Crew.xmlParsedProjectPercent = Math.round((i/file.childNodes.length)*100);
			
				// debug message
				if(Crew.debug)	trace("parsed " + s_display + " / " + Crew.xmlParsedProjectPercent);
			}
		}
		// delete the xml object from memory...		
		delete file;
		
		// sets the loaded percent to 100
		Crew.xmlParsedProjectPercent = 100;
		
		Crew.xmlLoaded	= true
		
		if(Crew.debug)	trace("-------END OF PROJECTPARSE ("+Crew.xmlParsedProjectPercent+")--------");
	}
}
