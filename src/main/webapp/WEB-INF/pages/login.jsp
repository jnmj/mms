<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
        body {
  padding-top: 80px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
    </style>
</head>
<body>
	<div class="container">

      <form class="form-signin">
        <h1 class="form-signin-heading" style="text-align: center">projectName</h1>
        <label for="input-id" class="sr-only">工号</label>
        <input style="margin-top:20px" type="text" id="input-id" class="form-control" placeholder="工 号"  required autofocus>
        <label for="input-password" class="sr-only">密码</label>
        <input type="password" id="input-password" class="form-control" placeholder="密 码" 
        style="margin-top:0px; margin-bottom:0px" required>
        <span style="color:red;padding-left:5px;visibility:hidden">提示信息</span>
        <button style="margin-top:10px" class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>

    </div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$("form").submit(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/loginValidate",
			type : "POST",
			data : "id=" + $('#input-id').val()+"&password="+$('#input-password').val(),
			dataType : "text",
			async: false,
			success : function(msg) {
				if(msg==0){
					$("span").css("visibility","hidden");
					window.location.href="${pageContext.request.contextPath}/index";
				}else if(msg==-1){
					showIdError();
				}else{
					showPasswordError("密码错误");
				}
			}
		});
		return false;
	});
	
	function showIdError(){
		$("span").css("visibility","visible");
		$("span").html("用户不存在");
	}
	
	function showPasswordError(msg){
		$("span").css("visibility","visible");
		$("span").html(msg);
	}
</script>
</html>