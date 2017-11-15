<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid ">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index">Project Name</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><p class="navbar-text">${sessionScope.user.name}(${sessionScope.user.role==0?"管理员":"用户"})</p></li> 
				<li><a id="logout" href="${pageContext.request.contextPath}/logout" style="padding-top:15px; padding-bottom:15px">注销</a></li> 
			</ul>
		</div>
	</nav>

<script>
</script>