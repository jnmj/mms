<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="sidebar-nav">
				<ul class="nav nav-list ">
					<li>
						<a href="#user-menu" class="nav-header" data-toggle="collapse" style="font-size:16px"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;个人中心</a> 
						<ul id="user-menu" class="nav nav-list collapse in">
							<li><a href="${pageContext.request.contextPath}/meeting/mine">&nbsp;我的会议</a></li>  
							<li><a href="${pageContext.request.contextPath}/meeting/myOrder">&nbsp;我的预定</a></li> 
							<li><a href="${pageContext.request.contextPath}/user/modify">&nbsp;修改资料</a></li> 
						</ul>  
					</li>
				</ul>
				
				<ul class="nav nav-list" style="margin-top:10px">
					<li>
						<a href="#manage-menu" class="nav-header" data-toggle="collapse" style="font-size:16px"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;人事管理</a>
						<ul id="manage-menu" class="nav nav-list collapse in">  
							<li ><a id="a-add-department" href="${pageContext.request.contextPath}/department/add">&nbsp;添加部门</a></li> 
							<li ><a id="a-scan-department" href="${pageContext.request.contextPath}/department/scan">&nbsp;查看部门</a></li> 
							<li ><a id="a-add-user" href="${pageContext.request.contextPath}/user/add">&nbsp;添加员工</a></li>
							<li ><a id="a-scan-user" href="${pageContext.request.contextPath}/user/scan">&nbsp;查看员工</a></li>
						</ul> 
					</li>
				</ul>

				<ul class="nav nav-list" style="margin-top:10px">
					<li>
						<a href="#meeting-menu" class="nav-header" data-toggle="collapse" style="font-size:16px"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;会议管理</a>  
						<ul id="meeting-menu" class="nav nav-list collapse in">  
							<li ><a href="${pageContext.request.contextPath}/room/add">&nbsp;添加会议室</a></li> 
							<li ><a href="${pageContext.request.contextPath}/room/scan">&nbsp;查看会议室</a></li> 
							<li ><a href="${pageContext.request.contextPath}/meeting/add">&nbsp;预定会议</a></li>
							<li ><a href="${pageContext.request.contextPath}/meeting/approve">&nbsp;会议审批</a></li>
							<li ><a href="${pageContext.request.contextPath}/meeting/approveRecord">&nbsp;审批记录</a></li>
						</ul>  
					</li>
				</ul>
			</div>
			
