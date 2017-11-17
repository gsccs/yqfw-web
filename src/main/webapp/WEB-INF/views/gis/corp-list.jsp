<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业信息列表</title>
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
<script type="text/javascript">

</script>
<div class="easyui-layout" fit="true" border="false">
	<div data-options="region:'north',title:''" style="height: 50px; background: #F4F4F4;">
		<form id="searchForm">
			<table>
			  <tr>
	              <th>企业名称：</th>
	              <td><input id="title" name="title" value=""/></td>
	              <th>行业分类：</th>
	              <td>
	              	<select id="classid" name="classid">
	              		<option value="">----- 请选择-----</option>
	              		<c:forEach items="${makFacts }" var="makfact">
	              			<option value="${makfact.id }">${makfact.title }</option>
	              		</c:forEach>
	              	</select>
	              </td>
	              
	               <th>企业规模：</th>
	              <td>
	              	<select id="scaleid" name="scaleid">
	              		<option value="">----- 请选择-----</option>
	              		<c:forEach items="${scaleList }" var="makfact">
	              			<option value="${makfact.id }">${makfact.title }</option>
	              		</c:forEach>
	              	</select>
	              </td>
	              
	          	  <td><a class="easyui-linkbutton" href="javascript:void(0);" onclick="searchFunc();">查找</a></td>
	          </tr>                     
			</table>
		</form>                                    
	</div>
	            
	<div data-options="region:'center',split:false">
		<table id="corp_data" cellspacing="0" cellpadding="0"></table>
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
	
<div id="corp_window"></div>

<script type="text/javascript">
	var basepath = "${pageContext.request.contextPath}";
	 $.extend($.fn.datagrid.methods, {  
	     addToolbarItem: function(jq, items){  
	         return jq.each(function(){  
	             var toolbar = $(this).parent().prev("div.datagrid-toolbar");
	             for(var i = 0;i<items.length;i++){
	                 var item = items[i];
	                 if(item === "-"){
	                     toolbar.append('<div class="datagrid-btn-separator"></div>');
	                 }else{
	                     var btn=$("<a href=\"javascript:void(0)\"></a>");
	                     btn[0].onclick=eval(item.handler||function(){});
	                     btn.css("float","left").appendTo(toolbar).linkbutton($.extend({},item,{plain:true}));
	                 }
	             }
	             toolbar = null;
	         });  
	     },
	     removeToolbarItem: function(jq, param){  
	         return jq.each(function(){  
	             var btns = $(this).parent().prev("div.datagrid-toolbar").children("a");
	             var cbtn = null;
	             if(typeof param == "number"){
	                 cbtn = btns.eq(param);
	             }else if(typeof param == "string"){
	                 var text = null;
	                 btns.each(function(){
	                     text = $(this).data().linkbutton.options.text;
	                     if(text == param){
	                         cbtn = $(this);
	                         text = null;
	                         return;
	                     }
	                 });
	             } 
	             if(cbtn){
	                 var prev = cbtn.prev()[0];
	                 var next = cbtn.next()[0];
	                 if(prev && next && prev.nodeName == "DIV" && prev.nodeName == next.nodeName){
	                     $(prev).remove();
	                 }else if(next && next.nodeName == "DIV"){
	                     $(next).remove();
	                 }else if(prev && prev.nodeName == "DIV"){
	                     $(prev).remove();
	                 }
	                 cbtn.remove();    
	                 cbtn= null;
	             }                        
	         });  
	     }                 
	 });
	$(function() {
		$("#corp_data").datagrid({
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			loadMsg : '数据加载中请稍后……',
			url : basepath+'/company/datagrid',
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
				title : '企业名称',
				width : 150
			}, {
				field : 'leader',
				title : '负责人',
				width : 80
			}, {
				field : 'tel',
				title : '联系电话',
				width : 80
			},{
				field : 'address',
				title : '位置',
				width : 150
			}, {
				field : 'classfy',
				title : '行业',
				width : 100
			}, {
				field : 'scalestr',
				title : '规模',
				width : 100
			}, {
				field : 'newtimestr',
				title : '成立日期',
				width : 100
			}, {
				field : 'intimestr',
				title : '入驻日期',
				width : 100
			}, {
				field : 'state',
				title : '状态',
				width : 50,
				formatter:function(value,row){
			    	var str = "";
			    	if(value=="0"){
			    		str = "<font style=''>关闭</font>";
			    	}else{
			    		str = "<font style=''>正常</font>";
			    	}
			    	 return str;
				}
			}, {
				field : 'lng',
				title : '经度',
				width : 100
			},{
				field : 'lat',
				title : '维度',
				width : 100
			}, {
				field : 'remark',
				title : '描述',
				width : 150
			} ] ],
			toolbar : '#toobar',
			pageSize : 15,
			pageList : [10, 15 ]
		});
		var p = $('#corp_data').datagrid('getPager');
		$(p).pagination({
			pageSize : 15,				//每页显示的记录条数，默认为10 
			pageList : [ 5, 10, 15 ],	//可以设置每页记录条数的列表 
			beforePageText : '第',		//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	});
	
	
	function addFun() {
			var corp_add_dialog = $('#corp_window').dialog({
			title : '新增企业',
			width : 600,
			height : 400,
			closed : false,
			cache : false,
			href : basepath+'/company/dataform',
			modal : true,
			buttons : [ {
				text : '添加',
				handler : function() {
				$('#corp_form').form('submit',
					{
						url : basepath+'/company/create',
						success : function(data) {
							var result = $.parseJSON(data);
							if (result.success) {
								$('#corp_data').datagrid('load');
								corp_add_dialog.dialog('close');
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
			var checkedRows = $("#corp_data").datagrid('getChecked');
			if (checkedRows.length == 1) {
				var corp_window_dialog = $('#corp_window').dialog({
				title : '企业信息编辑',
				width : 600,
				height : 400,
				closed : false,
				cache : false,
				href : basepath+'/company/dataform?id='+checkedRows[0].id,
				modal : true,
				buttons : [ {
					text : '保   存',
					handler : function() {
						$('#corp_form').form('submit',{
							url : basepath+'/company/update',
							success : function(data) {
								var result = $.parseJSON(data);
								if (result.success) {
									$('#corp_data').datagrid('load');
									corp_window_dialog.dialog('close');
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
			var checkedRows = $("#corp_data").datagrid('getChecked');
			if(checkedRows.length == 1) {
				$.messager.confirm('确认', '您是否要删除当前选中的记录？', function(r) {
					if(r) {
						$.ajax({
							url : basepath+'/company/delete',
							data : {
								id : checkedRows[0].id
							},
							type:'POST',
							dataType : 'json',
							success : function(json) {
								if (json.success) {
									$("#corp_data").datagrid('load');
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
				classid:$("#classid").val(),
				scaleid:$("#scaleid").val()
			};
	        $("#corp_data").datagrid("load",paramobj);
		}
		
		//点击清空按钮出发事件
	    function clearSearch() {
	        $("#corp_data").datagrid("load", {});
	        $("#searchForm").find("input").val("");
	    }
	</script>

</body>
</html>
