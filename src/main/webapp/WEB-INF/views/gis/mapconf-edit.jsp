<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>地图配置信息表单</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=glbe8fDURt2c8Nh8YUlflchE"></script>
</head>

<style>
th{
	font-size: 12px;
  	padding: 5px 10px;
}

td{
	font-size: 12px;
  	padding: 5px 10px;
}

</style>

<body>
<div class="easyui-layout" fit="true" border="false">
	<div title="地图配置信息编辑" data-options="region:'center',split:false">
	<form id="gisconf_form" method="post">
		<input type="hidden" id="authkey_" value="${gisconf.authkey }" />
		<div id="conftab" class="easyui-tabs" style="">
		<div title="基本信息" style="">
		<table class="tableForm" style="margin-top: 10px;">
			<tr>
				<th style="width: 130px;text-align: right;">应用授权码<font style="color: red">*</font></th>
				<td colspan="3"><input type="text" name="authkey" class="easyui-validatebox " required="true"  missingMessage="应用授权码不能为空" value="${gisconf.authkey }"/></td>
			</tr>
			
			<tr>
				<th style="width: 130px;text-align: right;">应用名称<font style="color: red">*</font></th>
				<td colspan="3"><input type="text" name="title" class="easyui-validatebox " value="${gisconf.title }"/></td>
			</tr>
			
			<tr class="thclass" style="height: 40px">
				<th style="width: 130px;text-align: right;">城市名称<font style="color: red">*</font></th>
				<td colspan="3">
					<input name="city" class="easyui-validatebox"
						required="true" missingMessage="不能为空" value="${empty gisconf.city ? '张掖':gisconf.city}" /></td>
				</td>
			</tr>
			
			<tr class="thclass" style="height: 40px">
				<th style="width: 130px;text-align: right;">是否默认</th>
				<td colspan="3"><input type="checkbox" id="isdefault" name="isdefault" value="${gisconf.isbound }"/></td>
			</tr>
			
			<tr>
				<th style="width: 130px;text-align: right;">备注信息</th>
				<td colspan="3" >
					<textarea style="width: 350px;" rows="3" cols="25" name="remark">${gisconf.remark }</textarea>
				</td>
			</tr>
		</table>
		</div>
		<div title="地图视野">
		<div style="width:40%; float: left;">
		<table class="tableForm" style="margin: 10px;">
			<tr>
				<th style="width: 430px;height:30px; text-align: left;" colspan="4">地图中心点</th>
			</tr>
			<tr>
				<th style="width: 130px;text-align: right;">经度<font style="color: red">*</font></th>
				<td><input type="text" id="centerx" name="centerx" class="easyui-validatebox" class="easyui-validatebox " required="true"  missingMessage="中心点经度不能为空" value="${gisconf.centerx }" readonly="readonly"/></td>
			</tr>
			<tr>
				<th style="width: 130px;text-align: right;">维度<font style="color: red">*</font></th>
				<td><input type="text" id="centery" name="centery" class="easyui-validatebox" class="easyui-validatebox " required="true"  missingMessage="中心点维度不能为空" value="${gisconf.centery }" readonly="readonly"/></td>
			</tr>
			
			<tr>
				<th style="width: 430px;height:30px; text-align: left;" colspan="4">视野范围<input type="checkbox" id="isbound" name="isbound" value="1" <c:if test="${gisconf.isbound=='1' }"> checked="checked" </c:if>  />开启</th>
			</tr>
			<tr class="boundbox" style="display: none;">
				<th style="width: 80px;text-align: right;">经&nbsp;&nbsp;度<font style="color: red">*</font></th>
				<td><input type="text" id="swlng" name="bsswlng" class="easyui-validatebox" required="true"  missingMessage="经度不能为空" value="${gisconf.bsswlng }" readonly="readonly"/></td>
			</tr>
			<tr class="boundbox" style="display: none;">
				<th style="width: 80px;text-align: right;">维&nbsp;&nbsp;度<font style="color: red">*</font></th>
				<td><input type="text" id="swlat" name="bsswlat" class="easyui-validatebox" required="true"  missingMessage="维度不能为空" value="${gisconf.bsswlat }" readonly="readonly"/></td>
			</tr>
			<tr class="boundbox" style="display: none;">
				<th style="width: 80px;text-align: right;">经&nbsp;&nbsp;度<font style="color: red">*</font></th>
				<td><input type="text" id="nelng" name="bsnelng" class="easyui-validatebox" required="true"  missingMessage="经度不能为空" value="${gisconf.bsnelng }" readonly="readonly"/></td>
			</tr>
			<tr class="boundbox" style="display: none;">
				<th style="width: 80px;text-align: right;">维&nbsp;&nbsp;度<font style="color: red">*</font></th>
				<td><input type="text" id="nelat" name="bsnelat" class="easyui-validatebox" required="true"  missingMessage="维度不能为空" value="${gisconf.bsnelat }" readonly="readonly"/></td>
			</tr>
		</table>
		</div>
		<div id="conf_map" style="width: 60%;height: 400px;float: right;"></div>
		
		</div>
		</div>
		<div style="margin:0 auto;margin-top: 20px;width: 200px;">
			<input type="button" value="保    存"  style="width: 200px;height: 35px;" onclick="submitForm();"/>
		</div>
	</form>
	</div>
