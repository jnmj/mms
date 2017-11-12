<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>预定会议</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
	
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css"
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
<body style="padding-top: 64px;">
	<jsp:include page="head.jsp" flush="true" />
	<jsp:include page="manager-left.jsp" flush="true" />

	<div style="width: 800px; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">会议预定</li>
			<li class="active">预定会议</li>
		</ol>
		<div style="width: 60%">
			<form id="form-add" action="${pageContext.request.contextPath}/meeting/add"
				class="form-horizontal" role="form" method="post">
				<div class="form-group">
					<label for="select-room" class="col-sm-3 control-label">房间号</label>
					<div class="col-sm-3">
						<select name="roomId" class="form-control"
							id="select-room">
							<c:forEach items="${rooms}" var="room">
								<option value="${room.id }">${room.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-startTime" class="col-sm-3 control-label">开始时间</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="input-startTime"
							 name="startTime" data-date-format="yyyy-mm-dd hh:ii" required> <span
							id="span-icon-startTime" class="glyphicon form-control-feedback"></span>
						<span class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-endTime" class="col-sm-3 control-label">结束时间</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="input-endTime"
							 name="endTime" data-date-format="yyyy-mm-dd hh:ii" required> <span
							id="span-icon-endTime" class="glyphicon form-control-feedback"></span>
						<span class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="textarea-introduction" class="col-sm-3 control-label">说明</label>
					<div class="col-sm-7">
						<textarea id="textarea-introduction" class="form-control" rows="3" 
						name="introduction" maxlength="200" style="resize:none"></textarea>
					</div>

				</div>


				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-7">
						<button type="submit" class="btn btn-primary pull-right"
							style="padding-left: 26px; padding-right: 26px">确定</button>
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

<script src="${pageContext.request.contextPath}/js/input-control.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
	
	$('#input-startTime,#input-endTime').datetimepicker({
   		format: 'yyyy-mm-dd hh:ii',
   		autoclose: true,
   		lang:'zh'
	});
	
	$('#form-add').submit(function(){
		var status = true; 
		
		return status;
		
	});
	
</script>

</html>