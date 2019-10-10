

class kosmos.relation.Person
{
	var s_id:String;
	var n_num:Number;
	var s_display:String;
	var s_gender:String;
	var s_img:String;
	var s_url:String;
	var s_mail:String;
	var s_description:String;
	
	var a_project:Array;
	var a_attribute:Array;
	var a_friend:Array;
	
	public function Person(p_id:String,p_display:String,p_gender:String,p_img:String,p_url:String,p_mail:String,p_description:String)
	{
		s_id 				= p_id;
		n_num				= _root.Crew.person().listStuff().length;
		s_display			= p_display;
		s_gender			= p_gender;
		s_img				= p_img;
		s_url				= p_url;
		s_mail			= p_mail;
		s_description		= p_description;

		a_project			= new Array();
		a_attribute			= new Array();
		a_friend			= new Array(44);
	}

	// get a friend
	public function friend(p_id:String)
	{
		if(p_id==null)	return a_friend; else return a_friend[p_id];
	}
	// add a friend
	public function addFriend(p_id:String,p_relation:Number):Void
	{
		a_friend[p_id] = new kosmos.relation.Friend(p_id,p_relation);
	}

	// get a project
	public function project(p_id:String)
	{
		if(p_id==null)	return a_project; else	return a_project[p_id];
	}
	// add a project
	public function addProject(p_id:String):Void
	{
		a_project[a_project.length] = p_id;
	}
	
	// get an attribute
	public function attribute(p_attribute:String)
	{
		if(p_attribute==null)	return a_attribute; else return a_attribute[p_attribute];
	}
	// add an attribute
	public function addAttribute(p_attribute:String):Void
	{
		a_attribute[p_attribute] = true;
	}
	
	// get methods
	public function	get id():String					{	return s_id;				}
	public function	get num():Number				{	return n_num;				}
	public function get display():String			{	return s_display;			}
	public function get gender():String				{	return s_gender;			}
	public function get img():String				{	return s_img;				}
	public function get url():String				{	return s_url;				}
	public function get mail():String				{	return s_mail;				}
	public function get description():String		{	return s_description;		}
}