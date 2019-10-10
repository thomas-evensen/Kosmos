
class kosmos.math.Point
{
	var n_x:Number;
	var n_y:Number;
	var n_z:Number;
	var n_scaleRatio:Number;
	var n_depth:Number;
	
	public function Point(p_x:Number,p_y:Number,p_z:Number)
	{
		n_x = p_x;
		n_y = p_y;
		if(p_z == null) n_z = 1; else n_z = p_z;
	
		n_scaleRatio 	= 0;
		n_depth			= 0;
	}
	
	public function get x()				{	return n_x;		}
	public function set x(p_x:Number)	{	n_x = p_x;		}
	public function get y()				{	return n_y;		}
	public function set y(p_y:Number)	{	n_y = p_y;		}
	public function get z()				{	return n_z;		}
	public function set z(p_z:Number)	{	n_z = p_z;		}
	
	public function get scaleRatio()			{	return n_scaleRatio;	}
	public function set scaleRatio(p_n:Number)	{	n_scaleRatio = p_n;		}
}