<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区预警规则</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
</head>

<body>
	<form id="warnruleForm" action="" method="post">
		<input type="hidden" name="id" value="${warnrule.id }">
	<table cellspacing="0" cellpadding="0">
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">监测指标<font style="color: red">*</font></th>
			<td>
			<select name="typeId">
				<c:forEach items="${typelist }" var="typeitem">
					<option value="${typeitem.id }" <c:if test="${typeitem.id==warnrule.typeId }">selected="selected"</c:if> >${typeitem.title }</option>
				</c:forEach>
			</select>		
			</td>
		</tr>
		
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">阀值<font style="color: red">*</font></th>
				<td><input type="text" name="threshold" class="easyui-numberbox"
					required="true" missingMessage="不能为空"
					min="0" max="99999" precision="2"
					value="${empty warnrule.threshold ? 0.00:warnrule.threshold}" />
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">预警条件<font style="color: red">*</font></th>
			<td>
			<select name="rule">
				<option value="gt" <c:if test="${warnrule.rule=='gt' }">selected="selected"</c:if>>大于等于</option>
				<option value="lt" <c:if test="${warnrule.rule=='lt' }">selected="selected"</c:if>>小于等于</option>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">预警状态<font style="color: red">*</font></th>
			<td>
			<select name="state">
				<option value="1" <c:if test="${warnrule.state=='1' }">selected="selected"</c:if>>启用</option>
				<option value="0" <c:if test="${warnrule.state=='0' }">selected="selected"</c:if>>禁用</option>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">备注说明</th>
			<td><textarea rows="" cols="" name="remark" style="width: 300px;height: 60px;">${warnrule.remark}</textarea>  </td>
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>
