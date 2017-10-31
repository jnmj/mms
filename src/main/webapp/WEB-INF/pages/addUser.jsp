<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>index</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">


<style type="text/css">
.reduce-margin {
	margin-bottom: 6px
}

.err-info {
	color: red;
	padding-left: 5px;
	visibility: hidden
}
</style>

</head>
<body style="padding-top: 70px;">
	<jsp:include page="head.jsp" flush="true" />
	<jsp:include page="manager-left.jsp" flush="true" />

	<div style="width: 800px; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">人事管理</li>
			<li class="active">添加员工</li>
		</ol>
		<div style="width: 60%">
			<form action="${pageContext.request.contextPath}/user/add"
				class="form-horizontal" role="form" method="post">
				<div class="form-group has-feedback reduce-margin">
					<label for="input-id" class="col-sm-3 control-label">工号</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="input-id" name="id"
							placeholder="请输入10位工号" required autofocus> <span
							id="span-icon-id" class="glyphicon form-control-feedback"></span>
						<span class="err-info" style="visibility: visible">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-name" class="col-sm-3 control-label">姓名</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="input-name"
							name="name" placeholder="请输入姓名" required> <span
							id="span-icon-name" class="glyphicon form-control-feedback"></span>
						<span class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-password" class="col-sm-3 control-label">密码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="input-password"
							name="password" placeholder="请输入6-16位密码" required> <span
							id="span-icon-password" class="glyphicon form-control-feedback"></span>
						<span class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-password2" class="col-sm-3 control-label">确认密码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="input-password2"
							name="password2" placeholder="请确认密码" required> <span
							id="span-icon-password2" class="glyphicon form-control-feedback"></span>
						<span class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-phone" class="col-sm-3 control-label">手机号</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="input-phone"
							name="phone" placeholder="请输入手机号" required> <span
							id="span-icon-phone" class="glyphicon form-control-feedback"></span>
						<span class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-email" class="col-sm-3 control-label">邮箱</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="input-email"
							name="email" placeholder="请输入邮箱" required> <span
							id="span-icon-email" class="glyphicon form-control-feedback"></span>
						<span class="err-info">提示信息</span>
					</div>

				</div>


				<div class="form-group" style="margin-bottom: 26px">
					<label for="select-role" class="col-sm-3 control-label">角色</label>
					<div class="col-sm-8" style="width: 44%">
						<select name="role" class="form-control" id="select-role">
							<option value="1">用户</option>
							<option value="0">管理员</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="select-department" class="col-sm-3 control-label">部门</label>
					<div class="col-sm-8" style="width: 44%">
						<select name="department_id" class="form-control"
							id="select-department">
							<c:forEach items="${departments}" var="department">
								<option value="${department.id }">${department.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-8">
						<button type="submit" class="btn btn-primary pull-right"
							style="padding-left: 26px; padding-right: 26px">添加</button>
					</div>
				</div>
			</form>
		</div>
	</div>



</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$("form :input").bind("input propertychange", function() {
		$(this).val($(this).val().replace(/\s/g, ""));
		
		switch($(this).attr("name")){
		
		}
	})
	
	$("form :input").bind("blur", function() {
		if ($(this).val()=='') {
			showAsNormal($(this));
			return;
		}
		switch ($(this).attr("name")){
		case "id":
			if(!/^\d{10}$/.test($(this).val())){
				showAsError($(this), "请输入10位工号");
				return;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/user/isExist",
				type : "POST",
				data : "id=" + $(this).val(),
				dataType : "text",
				success : function(msg) {
					if (msg == '') {
						showAsOK($(this));
					} else {
						showAsError($(this), msg);
					}
				}
			});
			break;
		case "name":
			if($(this).val().length>8){
				showAsError($(this), "长度不能超过8位");
			}
			break;
		}

	});
	
	function showAsNormal(obj){
		obj.next().next().css("visibility", "hidden");
		obj.next().removeClass("glyphicon-remove");
		obj.next().removeClass("glyphicon-ok");
		obj.parents(".form-group").removeClass("has-error");
		obj.parents(".form-group").removeClass("has-success");
	}
	function showAsOK(obj){
		obj.next().next().css("visibility", "hidden");
		obj.next().removeClass("glyphicon-remove");
		obj.next().addClass("glyphicon-ok");
		obj.parents(".form-group").removeClass("has-error");
		obj.parents(".form-group").addClass("has-success");
	}
	function showAsError(obj, msg){
		obj.next().next().html(msg);
		obj.next().next().css("visibility", "visible");
		obj.next().removeClass("glyphicon-ok");
		obj.next().addClass("glyphicon-remove");
		obj.parents(".form-group").removeClass("has-success");
		obj.parents(".form-group").addClass("has-error");
		
	}
</script>

</html>