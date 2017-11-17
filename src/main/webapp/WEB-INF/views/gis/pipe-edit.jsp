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

</head>

<body>
<form id="pipe_form" action="" method="post">
	<input type="hidden" name="id" value="${pipeLine.id }">
	<table cellspacing="0" cellpadding="0">
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">管道名称<font style="color: red">*</font></th>
			<td><input type="text" name="title" class="easyui-validatebox"
					required="true" missingMessage="不能为空"
					value="${pipeLine.title}" />
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">管道编号<font style="color: red">*</font></th>
				<td><input type="text" name="code" class="easyui-validatebox"
					required="true" missingMessage="不能为空"
					value="${pipeLine.code}" />
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">管道长度<font style="color: red">*</font></th>
				<td><input type="text" name="length" class="easyui-numberbox"
					required="true" missingMessage="不能为空"
					min="0" max="99999" precision="2"
					value="${pipeLine.length}" />(长度单位：米)
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">管网类型<font style="color: red">*</font></th>
			<td>
			<select name="classid">
				<c:forEach items="${makFacts }" var="makfact">
	              	<option value="${makfact.id }" <c:if test="${pipeLine.classid==makfact.id }">  selected="selected" </c:if> >${makfact.title }</option>
	            </c:forEach>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">责任企业<font style="color: red">*</font></th>
			<td>
			<select name="corpid">
				<option value="">-----请选择----</option>
				<c:forEach items="${corplist }" var="corp">
					<option value="${corp.id }" <c:if test="${corp.id==pipeLine.corpid }">selected="selected"</c:if>>${corp.title }</option>
				</c:forEach>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">使用状态</th>
				<td>
				<select name="state">
					<option value="1" <c:if test="${pipeLine.state=='1' }"> selected="selected"</c:if>>使用</option>
					<option value="0" <c:if test="${pipeLine.state=='0' }"> selected="selected"</c:if>>废弃</option>
				</select>		
				</td>
		</tr>
			
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;height: 50px;">备注说明</th>
			<td><textarea rows="5" cols="30" name="remark">${pipeLine.remark}</textarea>  </td>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
var basepath = "${pageContext.request.contextPath}";
var pipeid = "${pipeLine.id}";
var editRow = undefined;
$('#pipe_point_list').datagrid({
		height : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,//是否可折叠的 
		fit : true,//自动大小 
		loadMsg : '数据加载中请稍后……',
		//url : basepath+'/company/datagrid',
		url : basepath+'/pipe/pipePoints?pipeid='+pipeid,
		remoteSort : false,
		fitColums : true,
		checkOnSelect : true,
		idField: 'id',
		rownumbers : true,//行号 
		columns : [ [ {
			field : 'lng',
			title : '经度',
			width : 150,
			editor: { type: 'numberbox', options: { required: true,missingMessage:'数据不能为空' } }
		},{
			field : 'lat',
			title : '维度',
			width : 150,
			editor: { type: 'numberbox', options: { required: true,missingMessage:'数据不能为空' } }
		},{
			field : 'remark',
			title : '备注',
			width : 200,
			editor: { type: 'text' }
		}]],
		toolbar : [ {
			text : '新增',
			iconCls : 'icon-add',
			handler : function() {
				 if (editRow != undefined) {
	                    $("#pipe_point_list").datagrid('endEdit', editRow);
	             }
	             if (editRow == undefined) {
	                    $("#pipe_point_list").datagrid('insertRow', {
	                        index: 0,
	                        row: {}
	                    });
	                    $("#pipe_point_list").datagrid('beginEdit', 0);
	                    editRow = 0;
	             }
			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {
				var row = $("#pipe_point_list").datagrid('getSelected');
	            if (row !=null) {
	                if (editRow != undefined) {
	                    $("#pipe_point_list").datagrid('endEdit', editRow);
	                }
	
	                if (editRow == undefined) {
	                    var index = $("#pipe_point_list").datagrid('getRowIndex', row);
	                    $("#pipe_point_list").datagrid('beginEdit', index);
	                    editRow = index;
	                    $("#pipe_point_list").datagrid('unselectAll');
	                }
	            } else {
	                 
	            }
			}
		},'-', {
	        text: '保存', iconCls: 'icon-save', handler: function () {
	            $("#pipe_point_list").datagrid('endEdit', editRow);
	            //使用JSON序列化datarow对象，发送到后台。
	            var rows = $("#pipe_point_list").datagrid('getChanges');
	            var rowstr = JSON.stringify(rows);
	            $.ajax({  
	                type: "post", // 请求方式  
	                url: basepath+"/pipe/savePoints?pipeid="+pipeid+"&", //url地址  
	                data:rowstr, //数据  
	                contentType: "application/json",  
	                dataType: "json",  
	                success: function (response, ifo) {  
	                    //alert("success"); 
	                     $("#pipe_point_list").datagrid('reload');  
	                }, error: function () {  
	                    alert("error");  
	                }  
	            }); 
	        }
	    }, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {
				var rows = $("#pipe_point_list").datagrid('getSelections');
				var rowstr = JSON.stringify(rows);
				$.ajax({  
	                type: "post", // 请求方式  
	                url: basepath+"/prop/remove", //url地址  
	                data:rowstr, //数据  
	                contentType: "application/json",  
	                dataType: "json",  
	                success: function (response, ifo) {  
	                     $("#pipe_point_list").datagrid('reload');  
	                }, error: function () {  
	                    alert("error");  
	                }  
	            }); 
			}
		} ],
		onAfterEdit: function (rowIndex, rowData, changes) {
	        editRow = undefined;
	    },
	    onDblClickRow: function (rowIndex, rowData) {
	        if (editRow != undefined) {
	            $("#pipe_point_list").datagrid('endEdit', editRow);
	        }
	
	        if (editRow == undefined) {
	            $("#pipe_point_list").datagrid('beginEdit', rowIndex);
	            editRow = rowIndex;
	        }
	    },
	    onClickRow: function (rowIndex, rowData) {
	        if (editRow != undefined) {
	            $("#pipe_point_list").datagrid('endEdit', editRow);
	        }
	    }
	});	
</script>	
</body>
</html>
