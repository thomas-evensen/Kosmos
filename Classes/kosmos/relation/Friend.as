
class kosmos.relation.Friend
{
	var s_id:String;
	var n_relation:Number;
	var a_attribute:Array;
	
	public function Friend(p_id:String,p_relation:Number)
	{
		s_id 		= p_id;
		n_relation	= p_relation;
		a_attribute	= new Array();
	}

	// get an attribute
	public function attribute(p_id:String)
	{
		if(p_id==null) return a_attribute; else return a_attribute[p_id];
	}
	// add an attribute
	public function addAttribute(p_attribute:String):Void
	{
		a_attribute[p_attribute] = true;
	}
	
	// get some stuff
	public function	get id():String					{	return s_id;				}
	public function	get relation():Number			{	return n_relation;			}
}
