
class kosmos.relation.Worker
{
	var s_id:String;
	var s_role:String;
	
	public function Worker(p_id:String,p_role:String)
	{
		s_id		= p_id;
		s_role		= p_role;
	}

	public function get id():String			{	return s_id;		}	
	public function get role():String		{	return s_role;		}	
}