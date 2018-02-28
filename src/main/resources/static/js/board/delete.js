/**
 * 
 */
$(document).ready(function(){
  
  $(".delete").click(function(){
	  var data = {"id" : this.value};
	  bootbox.confirm({
 			size: "small",
	    message: "Are you sure delete it?",
	    buttons: {
	        confirm: {
	            label: 'Yes',
	            className: 'btn-danger'
	        },
	        cancel: {
	            label: 'No',
	            className: 'btn-default'
	        }
	    },
	    callback: function (result) {
        if (result) {
        	$.ajax({
      	    url: '/board/delete',
      	    type: 'POST',
      	    data: data,
      	    success: function(data) {
      	    	if(data.message == "success"){
      	  	    location.reload();  	
      	    	} else {
      	    		console.log(data);
      	    	}
      	    }
        	});
        }
	    }
		});
  });
});