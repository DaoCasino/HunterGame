/**
 * Define our DApp logic constructor, 
 * for use it in frontend and bankroller side
 */
DCLib.defineDAppLogic('paritytest', function(){
	const _self = this

	var maketx = function(n){
		// add result to paychannel
		if (n == 1) _self.payChannel.addTX( 1 )
		if (n == -1) _self.payChannel.addTX( -1 )	
		return true;
	}

	return {
		maketx    : maketx
	}
})