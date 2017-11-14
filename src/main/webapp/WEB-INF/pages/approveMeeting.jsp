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
 table{
table-layout:fixed;
} 
td.len-limit{  
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}

.popover {
word-break: break-all;
}
</style>
</head>
<body style="padding-top: 64px;">
	<jsp:include page="head.jsp" flush="true" />
	<jsp:include page="manager-left.jsp" flush="true" />

	<div style="width: 800px; display: inline-block; vertical-align: top">

		<ol class="breadcrumb">
			<li class="active">会议预定</li>
			<li class="active">会议审批</li>
		</ol>

		<div style="width: 100%">
			<table class="table table-striped ">
				<thead>
					<tr>
						
						<th class="col-md-3">说明</th>
						<th class="col-md-1">房间号</th>
						<th class="col-md-2">开始时间</th>
						<th class="col-md-2">结束时间</th>
						<th class="col-md-1">参会</th>
						<th class="col-md-3" style="padding-left:20px">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list}" var="item">
						<tr>
							<td class="td-id" style="display:none">${item.id}</td>
							<td class="col-md-3 len-limit">${item.introduction}</td>
							<td class="col-md-1">${item.room.name}</td>
							<td class="col-md-2"><fmt:formatDate value="${item.startTime }"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="col-md-2"><fmt:formatDate value="${item.endTime }"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="col-md-1">
							
								<button type="button" class="btn btn-primary btn-xs btn-joiner"
								title="参会人员"  
								data-container="body" data-toggle="popover" data-placement="left"
								data-content="<c:forEach items="${item.users}" var="user" varStatus="stat">
									<c:if test="${!stat.last}">
										${user.name}&nbsp;&nbsp;
									</c:if>
									<c:if test="${stat.last}">
										${user.name}
									</c:if>
								</c:forEach>">
									查看<span class="glyphicon glyphicon-search"></span>
								</button>
								
							</td>
							<td class="col-md-3" style="padding-left:20px">
								<button type="button" class="btn btn-warning btn-xs btn-introduction"
								title="会议说明" 
								data-container="body" data-toggle="popover" data-placement="right" 
								data-content="${item.introduction}">
									详情<span class="glyphicon glyphicon-list-alt"></span>
								</button>
								<button type="button" class="btn btn-success btn-xs btn-pass">
									通过<span class="glyphicon glyphicon-ok"></span>
								</button>
								<button type="button" class="btn btn-danger btn-xs btn-reject">
									拒绝<span class="glyphicon glyphicon-remove"></span>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav style="text-align: center" aria-label="Page navigation">
				<ul class="pagination">
					<li><a
						href="${pageContext.request.contextPath}/meeting/approve?pageNum=1">首页</a></li>

					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a
							href="${pageContext.request.contextPath}/meeting/approve?pageNum=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach items="${pageInfo.navigatepageNums}" var="page">
						<c:choose>
							<c:when test="${page==pageInfo.pageNum}">
								<li class="active"><a
									href="${pageContext.request.contextPath}/meeting/approve?pageNum=${page}">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/meeting/approve?pageNum=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pageInfo.hasNextPage }">
						<li><a
							href="${pageContext.request.contextPath}/meeting/approve?pageNum=${pageInfo.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>

					<li><a
						href="${pageContext.request.contextPath}/meeting/approve?pageNum=${pageInfo.totalPage}">尾页</a></li>

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
$(function () { 
	$("[data-toggle='popover']").popover();
});

var lastBtnIntro;
$(".btn-introduction").on('show.bs.popover', function () {
	if(lastBtnIntro!=undefined  && !lastBtnIntro.is($(this))
			&& lastBtnIntro.attr("aria-describedby")!=undefined){
		lastBtnIntro.click();
	}	
	lastBtnIntro = $(this);
}); 

var lastBtnJoiner;
$(".btn-joiner").on('show.bs.popover', function () {
	if(lastBtnJoiner!=undefined  && !lastBtnJoiner.is($(this))
			&& lastBtnJoiner.attr("aria-describedby")!=undefined){
		lastBtnJoiner.click();
	}	
	lastBtnJoiner = $(this);
});

$(".btn-reject").bind("click", function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/meeting/decide",
		type : "POST",
		data : "id=" + $(this).parent("td").prevAll(".td-id").text()+"&status=2",
		async : false,
		success : function() {
			window.location.href="${pageContext.request.contextPath}/meeting/approve";
		}.bind(this)
	});
});

</script>
</html>