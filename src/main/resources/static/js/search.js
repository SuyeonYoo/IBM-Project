/**
 * Search 자동검색
 */
var ArrResult = new Array();

$( document ).ready(function() {
	$('#search').focus();
	
	/* 검색어 입력 시 */
	$("#search").keyup(function(){
		var title = $("[name=title]").val();
		var data = {"title" : title};
		console.log(title);
		
		$.ajax({
			type : 'POST',
			url : '/board/searchtxt',
			data : data,
			success:function(result){
      	
	      	if(result.resultList.length > 0)
	      		ArrResult.length = 0;
      	
			for (var i=0; i < result.resultList.length; i++){
				ArrResult.push(result.resultList[i].title);	
			}
			console.log(ArrResult);
				/* $('#rcmd_Searchtxt').append("<option value='"+result.resultList[i].title+"'>"); */
				/* $('#rcmd_Searchtxt').append("<option value='"+result.resultList[i].no+"'>"+result.resultList[i].title+"</option>"); */
			}
		});
		
	});	
	
	/* 검색어  자동완성 */
	$('#search').typeahead({
    source: ArrResult
	})/*.on('typeahead:selected', function() {
		 if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			 $(this).undbind();
			 $("#btnSearch").trigger("click");
	    }
	});*/;
	
	$('#search').on('typeahead:selected', function(event, selection) {
	  alert(selection.value);
	});

	
	/* 검색 버튼 클릭 시*/
	$("#btnSearch").click(function(){
		var title = $("[name=title]").val();
		var data = {"title" : title};
		
		if(title.trim() == "" || title.trim() == null) {
			$("#alertModal").find(".modal-body").text("검색어를 입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		}

		/* $("#frmSearchtxt").attr("action", "/main/"+title).submit(); */
		$(location).attr('href', "/board/main/"+title);

	});
	
});