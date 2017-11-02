<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>index</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">




</head>
<body style="padding-top: 70px;">
	<jsp:include page="head.jsp" flush="true" />
	<jsp:include page="manager-left.jsp" flush="true" />

	<div style="width: 800px; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">人事管理</li>
			<li class="active">添加部门</li>
		</ol>

		<div style="width: 50%">
			<form id="form-add" 
				action="${pageContext.request.contextPath}/department/add"
				class="form-horizontal" method="post">
				<div id="form-group-add" class="form-group has-feedback" style="margin-bottom: 0px">
					<label for="input-add" class="col-sm-3 control-label">部门名</label>
					<div class="col-sm-8">
						<input name="name" type="text" class="form-control" id="input-name"
							maxlength="24" placeholder="请输入部门名" required autofocus>
							<span id="span-icon" class="glyphicon form-control-feedback"></span>
							<span id="hint"
							style="color: red; visibility: hidden; padding-left:5px">提示信息</span>
					</div>

				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-8">
						<button id="btn-add" type="submit" class="btn btn-sm btn-primary pull-right"
						style="padding-left: 20px; padding-right: 20px">添加</button>
					</div>
				</div>
			</form>
		</div>

	</div>



</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/custom.js"></script>

<script type="text/javascript">
	/*$("#input-name").bind("input propertychange", function(){
		$(this).val($(this).val().replace(/\s/g,""));
	});*/
	$("#input-name").bind("input propertychange", function(){
		replaceAndSetPos($(this).get(0),/\s/g,'');
	});
	
	$("#input-name").blur(function(){
		if($('#input-name').val()==''){
			showAsError("请输入部门名");
			return;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/department/isExist",
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
			showAsError("请输入部门名");
			return false;
		}
		var ret;
		$.ajax({
			url : "${pageContext.request.contextPath}/department/isExist",
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
	
	
</script>

</html>