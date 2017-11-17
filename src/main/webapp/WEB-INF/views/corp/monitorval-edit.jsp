<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区企业监测数据</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
</head>

<body>
	<form id="monitorvalForm" action="" method="post">
		<input type="hidden" name="id" value="${monitval.id }">
	<table cellspacing="0" cellpadding="0">
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">监测指标<font style="color: red">*</font></th>
			<td>
			<select name="typeId">
				<c:forEach items="${typelist }" var="typeitem">
					<option value="${typeitem.id }" <c:if test="${typeitem.id==monitval.typeId }">selected="selected"</c:if> >${typeitem.title }</option>
				</c:forEach>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">监测值<font style="color: red">*</font></th>
				<td><input type="text" name="monitval" class="easyui-numberbox"
					required="true" missingMessage="不能为空"
					min="0" max="99999" precision="2"
					value="${monitval.monitval}" />
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">监测日期<font style="color: red">*</font></th>
			<td>
				<input class="easyui-datetimebox" editable="false" name="addtime" class="easyui-validatebox"
					required="true" missingMessage="不能为空" value="${monitval.addtime}"/></td>
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">责任企业<font style="color: red">*</font></th>
			<td>
			<select name="corpId">
				<c:forEach items="${corplist }" var="corp">
					<option value="${corp.id }" <c:if test="${corp.id==monitval.corpId }">selected="selected"</c:if>>${corp.title }</option>
				</c:forEach>
			</select>		
			</td>
		</tr>
		
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">备注说明</th>
			<td><textarea rows="" cols="" name="remark" style="width: 300px;height: 60px;">${monitval.remark}</textarea>  </td>
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>
