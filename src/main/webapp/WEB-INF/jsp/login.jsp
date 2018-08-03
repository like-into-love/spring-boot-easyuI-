<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/jquery-easyui-1.5.5.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/jquery-easyui-1.5.5.4/themes/icon.css">
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.easyui.min.js"></script>
</head>
<body>
	<div id="win" class="easyui-window" title="Login"
		data-options="resizable:false,minimizable:false,maximizable:false,collapsible:false"
		style="width: 300px; height: 200px;">
		<form style="padding: 10px 20px 10px 40px;" id="user">
			<p>
				账号: <input type="text" name="username">
			</p>
			<p>
				密码: <input type="password" name="password">
			</p>
			<div style="padding: 5px; text-align: center;">
				<a href="javascript:login()" class="easyui-linkbutton"
					icon="icon-ok">登陆</a> &nbsp; <a href="javascript:void(0)"
					class="easyui-linkbutton" icon="icon-cancel">注册</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function login() {
			$.post("${APP_PATH}/user/login", $("#user").serialize(), function(
					result) {
				if (result == true) {
					window.location.href = "${APP_PATH}/page/main";
				} else {
					$.messager.alert('提示','账号或密码错误!');    
					$("input").val("");
				}
			});

		}
	</script>
</body>
</html>