<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>查看会议室</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body style="padding-top: 64px;">
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
			<li class="active">会议管理</li>
			<li class="active">查看会议室</li>
		</ol>

		<div style="width: 60%">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-xs-8">房间号</th>
						<th class="col-xs-4">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list}" var="item">
						<tr>
							<td class="col-xs-8">${item.name}</td>
							<td class="col-xs-4"><a style="text-decoration: none" href="#">
									<button type="button" class="btn-modify btn btn-primary btn-xs"
									data-toggle="modal" data-target="#editRoomDialog">
										修改<span class="glyphicon glyphicon-pencil"></span>
									</button>
									<span style="display:none">${item.id }</span>
									
							</a> <a style="text-decoration: none"
								href="${pageContext.request.contextPath}/room/delete?id=${item.id}">
									<button type="button" class="btn btn-warning btn-xs">
										删除<span class="glyphicon glyphicon-remove"></span>
									</button>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav style="text-align: center" aria-label="Page navigation">
				<ul class="pagination">
					<li><a
						href="${pageContext.request.contextPath}/room/scan?pageNum=1">首页</a></li>

					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a
							href="${pageContext.request.contextPath}/room/scan?pageNum=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach items="${pageInfo.navigatepageNums }" var="page">
						<c:choose>
							<c:when test="${page==pageInfo.pageNum }">
								<li class="active"><a
									href="${pageContext.request.contextPath}/room/scan?pageNum=${page}">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/room/scan?pageNum=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pageInfo.hasNextPage }">
						<li><a
							href="${pageContext.request.contextPath}/room/scan?pageNum=${pageInfo.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>

					<li><a
						href="${pageContext.request.contextPath}/room/scan?pageNum=${pageInfo.pages}">尾页</a></li>

				</ul>
			</nav>
		</div>

	</div>

	<div class="modal " id="editRoomDialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" style="width: 40%; margin-top: 150px">
			<div class="modal-content">
				<div class="modal-header" style="padding: 6px; padding-right: 8px">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">修改会议室</h4>
				</div>
				<div class="modal-body" style="padding-bottom: 0px">
					<form action="${pageContext.request.contextPath}/room/update" class="form-horizontal" id="editRoomForm"
						name="editDepartmentForm" method="POST">

						<div id="form-group-modify" class="form-group has-feedback" style="margin-bottom:0px">
							<label class="control-label col-xs-3" for="input-name">
								房间号 </label>
							<div class="col-xs-7">
								<input type="text" class="form-control" id="input-name"
									maxlength="24" name="name" required> 
									<span id="span-icon" class="glyphicon form-control-feedback"></span>
									<span id="hint"
									style="color: red; visibility: hidden; padding-left:5px">提示信息</span>
							</div>
						</div>
						<input id="input-id" name="id" style="display:none" />
					</form>
				</div>
				<div class="modal-footer"
					style="border-top-width: 0px; padding-top: 0px">
					<button form="editRoomForm" id="btn-confirm" type="submit" class="btn btn-primary" style="padding-left:20px; padding-right:20px">确定</button>
					<button class="btn btn-default" data-dismiss="modal" style="padding-left:20px; padding-right:20px">取消</button>
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
	var oldName;
	
	$("input[type='text']").focus(function(){
		showAsNormal($(this));
	});
	
	$('.btn-modify').bind("click", function(){
		$("#input-name").val($(this).parents("td").prev().text());
		$("#input-id").val($(this).next().text());
		oldName = $("#input-name").val();
	});
	
	$("#editRoomDialog").on("shown.bs.modal",function(){
		$("#input-name").select();
	});
	
	$("#editRoomDialog").on("hidden.bs.modal",function(){
		showAsNormal();
	});
	
	$('#editRoomForm').submit(function(){
		if($('#input-name').val()==oldName){
			showAsOK();
			$("#editRoomDialog").modal('hide');
			return false;
		}
		var ret;
		$.ajax({
			url : "${pageContext.request.contextPath}/room/isExist",
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
		$('#form-group-modify').removeClass("has-error");
		$('#form-group-modify').removeClass("has-success");
		$('#span-icon').removeClass("glyphicon-remove");
		$('#span-icon').removeClass("glyphicon-ok");
	}
	function showAsOK(){
		$('#hint').css("visibility", "hidden");
		$('#form-group-modify').removeClass("has-error");
		$('#form-group-modify').addClass("has-success");
		$('#span-icon').removeClass("glyphicon-remove");
		$('#span-icon').addClass("glyphicon-ok");
	}
	function showAsError(msg){
		$('#hint').html(msg);
		$('#hint').css("visibility", "visible");
		$('#form-group-modify').removeClass("has-success");
		$('#form-group-modify').addClass("has-error");
		$('#span-icon').removeClass("glyphicon-ok");
		$('#span-icon').addClass("glyphicon-remove");
	}
</script>
</html>