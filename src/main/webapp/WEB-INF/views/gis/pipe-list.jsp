<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区管线管网</title>
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

<body>
<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'north',title:''" style="height: 50px; background: #F4F4F4;">
		<form id="searchForm">
			<table>
			  <tr>
	              <th>管道名称：</th>
	              <td><input id="title" name="title" value=""/></td>
	              <th>管道分类：</th>
	              <td>
	              	<select id="classid" name="classid">
	              		<option value="">----- 请选择-----</option>
	              		<c:forEach items="${makFacts }" var="makfact">
	              			<option value="${makfact.id }">${makfact.title }</option>
	              		</c:forEach>
	              	</select>
	              </td>
	              <th>所属企业：</th>
	              <td>
	              	<select id="corpid" name="corpid">
	              		<option value="">----- 请选择-----</option>
	              		<c:forEach items="${corplist }" var="corp">
	              			<option value="${corp.id }">${corp.title }</option>
	              		</c:forEach>
	              	</select>
	              </td>
	              <th>状态：</th>
	              <td>
	              	<select id="state" name="state">
	              		<option value="">----- 请选择-----</option>
	              		<option value="1">使用</option>
	              		<option value="0">废弃</option>
	              	</select>
	              </td>
	          	  <td><a class="easyui-linkbutton" href="javascript:void(0);" onclick="searchFunc();">查找</a></td>
	              <td><a class="easyui-linkbutton" href="javascript:void(0);" onclick="clearSearch();">清空</a></td>
	          </tr>                     
			</table>
		</form>                                    
	</div>            
	<div data-options="region:'center',split:false">
		<table id="list_data" cellspacing="0" cellpadding="0"></table>
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
<div id="pipe_window"></div>


<script type="text/javascript">
	var basepath = "${pageContext.request.contextPath}";
	$(function() {
		$("#list_data").datagrid({
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			loadMsg : '数据加载中请稍后……',
			url : basepath+'/pipe/datagrid',
			remoteSort : false,
			fitColums : true,
			checkOnSelect : true,
			//singleSelect : false,//是否单选 
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
				title : '名称',
				width : 150
			}, {
				field : 'code',
				title : '编号',
				width : 100
			}, {
				field : 'corpname',
				title : '所属企业',
				width : 150
			}, {
				field : 'classfy',
				title : '管线分类',
				width : 150
			},{
				field : 'length',
				title : '长度(单位：米)',
				width : 150
			}, {
				field : 'state',
				title : '状态',
				width : 150,
				formatter:function(value,row){
			    	var str = "";
			    	if(value=="0"){
			    		str = "<font style=''>废弃</font>";
			    	}else{
			    		str = "<font style=''>使用</font>";
			    	}
			    	 return str;
				}
			}, {
				field : 'remark',
				title : '备注',
				width : 150
			}  ] ],
			toolbar : '#toobar',
			pageSize : 15,
			pageList : [10, 15 ]
		});
		var p = $('#list_data').datagrid('getPager');
		$(p).pagination({
			pageSize : 15,//每页显示的记录条数，默认为10 
			pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	});

	function addFun() {
		var pipe_add_dialog = $('#pipe_window').dialog({
		title : '新增管道管线',
		width : 600,
		height : 400,
		closed : false,
		cache : false,
		href : basepath+'/pipe/dataform',
		modal : true,
		buttons : [ {
			text : '添加',
			handler : function() {
			$('#pipe_form').form('submit',
				{
					url : basepath+'/pipe/create',
					success : function(data) {
						var json = $.parseJSON(data);
						if (json.success) {
							$('#list_data').datagrid('load');
							pipe_add_dialog.dialog('close');
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
		var checkedRows = $("#list_data").datagrid('getChecked');
		if (checkedRows.length == 1) {
			var pipe_window_dialog = $('#pipe_window').dialog({
			title : '管道管线编辑',
			width : 600,
			height : 400,
			closed : false,
			cache : false,
			href : basepath+'/pipe/dataform?id='+checkedRows[0].id,
			modal : true,
			buttons : [ {
				text : '保   存',
				handler : function() {
					$('#pipe_form').form('submit',{
						url : basepath+'/pipe/update',
						success : function(data) {
							var result = $.parseJSON(data);
							if (result.success) {
								$('#list_data').datagrid('load');
								pipe_window_dialog.dialog('close');
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
		var checkedRows = $("#list_data").datagrid('getChecked');
		if(checkedRows.length == 1) {
			$.messager.confirm('确认', '您是否要删除当前选中的记录？', function(r) {
				if(r) {
					$.ajax({
						url : basepath+'/pipe/delete',
						data : {
							id : checkedRows[0].id
						},
						type:'POST',
						dataType : 'json',
						success : function(json) {
							if (json.success) {
								$("#list_data").datagrid('load');
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
        $("#list_data").datagrid("load",paramobj);
	}
	
	//点击清空按钮出发事件
    function clearSearch() {
        $("#list_data").datagrid("load", {});
        $("#searchForm").find("input").val("");
    }
</script>

</body>
</html>
