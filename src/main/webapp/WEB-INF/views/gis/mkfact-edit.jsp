<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图层要素表单</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script src="${pageContext.request.contextPath}/static/jscolor/jscolor.js"></script>
</head>

<body>
<div class="easyui-tabs" style="width:auto;height:auto">
	<div title="基本信息" style="padding:10px">
	<form id="mkfact_form" action="" method="post">
	<input type="hidden" name="id" value="${mkfact.id }">
	<table cellspacing="0" cellpadding="0">
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">要素名称<font style="color: red">*</font></th>
			<td><input type="text" name="title" class="easyui-validatebox"
					required="true" missingMessage="不能为空"
					value="${mkfact.title}" />
			</td>
		</tr>
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">线条颜色<font style="color: red">*</font></th>
			<td>
			<select id="linecolor" name="linecolor">
				<option value="#FF0000" <c:if test="${mkfact.linecolor=='#FF0000'}"> selected="selected" </c:if>>红色</option>
				<option value="#006400" <c:if test="${mkfact.linecolor=='#006400'}"> selected="selected" </c:if>>绿色</option>
				<option value="#FFFF00" <c:if test="${mkfact.linecolor=='#FFFF00'}"> selected="selected" </c:if>>黄色</option>
				<option value="#000000" <c:if test="${mkfact.linecolor=='#000000'}"> selected="selected" </c:if>>黑色</option>
				<option value="#000079" <c:if test="${mkfact.linecolor=='#000079'}"> selected="selected" </c:if>>蓝色</option>
			</select>
			</td>
		</tr>
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">填充颜色<font style="color: red">*</font></th>
			<td>
			<select id="fillcolor" name="fillcolor">
				<option value="#FF0000" <c:if test="${mkfact.fillcolor=='#FF0000'}"> selected="selected" </c:if>>红色</option>
				<option value="#006400" <c:if test="${mkfact.fillcolor=='#006400'}"> selected="selected" </c:if>>绿色</option>
				<option value="#FFFF00" <c:if test="${mkfact.fillcolor=='#FFFF00'}"> selected="selected" </c:if>>黄色</option>
				<option value="#000000" <c:if test="${mkfact.fillcolor=='#000000'}"> selected="selected" </c:if>>黑色</option>
				<option value="#000079" <c:if test="${mkfact.fillcolor=='#000079'}"> selected="selected" </c:if>>蓝色</option>
			</select>
			</td>
		</tr>
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">线条宽度<font style="color: red">*</font></th>
			<td><input type="text" name="weight" class="easyui-numberbox easyui-validatebox"
					min="0" max="10" precision="0"
					required="true" missingMessage="不能为空"
					value="${mkfact.weight}" />
			</td>
		</tr>
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">透明度<font style="color: red">*</font></th>
			<td><input type="text" name="opacity" class="easyui-numberbox easyui-validatebox"
					min="0" max="1" precision="1"
					required="true" missingMessage="不能为空"
					value="${mkfact.opacity}" />
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">要素类别<font style="color: red">*</font></th>
			<td>
			<select name="classfy">
	            <option value="LAND" <c:if test="${mkfact.classfy=='LAND' }">  selected="selected" </c:if> >土地资源</option>
	            <option value="PIPE" <c:if test="${mkfact.classfy=='PIPE' }">  selected="selected" </c:if> >管网管线</option>
	            <option value="CORP" <c:if test="${mkfact.classfy=='CORP' }">  selected="selected" </c:if> >行业分类</option>
	            <option value="SCALE" <c:if test="${mkfact.classfy=='SCALE' }">  selected="selected" </c:if> >企业规模</option>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">状态</th>
				<td>
				<select name="state">
					<option value="1" <c:if test="${mkfact.state=='1' }"> selected="selected"</c:if>>启用</option>
					<option value="0" <c:if test="${mkfact.state=='0' }"> selected="selected"</c:if>>禁用</option>
				</select>		
				</td>
		</tr>
			
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">备注说明<font style="color: red">*</font></th>
			<td><textarea rows="" cols="" name="remark">${mkfact.remark}</textarea>  </td>
			</td>
		</tr>
	</table>
	</form>
	</div>
</div>
<div></div>
<script type="text/javascript">
var basepath = "${pageContext.request.contextPath}";
/* $(function(){
	$("#linecolor").colorpicker({
	    fillcolor:true
	});
	
	$("#fillcolor").colorpicker({
	    fillcolor:true
	});
}); */
</script>	
</body>
</html>
