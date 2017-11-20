<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="col-xs-10 col-xs-offset-1">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#navbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index">xx会议管理系统</a>
			</div>

			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/user/modify">${sessionScope.user.name}(${sessionScope.user.role==0?"管理员":"用户"})</a></li>
					<li><a id="logout" href="${pageContext.request.contextPath}/logout">注销</a></li>
				</ul>
			</div>
		</div>
</nav>

<script>
	
</script>