/**
 * 
 */
function updatePost(){
  var data = {"id" : $("#updatePostNumber").text(), "title" : $("#updatePostTitle").val(), "contents" : $("#updatePostContents").val()};
  console.log(data);
  $.ajax({
    url: '/board/update',
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

$(document).ready(function(){
  
  $(".update").click(function(){
	  var path = this.value;
	  bootbox.confirm({
 			size: "small",
	    message: "Are you sure update it?",
	    buttons: {
	        confirm: {
	            label: 'Yes',
	            className: 'btn-info'
	        },
	        cancel: {
	            label: 'No',
	            className: 'btn-default'
	        }
	    },
	    callback: function (result) {
        if (result) {
          $.ajax({
            url: '/board/' + path,
            type: 'GET',
            success: function(data) {
              if(data.message == "success"){
                $("#updatePostModal").modal();
                $("#updatePostTitle").val(data.result.title);
                $("#updatePostTitle").removeAttr('readonly');
                $("#updatePostContents").val(data.result.contents);
                $("#updatePostContents").removeAttr('readonly');
                
                $("#updatePostNumber").text(data.result.id);
                $("#updatePostAuthor").text(data.result.author);
                $("#updatePostRegDate").text(data.result.reg_date);
                $("#updatePostModDate").text(data.result.mod_date);
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