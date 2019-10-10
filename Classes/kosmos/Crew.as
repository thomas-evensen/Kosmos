
// yes..lets make love to the Crew class... the mother of all that is kosmos
class kosmos.Crew
{
	var a_person:Array 						= new Array();
	var a_project:Array 					= new Array();
	var a_projectCategory:Array 			= new Array();
	
	var s_currentPerson:String				= "";
	var s_currentProject:String 			= "";
	
	var a_displayAttributes:Array 			= new Array();
	var a_displayRelations:Array 			= new Array();
	var a_personList:Array 					= new Array();
	
	var s_personImagePath:String 			= "img/persons/";
	var s_projectImagePath:String 			= "img/projects/";
	var s_personXmlPath:String 				= "xml/persons/";
	var s_projectXmlPath:String 			= "xml/project.xml";
	
	var b_xmlLoaded:Boolean 				= false;
	var n_xmlParsedPersons:Number 			= 0;
	var n_xmlParsedPersonPercent:Number 	= 0;
	var n_xmlParsedProjectPercent:Number 	= 0;
	
	var b_debug:Boolean 					= false;
	
	// person array
	public function addPerson(p_id:String,p_display:String,p_gender:String,p_img:String,p_url:String,p_mail:String,p_description:String):Void
	{	
		a_person[p_id] = new kosmos.relation.Person(p_id,p_display,p_gender,p_img,p_url,p_mail,p_description);
	}	
	public function person(p_id:String)	
	{	
		if(p_id==null) return a_person; else return a_person[p_id];
	}
	// end person array
	
	// project array
	public function addProject(p_id:String, p_display:String, p_category:String, p_img:String, p_url:String, p_description:String):Void
	{	
		a_project[p_id] = new kosmos.relation.Project(p_id,p_display,p_category,p_img,p_url,p_description);
	}	
	public function project(p_id:String)	
	{	
		if(p_id==null) return a_project; else return a_project[p_id];
	}
	// end project array
	
	// projectCategory array
	public function addProjectCategory(p_id:String,p_display:String):Void
	{	
		a_projectCategory[p_id] = new kosmos.relation.Category(p_id,p_display);
	}	
	public function projectCategory(p_id:String)	
	{	
		if(p_id==null) return a_projectCategory; else return a_projectCategory[p_id];
	}
	// end projectCategory array

	// personList array
	public function addPersonList(p_id:String):Void
	{
		a_personList[a_personList.length] = p_id;
	}
	public function personList(p_id:Number)
	{
		if(p_id==null)	return a_personList; else return a_personList[p_id]; 
	}
	// end personlist array
	
	
	// get and set the parsed numbers
	public function	get xmlParsedPersons():Number					{	return n_xmlParsedPersons;				}
	public function	set xmlParsedPersons(p_num:Number):Void			{	n_xmlParsedPersons = p_num;				}
	public function	get xmlParsedPersonPercent():Number				{	return n_xmlParsedPersonPercent;		}
	public function	set xmlParsedPersonPercent(p_num:Number):Void	{	n_xmlParsedPersonPercent = p_num;		}
	public function	get xmlParsedProjectPercent():Number			{	return n_xmlParsedProjectPercent;		}
	public function	set xmlParsedProjectPercent(p_num:Number):Void	{	n_xmlParsedProjectPercent = p_num;		}
	
	// get the paths
	public function	get personImagePath():String					{	return s_personImagePath;				}
	public function	get personXmlPath():String						{	return s_personXmlPath;					}
	public function	get projectImagePath():String					{	return s_projectImagePath;				}
	public function	get projectXmlPath():String						{	return s_projectXmlPath;				}
	
	// get and set current variables
	public function	get currentPerson():String						{	return s_currentPerson;					}	
	public function	get currentProject():String						{	return s_currentProject;				}	
	public function	set currentPerson(p_id:String):Void				{	s_currentPerson = p_id;					}	
	public function	set currentProject(p_id:String):Void			{	s_currentProject = p_id;				}	
	
	// get and set xmlLoaded variable
	public function	get xmlLoaded():Boolean							{	return b_xmlLoaded;						}	
	public function	set xmlLoaded(p_loaded:Boolean):Void			{	b_xmlLoaded = p_loaded;					}	
	
}