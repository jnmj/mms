<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>查看员工</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/square/blue.css" rel="stylesheet">
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
	
	<div class="row">
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
			<li class="active">查看员工</li>
		</ol>

		<div id="btn-group-sort" class="btn-group btn-group-sm" data-toggle="buttons" style="margin-left: 10px; margin-bottom: 10px">
			<button class="btn btn-default">工号</button>
			<button class="btn btn-default">姓名</button>
			<button class="btn btn-default">所在部门</button>
			<button class="btn btn-default">角色</button>
		</div>

		<div style="width: 100%">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>工号</th>
						<th>姓名</th>
						<th>手机号</th>
						<th>邮箱</th>
						<th>所在部门</th>
						<th>角色</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list}" var="item">
						<tr>
							<td id="td-id">${item.id}</td>
							<td id="td-name">${item.name}</td>
							<td id="td-phone">${item.phone}</td>
							<td id="td-email">${item.email}</td>
							<td id="td-department-name">${item.department.name}</td>
							<td id="td-department-id" style="display: none">${item.departmentId}</td>
							<td id="td-role">${item.role==0?"管理员":"用户"}</td>
							<td><a style="text-decoration: none" href="#">
									<button type="button" class="btn-modify btn btn-primary btn-xs" data-toggle="modal" data-target="#dialog-editUser">
										修改<span class="glyphicon glyphicon-pencil"></span>
									</button>



							</a> <a style="text-decoration: none" href="${pageContext.request.contextPath}/user/delete?id=${item.id}">
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
					<li><a href="${pageContext.request.contextPath}/user/scan?pageNum=1&sortBy=${sortBy}">首页</a></li>

					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${pageContext.request.contextPath}/user/scan?pageNum=${pageInfo.pageNum-1}&sortBy=${sortBy}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach items="${pageInfo.navigatepageNums }" var="page">
						<c:choose>
							<c:when test="${page==pageInfo.pageNum }">
								<li class="active"><a href="${pageContext.request.contextPath}/user/scan?pageNum=${page}&sortBy=${sortBy}">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/user/scan?pageNum=${page}&sortBy=${sortBy}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${pageContext.request.contextPath}/user/scan?pageNum=${pageInfo.pageNum+1}&sortBy=${sortBy}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>

					<li><a href="${pageContext.request.contextPath}/user/scan?pageNum=${pageInfo.pages}&sortBy=${sortBy}">尾页</a></li>

				</ul>
			</nav>
		</div>

	</div>

	<div class="modal " id="dialog-editUser" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" style="width: 32%; margin-top: 40px">
			<div class="modal-content">
				<div class="modal-header" style="padding: 6px; padding-right: 8px">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">修改员工信息</h4>
				</div>
				<div class="modal-body" style="padding-bottom: 0px">

					<form id="form-editUser" action="${pageContext.request.contextPath}/user/update" class="form-horizontal" role="form"
						method="post">
						<div class="form-group has-feedback reduce-margin">
							<label for="input-id" class="col-xs-3 control-label">工号</label>
							<div class="col-xs-7">
								<input type="text" class="form-control" id="input-id" name="id" maxlength="10" placeholder="请输入10位工号" required
									readonly="readonly"> <span id="span-icon-id" class="glyphicon form-control-feedback"></span> <span class="err-info">提示信息</span>
							</div>

						</div>
						<div class="form-group has-feedback reduce-margin">
							<label for="input-name" class="col-xs-3 control-label">姓名</label>
							<div class="col-xs-7">
								<input type="text" class="form-control" id="input-name" maxlength="8" name="name" placeholder="请输入姓名" required> <span
									id="span-icon-name" class="glyphicon form-control-feedback"></span> <span class="err-info">提示信息</span>
							</div>

						</div>

						<div class="form-group has-feedback reduce-margin">
							<label for="input-phone" class="col-xs-3 control-label">手机号</label>
							<div class="col-xs-7">
								<input type="text" class="form-control" id="input-phone" maxlength="11" name="phone" placeholder="请输入手机号" required>
								<span id="span-icon-phone" class="glyphicon form-control-feedback"></span> <span class="err-info">提示信息</span>
							</div>

						</div>
						<div class="form-group has-feedback reduce-margin">
							<label for="input-email" class="col-xs-3 control-label">邮箱</label>
							<div class="col-xs-7">
								<input type="text" class="form-control" id="input-email" maxlength="32" name="email" placeholder="请输入邮箱" required> <span
									id="span-icon-email" class="glyphicon form-control-feedback"></span> <span class="err-info">提示信息</span>
							</div>

						</div>


						<div class="form-group" style="margin-bottom: 26px">
							<label for="select-role" class="col-xs-3 control-label">角色</label>
							<div class="col-xs-7" style="width: 44%">
								<select name="role" class="form-control" id="select-role">
									<option value="1">用户</option>
									<option value="0">管理员</option>
								</select>
							</div>
						</div>

						<div class="form-group" style="margin-bottom: 12px">
							<label for="select-department" class="col-xs-3 control-label">部门</label>
							<div class="col-xs-7" style="width: 44%">
								<select name="departmentId" class="form-control" id="select-department">

								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-7">
								<!-- <div class="checkbox" style="padding-top: 0px"> -->
								<label class="control-label" style="padding-top: 10px"> <input type="checkbox" name="resetPassword" value="1"><font
									style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; color: #333; font-weight: bold; padding-left: 6px">重置密码</font>
								</label>
								<!-- </div> -->
							</div>
						</div>
					</form>
				</div>

				<div class="modal-footer" style="border-top-width: 0px">
					<button form="form-editUser" id="btn-confirm" type="submit" class="btn btn-primary"
						style="padding-left: 20px; padding-right: 20px">确定</button>
					<button class="btn btn-default" data-dismiss="modal" style="padding-left: 20px; padding-right: 20px">取消</button>
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


