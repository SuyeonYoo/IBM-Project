/**
 * 
 */
$(document).ready(function(){
  
	$('.content').click(function(e) { 
	  $.ajax({
      url: '/board/' + $(this).parent().attr("id"),
      type: 'GET',
      success: function(data) {
        if(data.message == "success"){
          $("#readPostModal").modal();
          $("#readPostTitle").val(data.result.title);
          $("#readPostContents").val(data.result.contents);

          $("#readPostNumber").text(data.result.id);
          $("#readPostAuthor").text(data.result.author);
          $("#readPostRegDate").text(data.result.reg_date);
          $("#readPostModDate").text(data.result.mod_date);
          
          $("#readAttachment").empty();
          for (i = 0; i < data.attachmentList.length; i++) { 
            $("#readAttachment").append('<a href="'
                                        + data.attachmentList[i].localPath
                                        +'" target="_blank">'
                                        + '<span><i class="fa fa-file"></i> ' 
                                        + data.attachmentList[i].name
                                        + ' <sub>('
                                        + data.attachmentList[i].size / 1000
                                        + 'KB)</sub></sapn></a>')
          }
            

         
          
          
        } else {
          console.log(data);
        }
      }
    });
  	
	});
});