</div>	
<script type="text/javascript">
var basepath = "${pageContext.request.contextPath}";
$(document).ready(function(){ 
	if ($("#isbound").attr("checked") == "checked"){
		$(".boundbox").show();
	}
	$("#isbound").click(function() { 
		if ($(this).attr("checked") == "checked") { 
			$("#isbound").val("1");
			$(".boundbox").show();
		} 
		else { 
			$("#isbound").val("0");
			$(".boundbox").hide();
		} 
	}); 
}); 

function submitForm(){
	var authkey_ = $("#authkey_").val();
	var url = basepath+"/mapconf/create";
	if (authkey_){
		url = basepath+"/mapconf/update";
	}
	$.ajax({
		type : "POST",
		url : url,
		data : $("#gisconf_form").serialize(),
		dataType : 'json',
		success : function(json) {
			$.messager.show({
				title : '提示',
				msg : json.msg,
				timeout : 3000,
				showType : 'slide'
			});
			window.location.href=basepath+'/mapconf/list'
		}
	});
	
}

</script>

<script type="text/javascript">
	var authkey = "glbe8fDURt2c8Nh8YUlflchE";
	// 百度地图API功能
	var map = new BMap.Map("conf_map");  
	map.addControl(new BMap.MapTypeControl());
	map.addControl(new BMap.NavigationControl());
	
	// 设置地图显示的城市 此项是必须设置的
	map.setCurrentCity("张掖");
	//开启鼠标滚轮缩放
	map.enableScrollWheelZoom(true);
	
	$.ajax({
		type : "POST",
		url : basepath + "/mapconf/get.json",
		data : "ak="+authkey,
		dataType : 'json',
		success : function(json) {
			// 初始化地图,设置中心点坐标和地图级别
			map.centerAndZoom(new BMap.Point(json.centerx, json.centery), 12);
		}
	});
	map.addEventListener("tilesloaded",function(){
		var center = map.getCenter();
		var bs = map.getBounds();   //获取可视区域
		var bssw = bs.getSouthWest();   //可视区域左下角
		var bsne = bs.getNorthEast();   //可视区域右上角
		$("#centerx").val(center.lng);
		$("#centery").val(center.lat);
		$("#swlng").val(bssw.lng);
		$("#swlat").val(bssw.lat);
		$("#nelng").val(bsne.lng);
		$("#nelat").val(bsne.lat);
	});
	
</script>
</body>

</html>
