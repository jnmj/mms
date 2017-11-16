<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>修改资料</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">


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
<body style="padding-top: 64px;">
<div style="width:80%; margin:0 auto">
	<jsp:include page="head.jsp" flush="true" />
	<c:if test="${sessionScope.user.role==0}">
		<jsp:include page="manager-left.jsp" flush="true" />
	</c:if>
	<c:if test="${sessionScope.user.role==1}">
		<jsp:include page="user-left.jsp" flush="true" />
	</c:if>

	<div class="pull-right" style="width: 80%; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">个人中心</li>
			<li class="active">修改资料</li>
		</ol>
		<div style="width: 50%">
			<div class="panel panel-default panel-primary">
				<div class="panel-heading">${user.id }&nbsp;&nbsp;&nbsp;&nbsp;${user.name }&nbsp;&nbsp;&nbsp;&nbsp;${user.department.name }</div>
				<div class="panel-body" style="padding-bottom:0px">
					<form id="form-modify-contact" action="${pageContext.request.contextPath}/user/modify"
						class="form-horizontal" role="form" method="post">
						<input id="input-id-contact" name="id" style="display:none" value="${user.id}">
						<div class="form-group has-feedback reduce-margin">
							<label for="input-phone" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="input-phone" maxlength="11" name="phone"
									placeholder="请输入手机号" required value="${user.phone}">
								<span id="span-icon-phone" class="glyphicon form-control-feedback"></span> <span
									class="err-info">提示信息</span>
							</div>

						</div>
						<div class="form-group has-feedback reduce-margin">
							<label for="input-email" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="input-email" maxlength="32" name="email"
									placeholder="请输入邮箱" required value="${user.email }">
								<span id="span-icon-email" class="glyphicon form-control-feedback"></span> <span
									class="err-info">提示信息</span>
							</div>

						</div>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-7">
								<button type="submit" class="btn btn-primary pull-right btn-contact"
									style="padding-left: 26px; padding-right: 26px">确定</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<div class="panel panel-default  panel-primary">
				<div class="panel-heading">修改密码</div>
				<div class="panel-body" style="padding-bottom:0px">
					<form id="form-modify-password" action="${pageContext.request.contextPath}/user/modify"
						class="form-horizontal" role="form" method="post">
						<input id="input-id-password" name="id" style="display:none" value="${user.id}">
						<div class="form-group has-feedback reduce-margin">
							<label for="input-old-password" class="col-sm-3 control-label">旧密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="input-old-password" maxlength="16"
									 placeholder="请输入旧密码" required>

								<span id="span-icon-password" class="glyphicon form-control-feedback"></span> <span
									class="err-info">提示信息</span>
							</div>

						</div>

						<div class="form-group has-feedback reduce-margin">
							<label for="input-password" class="col-sm-3 control-label">新密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="input-password" maxlength="16"
									name="password" placeholder="请输入6-16位新密码" required>

								<span id="span-icon-password" class="glyphicon form-control-feedback"></span> <span
									class="err-info">提示信息</span>
							</div>

						</div>
						<div class="form-group has-feedback reduce-margin">
							<label for="input-password2" class="col-sm-3 control-label">确认新密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="input-password2" maxlength="16"
									name="password2" placeholder="请确认新密码" required>
								<span id="span-icon-password2" class="glyphicon form-control-feedback"></span> <span
									class="err-info">提示信息</span>
							</div>

						</div>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-7">
								<button type="submit" class="btn btn-primary pull-right btn-password"
									style="padding-left: 26px; padding-right: 26px">确定</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


<script type="text/javascript">

	$("input[type='text'],input[type='password']").focus(function(){
		showAsNormal($(this));
	});

	$("form :input").bind(
			"input propertychange",
			function() {
				//$(this).val($(this).val().replace(/\s/g, ""));
				replaceAndSetPos($(this).get(0), /\s/g, '');

				switch ($(this).attr("name")) {
				case "phone":
					//$(this).val($(this).val().replace(/[^\d]/g, ""));
					replaceAndSetPos($(this).get(0), /[^\d]/g, '');
					break;
				case "password":
					replaceAndSetPos($(this).get(0), /[\u4E00-\u9FA5]/g, '');
					break;
				default:
				}
			})


	$('#form-modify-contact')
			.submit(
					function() {
						var status = true;
						if (!(/^1[34578]\d{9}$/.test($(
								"form :input[name='phone']").val()))) {
							showAsError($("form :input[name='phone']"), $(
									"form :input[name='phone']").attr(
									"placeholder"));
							status = false;
						} else {
							showAsOK($("form :input[name='phone']"));
						}

						if (!(/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/
								.test($("form :input[name='email']").val()))) {
							showAsError($("form :input[name='email']"), $(
									"form :input[name='email']").attr(
									"placeholder"));
							status = false;
						} else {
							showAsOK($("form :input[name='email']"));
						}

						return status;
					});
	
	$('#form-modify-password')
	.submit(
			function() {
				var status = true;
				
				$.ajax({
					url : "${pageContext.request.contextPath}/user/validatePassword",
					type : "POST",
					data : "id=" + $("#input-id-password").val()+"&password="+$("#input-old-password").val(),
					async : false,
					success : function(msg) {
						if (msg == 1) {
							showAsOK($("#input-old-password"));
						} else {
							status = false;
							showAsError($("#input-old-password"), "旧密码错误");
						}
					}
				});
				
				if ($("form :input[name='password']").val().length<6) {
					showAsError($("form :input[name='password']"), $(
							"form :input[name='password']").attr(
							"placeholder"));
					status = false;
				} else {
					showAsOK($("form :input[name='password']"));
				}

				if ($("form :input[name='password2']").val() == '') {
					showAsError($("form :input[name='password2']"), $(
							"form :input[name='password2']").attr(
							"placeholder"));
					status = false;
				} else {
					if ($("form :input[name='password']").val() != $(
							"form :input[name='password2']").val()) {
						showAsError($("form :input[name='password2']"),
								"两次密码不一致");
						status = false;
					} else {
						showAsOK($("form :input[name='password2']"));
					}
				}

				return status;
			});


	function showAsNormal(obj) {
		obj.next().next().css("visibility", "hidden");
		obj.next().removeClass("glyphicon-remove");
		obj.next().removeClass("glyphicon-ok");
		obj.parents(".form-group").removeClass("has-error");
		obj.parents(".form-group").removeClass("has-success");
	}
	function showAsOK(obj) {
		obj.next().next().css("visibility", "hidden");
		obj.next().removeClass("glyphicon-remove");
		obj.next().addClass("glyphicon-ok");
		obj.parents(".form-group").removeClass("has-error");
		obj.parents(".form-group").addClass("has-success");
	}
	function showAsError(obj, msg) {
		obj.next().next().html(msg);
		obj.next().next().css("visibility", "visible");
		obj.next().removeClass("glyphicon-ok");
		obj.next().addClass("glyphicon-remove");
		obj.parents(".form-group").removeClass("has-success");
		obj.parents(".form-group").addClass("has-error");

	}
</script>

</html>