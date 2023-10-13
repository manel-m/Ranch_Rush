// check if player is holding any produce (flower crate)
function holdings_has_produce(){
	
	var _holding_product = false;
	for (var _i = 0; _i < 3; _i++) {
		// if (holdings[_i] == PLAYER_HOLDING.FLOWER_CRATE /*or TOMATO_CRATE*/)
		if (holding_is_plant(holdings[_i]))
			_holding_product = true;
	}
	return _holding_product;
}

function holding_is_plant(_holding) {
	switch (_holding) {
		case PLAYER_HOLDING.FLOWER_CRATE:
			return true;
		case PLAYER_HOLDING.TOMATO_CRATE:
			return true;	
		default:
			return false;
	}
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
		if (!holding_is_plant(holdings[0]) and holdings[0] != PLAYER_HOLDING.CRATE)
			holdings[0] = PLAYER_HOLDING.CRATE;
		else if (!holding_is_plant(holdings[1]) and holdings[1] != PLAYER_HOLDING.CRATE)
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

function holdings_pickup_plant_crate(_crate_type) {
    // replace an empty crate with a plants crate to the holdings
	if (holdings[0] == PLAYER_HOLDING.CRATE)
		holdings[0] = _crate_type;
	else if (holdings[1] == PLAYER_HOLDING.CRATE)
		holdings[1] = _crate_type;
	else
		holdings[2] = _crate_type;
}

function holdings_draw_crate(_holding, _x, _y) {
	var _crate_sprite = noone;

	if (_holding == PLAYER_HOLDING.CRATE)
		_crate_sprite = spr_crate;
	else if (_holding == PLAYER_HOLDING.FLOWER_CRATE)
		_crate_sprite = spr_flower_crate;
	else if (_holding == PLAYER_HOLDING.TOMATO_CRATE)
		_crate_sprite = spr_tomato_crate;
	else
		_crate_sprite = noone;
		
	if (_crate_sprite != noone)
		draw_sprite_ext(_crate_sprite, 0, _x, _y, 0.5, 0.5, 0,c_white, 1 );
}















