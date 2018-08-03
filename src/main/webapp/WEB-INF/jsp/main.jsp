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
<!-- 加入汉化js文件 -->
<script type="text/javascript"
	src="${APP_PATH }/static/jquery-easyui-1.5.5.4/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'北',split:true"
		style="height: 100px;"></div>
	<div data-options="region:'south',title:'南',split:true"
		style="height: 100px;"></div>
	<div
		data-options="region:'west',title:'导航栏',split:true,iconCls:'icon-nav'"
		style="width: 150px;">
		<ul id="tt" class="easyui-tree">
		</ul>

	</div>
	<div data-options="region:'center',title:'中间',noheader:true"
		style="padding: 5px; background: #eee;">

		<div id="tabs" class="easyui-tabs" data-options="fit:true">
			<div title="首页" style="padding: 20px; display: none;">欢迎登陆后台管理系统</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#tt').tree({
				url : '${APP_PATH}/main/navs',
				animate : true,
				checkbox : true,
				lines : true,
				onClick : function(node) {
					//alert(node.href);  // 在用户点击的时候提示
					var flag = $('#tabs').tabs('exists', node.text);
					if (!flag) {//判断选项卡是否已经创建,不存在才创建，有就直接跳转指定的选项卡
						if (node.href != null) { //判断有地址的才创建选项卡
							$('#tabs').tabs('add', {
								title : node.text,
								selected : node.text,
								iconCls : node.iconCls,//图标
								closable : true,//显示关闭
								href : '${APP_PATH}/' + node.href //点击指定的菜单显示相应的选项卡
							});
						}
					} else {
						$('#tabs').tabs('select', node.text);
					}
				}

			});
		});
	</script>
</body>
</html>