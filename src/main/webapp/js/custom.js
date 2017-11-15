	$("input[type='text']").focus(function(){
		showAsNormal();
	});
	
	$('#form-add').submit(function(){
		
		var ret;
		$.ajax({
			url : "isExist",
			type : "POST",
			data : "name=" + $('#input-name').val(),
			dataType : "text",
			async: false,
			success : function(msg) {
				ret = msg;
			}
		});
		if (ret == '') {
			showAsOK();
		} else {
			showAsError(ret);
			return false;
		}
	});
	
	function showAsNormal(){
		$('#hint').css("visibility", "hidden");
		$('#form-group-add').removeClass("has-error");
		$('#form-group-add').removeClass("has-success");
		$('#span-icon').removeClass("glyphicon-remove");
		$('#span-icon').removeClass("glyphicon-ok");
	}
	function showAsOK(){
		$('#hint').css("visibility", "hidden");
		$('#form-group-add').removeClass("has-error");
		$('#form-group-add').addClass("has-success");
		$('#span-icon').removeClass("glyphicon-remove");
		$('#span-icon').addClass("glyphicon-ok");
	}
	
	function showAsError(msg){
		$('#hint').html(msg);
		$('#hint').css("visibility", "visible");
		$('#form-group-add').removeClass("has-success");
		$('#form-group-add').addClass("has-error");
		$('#span-icon').removeClass("glyphicon-ok");
		$('#span-icon').addClass("glyphicon-remove");
	}