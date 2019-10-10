
// the main file

	// create the kosmos object
	var Kosmos = new kosmos.Kosmos();
	
	// create a scene
	Kosmos.addScene(249,169,0,1,300);
	
	// loop throught the persons
	for(var i=0;i<Crew.personList().length;i++)
	{
		// add a member to the scene for each person in the crew
		Kosmos.scene.addMember(Crew.personList(i), 100+i);
	}
	// add dot mouse
	_root.addDotMouse();
	
	Kosmos.addMenu(0, 322, 500);
	
	// start with the crew project
	Kosmos.projectKosmos("crew", 2000);
	
	// add main mouse
	_root.addMainMouse();
