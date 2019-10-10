
class kosmos.relation.Project
{
	var s_id:String;
	var s_display:String;
	var s_category:String;
	var s_img:String;
	var s_url:String;
	var s_description:String;
	var a_worker:Array;
	
	public function Project(p_id:String, p_display:String, p_category:String, p_img:String, p_url:String, p_description:String)
	{
		s_id			= p_id;
		s_display		= p_display;
		s_category		= p_category;
		s_img			= p_img;
		s_url			= p_url;
		s_description	= p_description;
		a_worker		= new Array();
	}
	
	public function addWorker(p_id:String, p_role:String)
	{
		a_worker[p_id]	= new kosmos.relation.Worker(p_id,p_role);
	}
	public function worker(p_id)
	{
		if(p_id==null)	return a_worker; else return a_worker[p_id];
	}
	
	public function get id()			{	return s_id;			}
	public function get display()		{	return s_display;		}
	public function get category()		{	return s_category;		}
	public function get img()			{	return s_img;			}
	public function get url()			{	return s_url;			}
	public function get description()	{	return s_description;	}
}