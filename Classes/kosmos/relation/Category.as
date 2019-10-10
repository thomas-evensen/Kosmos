
class kosmos.relation.Category
{
	var s_id:String;
	var s_display:String;
	
	public function Category(p_id:String,p_display:String)
	{
		s_id		= p_id;
		s_display	= p_display;
	}

	public function get id():String			{	return s_id;		}	
	public function get display():String	{	return s_display;	}	
}