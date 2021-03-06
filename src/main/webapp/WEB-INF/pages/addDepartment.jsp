<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>添加部门</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">




</head>
<body style="padding-top: 64px">
<jsp:include page="head.jsp" flush="true" />
	
	<div class="col-xs-2 col-xs-offset-1">
	<c:if test="${sessionScope.user.role==0}">
		<jsp:include page="manager-left.jsp" flush="true" />
	</c:if>
	
	<c:if test="${sessionScope.user.role==1}">
		<jsp:include page="user-left.jsp" flush="true" />
	</c:if>
	</div>
	<div class="col-xs-8">
		<ol class="breadcrumb">
			<li class="active">人事管理</li>
			<li class="active">添加部门</li>
		</ol>

		<div style="width: 50%">
			<form id="form-add" 
				action="${pageContext.request.contextPath}/department/add"
				class="form-horizontal" method="post">
				<div id="form-group-add" class="form-group has-feedback" style="margin-bottom: 0px">
					<label for="input-add" class="col-xs-3 control-label">部门名</label>
					<div class="col-xs-8">
						<input name="name" type="text" class="form-control" id="input-name"
							maxlength="24" placeholder="请输入部门名" required autofocus>
							<span id="span-icon" class="glyphicon form-control-feedback"></span>
							<span id="hint"
							style="color: red; visibility: hidden; padding-left:5px">提示信息</span>
					</div>

				</div>
				<div class="form-group">
					<div class="col-xs-offset-3 col-xs-8">
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

<script type="text/javascript">	
	var errInfo = "请输入部门名";
	var category = "department";	
</script>

<script src="${pageContext.request.contextPath}/js/custom.js"></script>

</html>