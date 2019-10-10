
dynamic class kosmos.visual.Dot extends MovieClip 
{	
	var s_id:String;
	var n_id:Number;
	var m_el:MovieClip;
	var m_name;
	var m_line:MovieClip;
	var o_pos;
	var o_newPos;
	var v_interval;
	var v_deathTime;
	var n_frameTime:Number;
	
	public function Dot(p_id:String, p_depth:Number)
	{
		// add the id
		s_id = p_id;
		n_id = p_depth-100;
		
		// add the dot movieclip and set some handlers
		m_el = _root.Kosmos.scene.el.attachMovie("mc_person_"+_root.Crew.person(s_id).gender,"dot"+n_id,p_depth);
		
		// set the name text
		m_el.mc_name.box.text = _root.Crew.person(s_id).display;
		
		// hide the project dot
		m_el.mc_dot.mc_worked._visible = false;

		// set some visual stuff
		m_el._x 		= -1000;
		m_el._y 		= -1000;

		o_pos			= new kosmos.math.Point(0,0,0);	
		o_newPos 		= new kosmos.math.Point(0,0,0);
		
		// anim variables
		v_deathTime		= false;
		v_interval		= false;
		n_frameTime		= 300;
		
		// attach the dot id to the movieclip for reference
		m_el.mc_dot.id			= n_id;
	}
	
	public function slideTo(p_dur:Number)
	{
		// create the time when the sliding stops
		if(v_deathTime == false) v_deathTime = new Date().valueOf() + p_dur;
		
		var currTime = new Date().valueOf();
		
		// if time is up
		if(currTime > v_deathTime)
		{
			// set at the end points
			o_pos.x = o_newPos.x;
			o_pos.y = o_newPos.y;
			o_pos.z = o_newPos.z;
			
			// clear the loop vars
			clearInterval(v_interval);
			v_interval = false;
			v_deathTime = false;
			
			// stop the slide and reset some variables
			_root.Kosmos.scene.endSlide();
		}
		//else do the slide
		else
		{			
			var lifeTime	= currTime - v_deathTime;
			var steps 		= lifeTime/n_frameTime;

			o_pos.x = o_pos.x - ((o_newPos.x - o_pos.x)/steps);
			o_pos.y = o_pos.y - ((o_newPos.y - o_pos.y)/steps);
			o_pos.z = o_pos.z - ((o_newPos.z - o_pos.z)/steps);
		}	
	}

	
	public function get pos()				{	return o_pos;		}
	public function get newPos()			{	return o_newPos;	}
	
	public function get el():MovieClip		{	return m_el;		}
	public function get id():String			{	return s_id;		}
	public function get nid():Number		{	return n_id;		}
	
	public function get interval()			{	return v_interval;	}
	public function set interval(p_i)		{	v_interval = p_i;	}
}
