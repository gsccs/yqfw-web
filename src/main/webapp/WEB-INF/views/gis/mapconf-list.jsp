<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>地图配置信息列表</title>
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
	<div data-options="region:'center',split:false">
		<table id="list_data" cellspacing="0" cellpadding="0"></table>
	</div>
	<div id="toobar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<shiro:hasPermission name="corp:create">
			<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onClick="addFun()">新增</a> -->
			</shiro:hasPermission>
			<shiro:hasPermission name="corp:update">
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onClick="editFun()">修改</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="corp:delete">
			<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onClick="delFun()">删除</a> -->
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
		$("#list_data").datagrid({
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			loadMsg : '数据加载中请稍后……',
			url : basepath+'/mapconf/datagrid',
			remoteSort : false,
			fitColums : true,
			checkOnSelect : true,
			//singleSelect : false,//是否单选 
			pagination : true,//分页控件 
			rownumbers : true,//行号
			idField: 'authkey',
			columns : [ [ {
				field : 'authkey',
				title : '授权码',
				width : 150,
				checkbox : true
			}, {
				field : 'title',
				title : '应用名称',
				width : 150
			}, {
				field : 'centerx',
				title : '中心点经度',
				width : 100
			}, {
				field : 'centery',
				title : '中心点纬度',
				width : 100
			}, {
				field : 'tel',
				title : '视野控制',
				width : 100,
				formatter:function(value,row){
			    	var str = "";
			    	if(value=="1"){
			    		str = "<font style=''>启用</font>";
			    	}else{
			    		str = "<font style=''>关闭</font>";
			    	}
			    	 return str;
				}
			},{
				field : 'bsswlng',
				title : '左下角经度',
				width : 100
			}, {
				field : 'bsswlat',
				title : '左下角维度',
				width : 100
			}, {
				field : 'bsnelng',
				title : '右上角经度',
				width : 100
			}, {
				field : 'bsnelat',
				title : '右上角维度',
				width : 100
			}, {
				field : 'city',
				title : '城市名称',
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
			},{
				field : 'remark',
				title : '描述',
				width : 150
			} ] ],
			toolbar : '#toobar',
			pageSize : 15,
			pageList : [10, 15 ]
		});
		var p = $('#list_data').datagrid('getPager');
		$(p).pagination({
			pageSize : 15,				//每页显示的记录条数，默认为10 
			pageList : [ 5, 10, 15 ],	//可以设置每页记录条数的列表 
			beforePageText : '第',		//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	});
	
	
	function addFun() {
		window.location.href=basepath+'/mapconf/dataform'	
	}
	
		/*编辑*/
		function editFun() {
			var checkedRows = $("#list_data").datagrid('getChecked');
			if (checkedRows.length == 1) {
				window.location.href=basepath+'/mapconf/dataform?id='+checkedRows[0].authkey
			} else if(checkedRows.length > 1) {
				$.messager.show({
					title : '提示',
					msg : '只能选择一个记录操作!',
					timeout : 3000,
					showType : 'slide'
				});
			}else {
				$.messager.show({
					title : '提示',
					msg : '请勾选想要编辑的记录!',
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
							url : basepath+'/mapconf/delete',
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
				classid:$("#classid").val(),
				scaleid:$("#scaleid").val()
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
