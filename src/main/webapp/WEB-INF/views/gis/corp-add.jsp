<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区企业信息表单</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
</head>

<style>
	input{width: 200px;}
</style>

<body>
	<form id="corp_form"  method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${company.id }" />
		<input type="hidden" name="lng" value="${company.lng }" />
		<input type="hidden" name="lat" value="${company.lat }" />
		<table class="tableForm" style="margin-top: 10px;">
			<tr>
				<th style="width: 130px;text-align: right;">企业名称<font style="color: red">*</font></th>
				<td><input type="text" name="title" class="easyui-validatebox" class="easyui-validatebox " required="true"  missingMessage="企业名称不能为空" value="${company.title }"/></td>
				<td colspan="2" rowspan="2" style="text-align: right;">
					<c:if test="${empty company.logo }">
						<img alt="" src="/yqfw/upload/0.png" width="180px" height="80px" onclick="showUpload()" />
					</c:if>
					<c:if test="${not empty company.logo}">
						<img alt="企业LOGO" title="企业LOGO" src="${company.logo }" width="180px" height="80px" onclick="showUpload()" />
					</c:if>
				</td>
			</tr>
			<tr>
				<th style="width: 130px;text-align: right;">企业位置<font style="color: red">*</font></th>
				<td><input type="text" name="address" class="" class="easyui-validatebox " value="${company.address }"/></td>
			</tr>
			<tr>
				<th style="width: 130px;text-align: right;">企业负责人<font style="color: red">*</font></th>
				<td><input type="text" name="leader" class="easyui-validatebox" class="easyui-validatebox " required="true"  missingMessage="负责人不能为空" value="${company.leader }"/></td>
				<th style="width: 130px;text-align: right;">联系电话<font style="color: red">*</font></th>
				<td><input type="text" name="tel" class="easyui-validatebox" class="easyui-validatebox " required="true"  missingMessage="联系电话 不能为空" value="${company.tel }"/></td>
			</tr>
			
			<tr class="thclass" style="height: 40px">
				<th style="width: 130px;text-align: right;">创建日期<font style="color: red">*</font></th>
				<td>
					<input class="easyui-datetimebox" editable="false" name="newtime" class="easyui-validatebox"
						required="true" missingMessage="不能为空" value="${company.newtime}"/></td>
				</td>
				<th style="width: 130px;text-align: right;">入驻时间<font style="color: red">*</font></th>
				<td>
					<input class="easyui-datetimebox" editable="false" name="intime" class="easyui-validatebox"
						required="true" missingMessage="不能为空" value="${company.intime}"/></td>
				</td>
			</tr>
			
			<tr>
				<th style="width: 130px;text-align: right;">行业分类</th>
				<td>
					<select name="classid">
						<c:forEach items="${makFacts }" var="makfact">
			              	<option value="${makfact.id }" <c:if test="${company.classid==makfact.id }">  selected="selected" </c:if> >${makfact.title }</option>
			            </c:forEach>
					</select>
				</td>
				
				<th style="width: 130px;text-align: right;">企业规模</th>
				<td>
					<select name="scaleid">
						<c:forEach items="${scaleList }" var="makfact">
			              	<option value="${makfact.id }" <c:if test="${company.classid==makfact.id }">  selected="selected" </c:if> >${makfact.title }</option>
			            </c:forEach>
					</select>
				</td>
			</tr>
			
			<tr class="thclass" style="height: 40px">
				<th style="width: 130px;text-align: right;">状态</th>
				<td colspan="3">
				<select name="state">
					<option value="1" <c:if test="${company.state=='1' }"> selected="selected"</c:if>  >正常</option>
					<option value="0" <c:if test="${company.state=='0' }"> selected="selected"</c:if>>禁用</option>
				</select>		
				</td>
			</tr>
			
			<tr>
				<th style="width: 130px;text-align: right;">企业描述</th>
				<td colspan="3" >
					<textarea style="width: 350px;" rows="3" cols="25" name="remark">${company.remark }</textarea>
				</td>
			</tr>
			
			<tr id="logoupload" <c:if test="${not empty company.logo}">style="display: none;"</c:if> >
				<th style="width: 130px;text-align: right;">LOGO</th>
				<td colspan="3"><input id="imgfile" type="file" style="border: #666666 1px solid; width:170px;" name="file" value=""> (请上传格式为jpg,jpeg,gif,png格式的图片文件)</td>
			</tr>
			
			
			<%-- <tr style="display: none;">
				<th style="width: 130px;text-align: right;">经度</th>
				<td><input type="text" name="lng" class="easyui-validatebox easyui-numberbox" class="easyui-validatebox" required="true"  missingMessage="维度不能为空" value="${company.lng }" min="0" max="99999" precision="2"/></td>
			</tr>
			<tr style="display: none;">
				<th style="width: 130px;text-align: right;">维度</th>
				<td><input type="text" name="lat" class="easyui-validatebox easyui-numberbox" class="easyui-validatebox" required="true"  missingMessage="维度名称不能为空" value="${company.lat }"  min="0" max="99999" precision="2"/></td>
			</tr> --%>
			
		</table>
	</form>
	
<script type="text/javascript">
function showUpload(){
	$("#logoupload").show();
}
</script>
</body>

</html>
