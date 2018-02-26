/**
 * Define our DApp logic constructor, 
 * for use it in frontend and bankroller side
 */
DCLib.defineDAppLogic('vrducks', function(){
	const _self = this

	var maketx = function(n,random_hash){
		// add result to paychannel
		const random_num = DCLib.numFromHash(random_hash, 0, 1);
		if (random_num == 1) _self.payChannel.addTX( 1 )
		if (random_num == 0) _self.payChannel.addTX( -1 )	
		return random_num
	}

	return {
		maketx    : maketx
	}
})