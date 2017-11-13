<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>我的预定</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
</style>
</head>
<body style="padding-top: 64px;">
	<jsp:include page="head.jsp" flush="true" />
	<jsp:include page="manager-left.jsp" flush="true" />

	<div style="width: 800px; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">个人中心</li>
			<li class="active">我的预定</li>
		</ol>

		<div style="width: 100%">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>说明</th>
						<th>房间号</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>参加人员</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list}" var="item">
						<tr>
							<td>${item.introduction}</td>
							<td>${item.room.name}</td>
							<td><fmt:formatDate value="${item.startTime }"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td><fmt:formatDate value="${item.endTime }"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td>
							<div class="dropdown">
								<button type="button" class="btn btn-primary btn-xs dropdown-toggle"
									data-toggle="dropdown">
									查看<span class="glyphicon glyphicon-search"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
								<c:forEach items="${item.users}" var="user">
									<li>${user.name}</li>
								</c:forEach>
								</ul>
							</div>
							</td>
							<td>${item.strStatus}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav style="text-align: center" aria-label="Page navigation">
				<ul class="pagination">
					<li><a
						href="${pageContext.request.contextPath}/user/scan?pageNum=1&sortBy=${sortBy}">首页</a></li>

					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a
							href="${pageContext.request.contextPath}/user/scan?pageNum=${pageInfo.pageNum-1}&sortBy=${sortBy}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach items="${pageInfo.navigatepageNums }" var="page">
						<c:choose>
							<c:when test="${page==pageInfo.pageNum }">
								<li class="active"><a
									href="${pageContext.request.contextPath}/user/scan?pageNum=${page}&sortBy=${sortBy}">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/user/scan?pageNum=${page}&sortBy=${sortBy}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pageInfo.hasNextPage }">
						<li><a
							href="${pageContext.request.contextPath}/user/scan?pageNum=${pageInfo.pageNum+1}&sortBy=${sortBy}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>

					<li><a
						href="${pageContext.request.contextPath}/user/scan?pageNum=${pageInfo.pages}&sortBy=${sortBy}">尾页</a></li>

				</ul>
			</nav>
		</div>

	</div>





</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
</script>
</html>