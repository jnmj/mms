<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
				<ul class="nav">
					<li>
						<a href="#user-menu" data-toggle="collapse" style="font-size:16px"><span class="glyphicon glyphicon-home"></span>&nbsp;个人中心</a> 
						<ul id="user-menu" class="nav collapse in" style="margin-left:32px">
							<li><a href="${pageContext.request.contextPath}/meeting/mine">我的会议</a></li>  
							<li><a href="${pageContext.request.contextPath}/meeting/myOrder">我的预定</a></li> 
							<li><a href="${pageContext.request.contextPath}/user/modify">修改资料</a></li> 
						</ul>  
					</li>
				</ul>
				
				<ul class="nav" style="margin-top:10px">
					<li>
						<a href="#manage-menu"  data-toggle="collapse" style="font-size:16px"><span class="glyphicon glyphicon-user"></span>&nbsp;人事管理</a>
						<ul id="manage-menu" class="nav collapse in" style="margin-left:32px">  
							<li ><a id="a-add-department" href="${pageContext.request.contextPath}/department/add">添加部门</a></li> 
							<li ><a id="a-scan-department" href="${pageContext.request.contextPath}/department/scan">查看部门</a></li> 
							<li ><a id="a-add-user" href="${pageContext.request.contextPath}/user/add">添加员工</a></li>
							<li ><a id="a-scan-user" href="${pageContext.request.contextPath}/user/scan">查看员工</a></li>
						</ul> 
					</li>
				</ul>

				<ul class="nav" style="margin-top:10px">
					<li>
						<a href="#meeting-menu"  data-toggle="collapse" style="font-size:16px"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;会议管理</a>  
						<ul id="meeting-menu" class="nav  collapse in" style="margin-left:32px">  
							<li ><a href="${pageContext.request.contextPath}/room/add">添加会议室</a></li> 
							<li ><a href="${pageContext.request.contextPath}/room/scan">查看会议室</a></li> 
							<li ><a href="${pageContext.request.contextPath}/meeting/add">预定会议</a></li>
							<li ><a href="${pageContext.request.contextPath}/meeting/approve">会议审批</a></li>
							<li ><a href="${pageContext.request.contextPath}/meeting/approveRecord">审批记录</a></li>
						</ul>  
					</li>
				</ul>
			
