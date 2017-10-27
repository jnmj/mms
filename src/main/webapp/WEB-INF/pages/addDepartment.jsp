<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>index</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


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
			<form action="${pageContext.request.contextPath}/department/add"
				class="form-signin" method="post">
				<input name="name" type="text" id="inputDepartment"
					class="form-control" placeholder="部门名称" required autofocus>
				<br>
				<button class="btn btn-sm btn-primary pull-right"
					style="padding-left: 20px; padding-right: 20px" type="submit">添加</button>
			</form>
		</div>

	</div>

	</div>
	</div>


</body>
</html>