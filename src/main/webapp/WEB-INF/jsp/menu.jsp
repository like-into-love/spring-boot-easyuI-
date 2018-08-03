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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="dg"></table>
	<!-- 添加菜单 -->
	<div id="add">
	<form style="padding:10px 20px 10px 40px;" id="addmaun">
		<p>菜单名称: <input type="text" name="text"></p>
		<p>菜单状态: <select name="state">
					<option value="open">展开</option>
					<option value="closed">关闭</option>
					</select></p>
		<p>菜单图标: <input type="text" name="iconCls"></p>
		<p>对应权限: <select name="parentId">
					<option selected="selected">请选择对应权限</option>
					</select>
		</p>
		<p>菜单链接: <input type="text" name="href"></p>
		<div style="padding:5px;text-align:center;">
			<a href="javascript:addSave()" class="easyui-linkbutton" icon="icon-ok" id="addSave">Ok</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-cancel">Cancel</a>
		</div>
	</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#dg').datagrid({
				//发送请求查看所有菜单显示到表格中
				url : '${APP_PATH}/main/getnavsAll.do',
				columns : [ [{
	                field : 'ck',
	                checkbox : true
	            }, {
					field : 'id',
					title : '主键',
					width : 100
				}, {
					field : 'text',
					title : '菜单名称',
					width : 200,
					formatter: function(value,row,index){
						if(row.parentId==0){
							return "<span style='color:red'>"+value+"</span><strong>(一级菜单)</strong>"
						}else{
							return value;
						}
					}
				}, {
					field : 'state',
					title : '菜单状态',
					width : 100,
					formatter: function(value,row,index){
						if (value=="open"){
							return "展开";
						} else {
							return "关闭";
						}
					}

				}, {
					field : 'iconCls',
					title : '菜单图标',
					width : 100
				}, {
					field : 'parentId',
					title : '对应主键的字菜单',
					width : 150
				}, {
					field : 'href',
					title : '菜单链接',
					width : 200,
					formatter: function(value,row,index){
						if(value==null){
							return "无链接";
							
						}else{
							return value;
						}
					}
				}, ] ],
				pagination : true,
				fit : true,
				toolbar: [{
					iconCls: 'icon-add',
					text:'添加菜单',
					handler: function(){//点击按钮触发函数
						$('#add').window({  
							    title:'添加菜单',
							    iconCls: 'icon-add',
							    width:600,    
							    height:400,    
							    modal:true 
						});  
						getparent();//调用查询一级菜单方法，显示下拉列表中
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'编辑菜单',
					handler: function(){alert('编辑菜单')}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除菜单',
					handler: function(){ 
						var rows=$('#dg').datagrid('getSelections'); //返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。                   
					    var id=[];//创建一个空数组保存id
						if(rows.length==0){
						$.messager.alert('提示','请选择要删除的行!');    
					    }else{
					    	for(var i in rows){
								id.push(rows[i].id)
							}
					    	//alert(id)
					    	$.ajax({
					    		//注意发送delete请求不能把数据放到data里面，需要放到url后面
					    		url:"${APP_PATH}/main/deleteMaun/"+id,
					    		dataType:"json",
					    		type:"DELETE",
					    		success:function(result){
					    			if(result){
					    				$.messager.show({
					    					title:'提示消息',
					    					msg:'删除成功。',
					    					timeout:2000,
					    					showType:'slide'
					    				});
					    				//重新加载datagrid的数据 ，但是它将保持在当前页
					    		        $("#dg").datagrid('reload');  
					    			}else{
					    				$.messager.alert('提示消息',' 删除失败!'); 
					    			}
					    		}
					    	});
					    }
					}
				}]
			});
		});
		function addSave(){
			var param=$("#addmaun").serialize();
			//alert(param);
		 $.post("${APP_PATH}/main/addSave",param,function(result){
			  if(result){
				  $.messager.show({
					title:'提示消息',
					msg:'成功添加一条记录。',
					timeout:2000,
					showType:'slide'
				}); 
			 $('#add').window('close');//添加成功关闭窗口
			//重新加载datagrid的数据 ，但是它将保持在当前页
		     $("#dg").datagrid('reload');
			  }else{
				  $.messager.show({
						title:'提示消息',
						msg:'添加记录失败 。',
						timeout:2000,
						showType:'slide'
					});   
			  }
		 });
		};
 	function getparent(){
			$.get("${APP_PATH}/main/getparent",function(result){
				$.each(result,function(index,value){
					var option="<option value='"+value.id+"'>"+value.text+"</option>";
					$("#parentId").append(option);
				})
			})
		}
		
	</script>
</body>
</html>