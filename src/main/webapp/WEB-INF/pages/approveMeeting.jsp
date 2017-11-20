<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>审批会议</title>
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
			<li class="active">会议审批</li>
		</ol>

		<div style="width: 100%">
			<table class="table table-striped ">
				<thead>
					<tr>
						
						<th class="col-xs-2">说明</th>
						<th class="col-xs-1">房间号</th>
						<th class="col-xs-2">开始时间</th>
						<th class="col-xs-2">结束时间</th>
						<th class="col-xs-1">申请人</th>
						<th class="col-xs-1">参会</th>
						<th class="col-xs-3" style="padding-left:20px">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list}" var="item">
						<tr>
							<td class="td-id" style="display:none">${item.id}</td>
							<td class="td-roomId" style="display:none">${item.room.id}</td>
							<td class="col-xs-2 len-limit">${item.introduction}</td>
							<td class="col-xs-1">${item.room.name}</td>
							<td class="col-xs-2 td-startTime"><fmt:formatDate value="${item.startTime }"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="col-xs-2 td-endTime"><fmt:formatDate value="${item.endTime }"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="col-xs-1 len-limit">${item.promoter.name}</td>
							<td class="col-xs-1">
							
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
							<td class="col-xs-3" style="padding-left:20px">
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


	<div class="modal " id="modal-tip" role="dialog">
		<div class="modal-dialog" style="width: 32%; margin-top: 40px">
			<div class="modal-content">
				<div class="modal-header" style="padding: 6px; padding-right: 8px">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">和其他会议冲突</h4>
				</div>
				<div class="modal-body" style="padding-bottom: 0px">
						
				</div>
				<div class="modal-footer" style="border-top-width: 0px; padding-top:0px">
					<button data-dismiss="modal"
						class="btn btn-primary center-block"
						style="padding-left: 20px; padding-right: 20px">确定</button>
					
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

$(".btn-pass").bind("click", function(){
	var btn = $(this);
	$.ajax({
		url : "${pageContext.request.contextPath}/meeting/validate",
		type : "POST",
		data : "id="+$(this).parent("td").prevAll(".td-id").text()
				+"&roomId="+$(this).parent("td").prevAll(".td-roomId").text()
				+"&startTime="+ $(this).parent("td").prevAll(".td-startTime").text()
				+"&endTime="+$(this).parent("td").prevAll(".td-endTime").text(),
		dataType: "json", 
		async : false,
		success : function(obj) {
			if(obj.length==0){
				console.log("length=0");
				$.ajax({
					url : "${pageContext.request.contextPath}/meeting/decide",
					type : "POST",
					data : "id=" + btn.parent("td").prevAll(".td-id").text()+"&status=1",
					async : false,
					success : function() {
						window.location.href="${pageContext.request.contextPath}/meeting/approve";
					}
				});
			}else{
				var str="";
				$.each(obj, function(index, val){
					str=str+(index+1)+".&nbsp;房间号:&nbsp;"+val.room.name
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请人:&nbsp;"+val.promoter.name+"<br>"
					+"&nbsp;&nbsp;&nbsp;&nbsp;开始时间:&nbsp;"+val.startTime
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间:&nbsp;"+val.endTime+"<br>"
					+"<div style='overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'>"+
					"&nbsp;&nbsp;&nbsp;&nbsp;说明:&nbsp;"+val.introduction+"</div><br>";
				});
				//console.log(str);
				$(".modal-body").html(str);
				$('#modal-tip').modal('show');
			}
				
		}.bind(this)
	});
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