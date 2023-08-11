// check if player is holding any produce (flower crate)
function holdings_has_produce(){
	
	var _holding_product = false;
	for (var _i = 0; _i < 3; _i++) {
		if (holdings[_i] == PLAYER_HOLDING.PLANTS_CRATE)
			_holding_product = true;
	}
	return _holding_product;
}


function holdings_remove_all () {
// remove all holdings
	holdings[0] = PLAYER_HOLDING.NONE;
	holdings[1] = PLAYER_HOLDING.NONE;
	holdings[2] = PLAYER_HOLDING.NONE;
}


function holdings_pickup_crate() {
	
	// possible cases for holdings:
		// 1. holding nothing
		// 2. holding a tool or a seedbag (just one)
		// 3. holding one or more crates (empty or not)
			
		// we want to check if we can pick another crate
		// only case we can't pick a crate is if holdings[2] is not NONE

	if (holdings[2] == PLAYER_HOLDING.NONE) {

		// fill the correct holdings[] cell
		if (holdings[0] != PLAYER_HOLDING.PLANTS_CRATE and holdings[0] != PLAYER_HOLDING.CRATE)
			holdings[0] = PLAYER_HOLDING.CRATE;
		else if (holdings[1] != PLAYER_HOLDING.PLANTS_CRATE and holdings[1] != PLAYER_HOLDING.CRATE)
			holdings[1] = PLAYER_HOLDING.CRATE;
		else
			holdings[2] = PLAYER_HOLDING.CRATE;
			
		return true;
	}
	return false;
}

function holdings_has_empty_crate () {

    // is the player holding at least one empty crate ?
	if (holdings[0] == PLAYER_HOLDING.CRATE || 
		holdings[1] == PLAYER_HOLDING.CRATE ||
		holdings[2] == PLAYER_HOLDING.CRATE) {
		
		return true;	
	}
	return false;
}

function holdings_remove_all_produce () {

    // remove all produce
	var _num_empty_crates = 0;
	for (var _i = 0; _i < 3; _i++) {
		if (holdings[_i] == PLAYER_HOLDING.CRATE) {
			_num_empty_crates += 1;
		}
					
		holdings[_i] = PLAYER_HOLDING.NONE;
	}
	// we put back the empty crates
	for (var _i = 0; _i < _num_empty_crates; _i++) {
		holdings[_i] = PLAYER_HOLDING.CRATE;
	}

}


function holdings_pickup_plant_crate() {

    // replace an empty crate with a plants crate to the holdings
	if (holdings[0] == PLAYER_HOLDING.CRATE)
		holdings[0] = PLAYER_HOLDING.PLANTS_CRATE;
	else if (holdings[1] == PLAYER_HOLDING.CRATE)
		holdings[1] = PLAYER_HOLDING.PLANTS_CRATE;
	else
		holdings[2] = PLAYER_HOLDING.PLANTS_CRATE;

}

















