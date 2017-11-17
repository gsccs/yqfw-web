<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区企业监测指标</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
</head>

<body>
	<form id="monitortypeForm" action="" method="post">
		<input type="hidden" name="id" value="${monitortype.id }">
		<input type="hidden" name="ordernum" value="${monitortype.ordernum }">
	<table cellspacing="0" cellpadding="0">
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">指标名称<font style="color: red">*</font></th>
			<td><input type="text" name="title" class="easyui-validatebox"
					required="true" missingMessage="不能为空"
					value="${monitortype.title}" />
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">指标别名<font style="color: red">*</font></th>
			<td><input type="text" name="alias" value="${monitortype.alias}" />
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">指标单位<font style="color: red">*</font></th>
				<td><input type="text" name="unit" class="easyui-validatebox"
					required="true" missingMessage="不能为空"
					value="${monitortype.unit}" />
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">状态<font style="color: red">*</font></th>
			<td>
			<select name="state">
				<option value="1" <c:if test="${monitortype.state=='1' }">selected="selected"</c:if>>正常</option>
				<option value="0" <c:if test="${monitortype.state=='0' }">selected="selected"</c:if>>禁用</option>
			</select>
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">备注说明<font style="color: red">*</font></th>
			<td><textarea rows="" cols="" name="remark">${monitortype.remark}</textarea>  </td>
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>
