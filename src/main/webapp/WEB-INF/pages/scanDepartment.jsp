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




</head>
<body style="padding-top: 70px;">

	<jsp:include page="head.jsp" flush="true"/>
	<jsp:include page="manager-left.jsp" flush="true"/>

	<div style="width: 800px; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">人事管理</li>
			<li class="active">查看部门</li>
		</ol>

		<div style="width: 50%">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>部门名</th>
						<th style="padding-left: 233px">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list}" var="item">
						<tr>
							<td>${item.name}</td>
							<td align="right">
								<a style="text-decoration:none" href="#">
								<button type="button" class="btn btn-primary btn-xs">
									修改<span class="glyphicon glyphicon-pencil"></span>
								</button>
								</a>
								<a style="text-decoration:none" href="${pageContext.request.contextPath}/department/delete?id=${item.id}">
								<button  type="button" class="btn btn-warning btn-xs">
									删除<span class="glyphicon glyphicon-remove"></span>
								</button>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav style="text-align: center" aria-label="Page navigation">
				<ul class="pagination">
					<li><a
						href="${pageContext.request.contextPath}/department/scan?pageNum=1">首页</a></li>

					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a
							href="${pageContext.request.contextPath}/department/scan?pageNum=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach items="${pageInfo.navigatepageNums }" var="page">
						<c:choose>
							<c:when test="${page==pageInfo.pageNum }">
								<li class="active"><a
									href="${pageContext.request.contextPath}/department/scan?pageNum=${page}">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/department/scan?pageNum=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pageInfo.hasNextPage }">
						<li><a
							href="${pageContext.request.contextPath}/department/scan?pageNum=${pageInfo.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>

					<li><a
						href="${pageContext.request.contextPath}/department/scan?pageNum=${pageInfo.pages}">尾页</a></li>

				</ul>
			</nav>
		</div>

	</div>




</body>
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</html>