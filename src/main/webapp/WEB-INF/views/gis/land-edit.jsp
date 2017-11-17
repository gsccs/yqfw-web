<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区土地管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
</head>

<body>
	<form id="land_form" action="" method="post">
		<input type="hidden" name="id" value="${landInfo.id }">
	<table cellspacing="0" cellpadding="0">
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">土地名称<font style="color: red">*</font></th>
				<td><input type="text" name="title" class="easyui-validatebox"
					required="true" missingMessage="不能为空"
					value="${landInfo.title}" />
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">土地编号<font style="color: red">*</font></th>
				<td><input type="text" name="code" class="easyui-validatebox"
					required="true" missingMessage="不能为空"
					value="${landInfo.code}" />
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
				<th style="width: 130px;">土地面积<font style="color: red">*</font></th>
				<td><input type="text" name="measure" class="easyui-numberbox"
					required="true" missingMessage="不能为空"
					min="0" max="99999" precision="2"
					value="${empty landInfo.measure ? 0.00:landInfo.measure}" />(单位:平方米)
				</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">土地类型<font style="color: red">*</font></th>
			<td>
			<select name="classid">
				<c:forEach items="${makFacts }" var="makfact">
	              	<option value="${makfact.id }" <c:if test="${landInfo.classid==makfact.id }">  selected="selected" </c:if> >${makfact.title }</option>
	            </c:forEach>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">责任企业</th>
			<td>
			<select name="corpid">
				<option value="">-----请选择----</option>
				<c:forEach items="${corplist }" var="corp">
					<option value="${corp.id }" <c:if test="${corp.id==landInfo.corpid }">selected="selected"</c:if>>${corp.title }</option>
				</c:forEach>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">土地状态</th>
			<td>
			<select name="state">
				<option value="1" <c:if test="${landInfo.state=='1' }"> selected="selected"</c:if>  >正常</option>
				<option value="0" <c:if test="${landInfo.state=='0' }"> selected="selected"</c:if>>禁用</option>
			</select>		
			</td>
		</tr>
		
		<tr class="thclass" style="height: 40px">
			<th style="width: 130px;">备注说明</th>
			<td><textarea rows="" cols="" name="remark" style="width: 300px;height:70px;">${landInfo.remark}</textarea>  </td>
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>
