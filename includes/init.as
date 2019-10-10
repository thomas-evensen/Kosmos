

// Start the shmuck by creating a Crew object

var Crew = new kosmos.Crew();

// populate the Crew.personList array to help parse the person xmldata
Crew.addPersonList("tina_ahl");
Crew.addPersonList("seif_al_hasini");
Crew.addPersonList("louise_altmann");
Crew.addPersonList("henrik_augustin");
Crew.addPersonList("christian_berggren");
Crew.addPersonList("joakim_borg");
Crew.addPersonList("dag_henning_brandsater");
Crew.addPersonList("herman_carlsson");
Crew.addPersonList("erik_dyrnes");
Crew.addPersonList("jens_elgeskog");
Crew.addPersonList("thomas_evensen");
Crew.addPersonList("andreas_gebauer");
Crew.addPersonList("peter_grundstrom");
Crew.addPersonList("emanuel_hallklint");
Crew.addPersonList("erik_hedberg");
Crew.addPersonList("jonatan_hedberg");
Crew.addPersonList("jonas_henrikson");
Crew.addPersonList("albert_isaksson");
Crew.addPersonList("jens_janson");
Crew.addPersonList("christian_knutsson");
Crew.addPersonList("daniel_kvist");
Crew.addPersonList("andreas_kallbom");
Crew.addPersonList("daniel_kallbom");
Crew.addPersonList("robert_lenne");
Crew.addPersonList("linda_leow");
Crew.addPersonList("jenny_lilja");
Crew.addPersonList("tobias_martinsson");
Crew.addPersonList("mattias_mattiasson");
Crew.addPersonList("sun_nilsson");
Crew.addPersonList("ulrica_nilsson");
Crew.addPersonList("karin_odebrant");
Crew.addPersonList("erik_persson");
Crew.addPersonList("jonas_persson");
Crew.addPersonList("niklas_persson");
Crew.addPersonList("sofia_person");
Crew.addPersonList("alexander_samoceta");
Crew.addPersonList("johan_sjostrand");
Crew.addPersonList("asa_svensson");
Crew.addPersonList("lars_tengen");
Crew.addPersonList("klas_thorsen");
Crew.addPersonList("par_tangeberg");
Crew.addPersonList("daniel_wall");
Crew.addPersonList("viggo_wedborn");
Crew.addPersonList("rasmus_wikman");

parseXml(Crew.personList(Crew.xmlParsedPersons));


// if the need for getting the elements of an associative array... use this function..
// or elements of it. It takes the array and breaks it down into the elements
// and spists out a new array with the old elements in numeric array order
// NOTE THAT THE STUFF ARRAY IN SOME CASES MUST BE REVERSED..PLEASE CHECK
// this is ugly and NOT good as2 practice

Array.prototype.listStuff = function(r)
{	
	var stuff:Array	= new Array();
	for (var i in this)	stuff[stuff.length]	= i;
	if(r==null) stuff.reverse();
	stuff.splice(-1,1);
	return stuff;
}