<script src="${pageContext.request.contextPath}/js/icheck.js"></script>

<script type="text/javascript">
	var sortBy = ${sortBy};
	
	$("input[type='text']").focus(function(){
		showAsNormal($(this));
	});

	 $("#btn-group-sort button:nth-child(" + sortBy + ")").addClass('active')
			.siblings().removeClass('active'); 

	$("#btn-group-sort button").each(function(i) {
						$(this).bind("click",function() {
											window.location.href = "${pageContext.request.contextPath}/user/scan?sortBy="
													+ (i + 1);
													});
						});

	/****************************************/

	$("input[type='checkbox']").iCheck({
		checkboxClass : 'icheckbox_square-blue',
		radioClass : 'iradio_square-blue',
		increaseArea : '20%' // optional
	});

	$('.btn-modify').bind("click",function() {

						$("form input[type='checkbox']").removeAttr("checked");
						$("form input[name='id']").val($(this).parents("td").siblings("#td-id").html());
						$("form input[name='name']").val($(this).parents("td").siblings("#td-name").html());
						$("form input[name='phone']").val($(this).parents("td").siblings("#td-phone").html());
						$("form input[name='email']").val($(this).parents("td").siblings("#td-email").html());
						$("form select[name='role']").val($(this).parents("td").siblings("#td-role").html() == "用户" ? 1 : 0);

						$.ajax({
								url : "${pageContext.request.contextPath}/department/getAll",
								dataType : "text",
								success : function(msg) {
									jsonData = JSON.parse(msg);
									for (x in jsonData) {
										$("form select[name='departmentId']").append(
										"<option value='"+jsonData[x].id+"'>"+ jsonData[x].name+"</option>");
											$("form select[name='departmentId']")
												.val($(this).parents("td").siblings("#td-department-id").html());
										}
									}.bind(this)
								});

					});

	$("#dialog-editUser").on("hidden.bs.modal", function() {
		showAsNormal($("form :input[name='name']"));
		showAsNormal($("form :input[name='phone']"));
		showAsNormal($("form :input[name='email']"));
	});

	$('#form-editUser')
			.submit(
					function() {
						var status = true;

						showAsOK($("form :input[name='name']"));
						
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