<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区土地资源</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/syUtil.js"
	charset="utf-8"></script>
<style type="text/css">
th{
	font-size: 12px;
  	padding: 5px 10px;
}

.datagrid-header td{
	text-align: center;
}
</style>
</head>

<body style="margin: 0px;">
<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'north',title:''" style="height: 80px; background: #F4F4F4;">
		<form id="searchForm">
			<table>
			  <tr>
	              <th>土地名称：</th>
	              <td><input id="title" name="title" value=""/></td>
	              <th>土地编号：</th>
	              <td><input id="code" name="code" value=""/></td>
	              <th>所属企业：</th>
	              <td>
	              	<select id="corpid" name="corpid">
	              		<option value="">----- 请选择-----</option>
	              		<c:forEach items="${corplist }" var="corp">
	              			<option value="${corp.id }">${corp.title }</option>
	              		</c:forEach>
	              	</select>
	              </td>
	            </tr>
	            <tr>
	              <th>土地类型：</th>
	              <td>
	              	<select id="classid" name="classid">
	              		<option value="">----- 请选择-----</option>
	              		<c:forEach items="${makFacts }" var="makfact">
	              			<option value="${makfact.id }">${makfact.title }</option>
	              		</c:forEach>
	              	</select>
	              </td>
	              <th>土地状态：</th>
	              <td>
	              	<select id="state" name="state">
	              		<option value="">----- 请选择-----</option>
	              		<option value="1">使用</option>
	              		<option value="0">闲置</option>
	              	</select>
	              </td>
	          	  <td><a class="easyui-linkbutton" href="javascript:void(0);" onclick="searchFunc();">查找</a></td>
	          </tr>                     
			</table>
		</form>                                    
	</div>            
	<div data-options="region:'center',split:false">
		<table id="land_list" cellspacing="0" cellpadding="0"></table>
	</div>
	<div id="toobar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<shiro:hasPermission name="corp:create">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onClick="addFun()">新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="corp:update">
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onClick="editFun()">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="corp:delete">
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onClick="delFun()">删除</a>
			</shiro:hasPermission>
		</div>
	<div>
</div>
<div id="land_window"></div>

<script type="text/javascript">
	var basepath="${pageContext.request.contextPath}";
	$(function() {
		$("#land_list").datagrid({
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			loadMsg : '数据加载中请稍后……',
			url : basepath+'/land/datagrid',
			remoteSort : false,
			fitColums : true,
			checkOnSelect : true,
			pagination : true,//分页控件 
			rownumbers : true,//行号
			idField: 'id',
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : 150,
				checkbox : true
			}, {
				field : 'title',
				title : '标题',
				width : 150
			},{
				field : 'code',
				title : '编号',
				width : 150
			},{
				field : 'measure',
				title : '面积(单位：平方米)',
				width : 150
			}, {
				field : 'corpname',
				title : '所属企业',
				width : 150
			}, {
				field : 'classfy',
				title : '土地类型',
				width : 100
			},{
				field : 'state',
				title : '状态',
				width : 100,
				formatter:function(value,row){
			    	var str = "";
			    	if(value=="0"){
			    		str = "<font style=''>闲置</font>";
			    	}else{
			    		str = "<font style=''>使用</font>";
			    	}
			    	 return str;
				}
			}, {
				field : 'remark',
				title : '备注说明',
				width : 150
			}  ] ],
			toolbar : '#toobar',
			pageSize : 15,
			pageList : [10, 15 ]
		});
		var p = $('#land_list').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	});
		
	function addFun() {
		var land_add_dialog = $('#land_window').dialog({
		title : '新增土地资源',
		width : 600,
		height : 400,
		closed : false,
		cache : false,
		href : basepath+'/land/dataform',
		modal : true,
		buttons : [ {
			text : '添       加',
			handler : function() {
			$('#land_form').form('submit',
				{
					url : basepath+'/land/create',
					success : function(data) {
						var json = $.parseJSON(data);
						if (json.success) {
							$('#land_list').datagrid('load');
							land_add_dialog.dialog('close');
						}
						$.messager.show({
							title : '提示',
							msg : result.msg,
							timeout : 3000,
							showType : 'slide'
						});
					}
				});
			}
		} ]
	});
	}
	/*编辑*/
	function editFun() {
		var checkedRows = $("#land_list").datagrid('getChecked');
		if (checkedRows.length == 1) {
			var land_window_dialog = $('#land_window').dialog({
			title : '土地资源变更',
			width : 600,
			height : 400,
			closed : false,
			cache : false,
			href : basepath+'/land/dataform?id='+checkedRows[0].id,
			modal : true,
			buttons : [ {
				text : '保   存',
				handler : function() {
					$('#land_form').form('submit',{
						url : basepath+'/land/update',
						success : function(data) {
							var result = $.parseJSON(data);
							if (result.success) {
								$('#land_list').datagrid('load');
								land_window_dialog.dialog('close');
							}
							$.messager.show({
								title : '提示',
								msg : result.msg,
								timeout : 3000,
								showType : 'slide'
							});
						}
					});
				}
			} ]
		});

		} else if(checkedRows.length > 1) {
			$.messager.show({
				title : '提示',
				msg : '只能选择一个记录删除!',
				timeout : 3000,
				showType : 'slide'
			});
		}else {
			$.messager.show({
				title : '提示',
				msg : '请勾选想要删除的记录!',
				timeout : 3000,
				showType : 'slide'
			});
		}
	}		

	//记录删除
	function delFun(){
		var checkedRows = $("#land_list").datagrid('getChecked');
		if(checkedRows.length == 1) {
			$.messager.confirm('确认', '您是否要删除当前选中的记录？', function(r) {
				if(r) {
					$.ajax({
						url : basepath+'/land/delete',
						data : {
							id : checkedRows[0].id
						},
						type:'POST',
						dataType : 'json',
						success : function(json) {
							if (json.success) {
								$("#land_list").datagrid('load');
							}
							$.messager.show({
								title : '提示',
								msg : json.msg
							});
						}
					});
				}
			});
		} else if(checkedRows.length > 1) {
			$.messager.show({
				title : '提示',
				msg : '只能选择一个记录删除!',
				timeout : 3000,
				showType : 'slide'
			});
		}else {
			$.messager.show({
				title : '提示',
				msg : '请勾选想要删除的记录!',
				timeout : 3000,
				showType : 'slide'
			});
		}
	}

	
	function searchFunc(){
		var paramobj={
			title:$("#title").val(),
			code:$("#code").val(),
			classid:$("#classid").val(),
			corpid:$("#corpid").val(),
			state:$("#state").val()
		};
        $("#land_list").datagrid("load",paramobj);
	}
	
	//点击清空按钮出发事件
    function clearSearch() {
        $("#land_list").datagrid("load", {});
        $("#searchForm").find("input").val("");
    }		
		
		
</script>
</body>
</html>
