<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>xx管理系统</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">




</head>
<body style="padding-top: 64px;">
	<jsp:include page="head.jsp" flush="true" />
	<jsp:include page="manager-left.jsp" flush="true" />

	<div style="width: 800px; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">个人中心</li>
			<li class="active">最新通知</li>
		</ol>
		
		<h1>首页</h1>
		
		

	</div>

	
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/custom.js"></script>

<script type="text/javascript">
	

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