function getImageReady( product_id, destination ){
	var dest = "'" + destination + "'"; 
	var funct =  "getStatus(" +  product_id + ","   +    dest  +")"; 
	setTimeout( funct , 3000);
}

function getStatus( product_id, destination){
	var data = {
		'product_id' : product_id
	};
	
	// alert( "The interval id inside is " + intervalID);
	$.ajax({
	  url: destination,
	  dataType: 'json',
	  data: data,
	  success: function(response){
			if(response.status == 'OK'){
				replaceImage(product_id, response.image_location);
				// alert("The status is " + response.status) ;
				console.log("ok " + response.image_location);
				// alert("the interval id is " + response.interval_id )
				
			}
			else{
				// alert("not ok yet");
				console.log("not ok yet");
				getImageReady( product_id, destination )
			}
		}
	});
}

function replaceImage(product_id, image_location){
	$("#product-image-" + product_id + " img").attr('src',image_location );
}

