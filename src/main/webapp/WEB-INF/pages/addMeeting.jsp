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

<link
	href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css"
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

<style>
    ul li{
        list-style:none;
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
			<li class="active">预定会议</li>
		</ol>
		<div style="width: 50%">
			<form id="form-add" autocomplete="off"
				action="${pageContext.request.contextPath}/meeting/add"
				class="form-horizontal" role="form" method="post">
				<div class="form-group" style="margin-bottom: 26px">
					<label for="select-room" class="col-xs-3 control-label">房间号</label>
					<div class="col-md-3 col-xs-4">
						<select name="roomId" class="form-control" id="select-room">
							<c:forEach items="${rooms}" var="room">
								<option value="${room.id }">${room.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-startTime" class="col-xs-3 control-label">开始时间</label>
					<div class="col-xs-7">
						<input type="text" class="form-control" id="input-startTime"
							name="startTime" data-date-format="yyyy-mm-dd hh:ii" required>
						<span id="span-icon-startTime"
							class="glyphicon form-control-feedback"></span> <span
							class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback reduce-margin">
					<label for="input-endTime" class="col-xs-3 control-label">结束时间</label>
					<div class="col-xs-7">
						<input type="text" class="form-control" id="input-endTime"
							name="endTime" data-date-format="yyyy-mm-dd hh:ii" required>
						<span id="span-icon-endTime"
							class="glyphicon form-control-feedback"></span> <span
							class="err-info">提示信息</span>
					</div>

				</div>
				<div class="form-group has-feedback" style="margin-bottom: 26px">
					<label for="textarea-introduction" class="col-xs-3 control-label">说明</label>
					<div class="col-xs-7">
						<textarea id="textarea-introduction" class="form-control" rows="3"
							name="introduction" maxlength="200" style="resize: none" required></textarea>
					</div>

				</div>
				
				<div class="form-group has-feedback reduce-margin"  >
					<label class="col-xs-3 control-label">参会人员</label>
					<div class="col-xs-7">
					<div class="form-control" style="height:200px; overflow:auto; border:1px solid #bbb; border-radius:4px;">
						<c:forEach items="${departments}" var="department">
							<div>
							<input class="outerCheckbox" type="checkbox"
								name="checkbox_v1" value="version1">
							<a class="user-list" style="text-decoration: none; cursor: pointer"
								data-toggle="collapse" data-target="#">${department.name}<b
								class="caret"></b></a>
							<ul id="" class="collapse">
								<c:forEach items="${department.users }" var="user">
									<li><input type="checkbox" name="userIds"
										value="${user.id}" class="innerCheckbox">${user.name }</li>
								</c:forEach>
							</ul>
							</div>
						</c:forEach>
					</div>
					</div>
				</div>
				<div class="form-group reduce-margin">
				<div class="col-xs-9 col-xs-offset-3">
				<button id="button-all" type="button" onclick="allChecked()">全选</button>
				<button id="button-un" type="button" onclick="allUnChecked()">反选</button>
				<span id="span-add-user" style="color: red; visibility:hidden">请添加参会人员</span>
				</div>
				</div>
				<input name="promoterId" value="${sessionScope.user.id}"
					style="display: none">
					
				<div class="form-group">
					<div class="col-xs-offset-3 col-xs-7">
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


<script
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
	$.fn.datetimepicker.dates['zh'] = {
		days : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" ],
		daysShort : [ "周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日" ],
		daysMin : [ "日", "一", "二", "三", "四", "五", "六", "日" ],
		months : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月",
				"十一月", "十二月" ],
		monthsShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
				"十月", "十一月", "十二月" ],
		today : "今天",
		suffix : [],
		meridiem : [ "上午", "下午" ]
	};

	$('#input-startTime,#input-endTime').datetimepicker({
		format : 'yyyy-mm-dd hh:ii',
		autoclose : true,
		language : 'zh',
		weekStart : 1,
		minuteStep : 10,
		startDate : new Date()

	});

	$('#input-startTime').datetimepicker().on(
			"click",
			function() {
				$("#input-startTime").datetimepicker("setEndDate",
						$("#input-endTime").val())
			});

	$('#input-endTime').datetimepicker().on(
			"click",
			function() {
				$("#input-endTime").datetimepicker("setStartDate",
						$("#input-startTime").val())
			});

	$('#input-startTime,#input-endTime').bind(
			"input propertychange",
			function() {
				if (!(/^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}/.test($(this)
						.val()))) {
					$(this).val('');
				}
			});

	$('#form-add').submit(function() {
		if($(".innerCheckbox:checked").length==0){
			$("#span-add-user").css("visibility","visible");
			return false;
		}
	});
</script>

<script>
	
	var cnt = 1;
	$(".user-list").each(function(){
		$(this).attr("data-target", "#"+cnt);
		$(this).nextAll("ul").attr("id", cnt);
		cnt++;
	});
	
	//当第一层选项选定，则该选项下的第二层全部被选定
	$(".outerCheckbox").bind("click", function(){
		if($(this).prop("checked")==true){
			$(this).nextAll("ul").find("input").each(function(){
				$(this).prop("checked", true);
			});
		}else{
			$(this).nextAll("ul").find("input").each(function(){
				$(this).prop("checked", false);
			});
		}
		
	});
	
	//当第二层选项全部被选定，则第一层被选定；若第二层选项至少有一个没被选定，则第一层不被选定
	$(".innerCheckbox").bind("click", function(){
		var childStatus = true;
		$(this).parents("ul").find("input").each(function(){
			childStatus = childStatus && $(this).prop('checked');
		});
		if(childStatus){
			$(this).parents("ul").prevAll("input").prop("checked", true);
		}else{
			$(this).parents("ul").prevAll("input").prop("checked", false);
		}
	});
    
	//全选按钮，点击全选，则所有选项被选中
	$("#button-all").bind("click", function(){
		$(".outerCheckbox").prop("checked", true);
		$(".innerCheckbox").prop("checked", true);		
	});
	
	//反选按钮
	$("#button-un").bind("click", function(){
		$(".innerCheckbox").each(function(){
			if($(this).prop('checked')==true){
				$(this).prop('checked', false);
			}else{
				$(this).prop('checked', true);
			}
		});
		
		$(".outerCheckbox").each(function(){
			var childStatus = true;
			$(this).nextAll("ul").find("input").each(function(){
				childStatus = childStatus && $(this).prop('checked');
			});
			if(childStatus){
				$(this).prop("checked", true);
			}else{
				$(this).prop("checked", false);
			}
		});
	});
    
</script>

</html>