$("#input-name").bind("input propertychange", function(){
		replaceAndSetPos($(this).get(0),/\s/g,'');
	});
	
	$("#input-name").blur(function(){
		if($('#input-name').val()==''){
			showAsError(errInfo);
			return;
		}
		$.ajax({
			url : "isExist",
			type : "POST",
			data : "name=" + $('#input-name').val(),
			dataType : "text",
			success : function(msg) {
				if (msg == '') {
					showAsOK();
				} else {
					showAsError(msg);
				}
			}
		});
	});
	
	$('#form-add').submit(function(){
		if($('#input-name').val()==''){
			showAsError(errInfo);
			return false;
		}
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