<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区土地资源</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/layer/src/layer.js?v=1.9.0"></script>
<!-- map -->
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=glbe8fDURt2c8Nh8YUlflchE"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<style type="text/css">
.allmap {
	width: 850px;
	height: 540px;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}


.cond_item {
  height: 45px;
}

.cond_item label {
	width: 20%;
}

.cond_item input {
	width: 120px;
}

.searchForm{
	padding: 20px 5px;
}

.fm_item{
	border: 1px solid #E5E5E5 ;
	min-height: 30px;
	min-width: 120px;
}

.landinfo td{
	font-size: 12px;
}
.landinfo th{
	font-size: 12px;
	height: 30px;
	line-height: 30px;
}
</style>
</head>

<body style="margin: 0px;">
<div id="land_box"  class="easyui-layout" style="width:100%;height:100%;">
	<div region="west" collapsed="true"  title="搜索选项"  iconCls="icon-reload" split="true" style="width:250px;">
		<form id="searchForm" class="searchForm">
			<div class="cond_item">
				<label>土地名称</label>
				<input type="text" class="fm_item"  id="title" name="title" >
			</div>
			<div class="cond_item">
				<label>土地类型</label>
				<select class="fm_item"  id="classid" name="classid">
		             <option value="">----- 请选择-----</option>
		              <c:forEach items="${makFacts }" var="makfact">
		              <option value="${makfact.id }">${makfact.title }</option>
		              </c:forEach>
		        </select>
			</div>
					
			<div class="cond_item">
				<label>土地状态</label>
				<select class="fm_item"  name="state">
					<option value="">----请选择----</option>
					<option value="1">使用</option>
					<option value="0">闲置</option>
				</select>
			</div>
			
			<div class="cond_item">
				<!-- <label>显示信息窗口</label>  -->
				<input type="checkbox" id="showInfoWin" checked="checked" /> 显示信息窗口
			</div>
					
			<div class="cond_item" style="text-align: center; margin: 0 auto;">
				<input type="button" value="查  询" onclick="searchFunc();">
			</div>
		</form>
	</div>
    <div data-options="region:'south',split:true,collapsed:true" style="height:150px;">
    	<table id="land_list" cellspacing="0" cellpadding="0"></table>
    </div>
    
    <div id="land_map" data-options="region:'center',title:'',iconCls:'icon-map',split:true" style="width: 100%;">
    </div>
</div>
<div id="land_window"></div>

<script type="text/javascript">
	var updateauth = false;
	var saveloc = false;
	<shiro:hasPermission name="land:update">
	updateauth = true;
	</shiro:hasPermission>
</script>

<script type="text/javascript">
var basepath="${pageContext.request.contextPath}";
var loading;
var currLandId;
$(function() {
	$("#land_list").datagrid({
		height : 'auto',
		nowrap : false,
		striped : true,
		border : true,
		collapsible : false,//是否可折叠的 
		fit : true,//自动大小 
		loadMsg : '数据加载中请稍后……',
		remoteSort : false,
		fitColums : true,
		singleSelect : true,	//是否单选 
		pagination : true,		//分页控件 
		rownumbers : true,		//行号
		idField: 'id',
		columns : [ [ {
			field : 'id',
			title : '编号',
			width : 150,
			checkbox : true
		}, {
			field : 'title',
			title : '标题',
			width : 150
		},{
			field : 'code',
			title : '编号',
			width : 150
		},{
			field : 'measure',
			title : '面积',
			width : 100
		}, {
			field : 'corpname',
			title : '所属企业',
			width : 150
		}, {
			field : 'classfy',
			title : '土地类型',
			width : 100,
			formatter:function(value,row){
		   		return str = "<font style=''>"+value+"</font>"
		   		+"<span style='display:block;width:30px;   height: 20px; float: right;background:"+row.fillcolor+";'></span>";;
			}
		},{
			field : 'state',
			title : '状态',
			width : 100,
			formatter:function(value,row){
		    	var str = "";
		    	if(value=="0"){
		    		str = "<font style=''>闲置</font>";
		    	}else{
		    		str = "<font style=''>使用</font>";
		    	}
		    	 return str;
			}
		}, {
			field : 'remark',
			title : '备注说明',
			width : 150
		}  ] ],
		onClickRow:function (index,row){
			locLandArea(row);
		},
		onLoadSuccess: function () {
			var p = $('#land_list').datagrid('getPager');
			$(p).pagination({
				pageSize : 10,//每页显示的记录条数，默认为10 
				pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表 
				beforePageText : '第',//页数文本框前显示的汉字 
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});
		}
	
	});
	var p = $('#land_list').datagrid('getPager');
	$(p).pagination({
		pageSize : 10,//每页显示的记录条数，默认为10 
		pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表 
		beforePageText : '第',//页数文本框前显示的汉字 
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
	});
});
</script>

<script type="text/javascript">
	var authkey = "glbe8fDURt2c8Nh8YUlflchE";
	// 创建Map实例
	var map = new BMap.Map("land_map",{enableMapClick:false});
	var gisconf;
	var gc = new BMap.Geocoder();
	//添加地图类型控件
	map.addControl(new BMap.MapTypeControl());
	map.addControl(new BMap.NavigationControl());
	
	// 设置地图显示的城市 此项是必须设置的
	map.setCurrentCity("张掖");
	
	//开启鼠标滚轮缩放
	map.enableScrollWheelZoom(true);
	
	if (gisconf){
		mapconf(gisconf);
	}else{
		$.ajax({
			type : "POST",
			url : basepath + "/mapconf/get.json",
			data : "ak="+authkey,
			dataType : 'json',
			success : function(json) {
				gisconf = json;
				mapconf(gisconf);
			}
		});
	}
	// 图层加载完成事件
	map.addEventListener("tilesloaded", function() {
		//init_markers();
	});

	//标注地图要素
	//单击事件:添加标注
	//map.addEventListener("click", map_click);
	// 要素数组
	var polygonArray = new Array();

	function mapconf(gisconf){
		map.centerAndZoom(new BMap.Point(gisconf.centerx, gisconf.centery), 14);
		//控制视野范围
		if (gisconf.isbound=='1'){
			var b = new BMap.Bounds(new BMap.Point(gisconf.bsswlng, gisconf.bsswlat),
					new BMap.Point(gisconf.bsnelng, gisconf.bsnelat));
			try {
				BMapLib.AreaRestriction.setBounds(map, b);
			} catch (e) {
				alert(e);
			}
		}
	}

//定位要素：土地
function locLandArea(row){
	if (polygonArray){
		for (var i=0;i<polygonArray.length;i++){
			if (polygonArray[i].id==row.id){
				currLandId = row.id;
				var loclng = polygonArray[i].polygon.getPath()[0].lng;
				var loclat = polygonArray[i].polygon.getPath()[0].lat;
				map.centerAndZoom(new BMap.Point(loclng,loclat), 16);
				if (updateauth){
					//polygonArray[i].polygon.setFillColor("#5aaeef");//配置填充颜色
					polygonArray[i].polygon.enableEditing();
					//loadLandPoint(row.id,row.title,polygonArray[i].polygon.getPath());
				}
			}else{
				//polygonArray[i].polygon.setFillColor("#FFFFFF");//配置填充颜
				polygonArray[i].polygon.disableEditing();
			}
		}
	}
}

//
function loadLandPoint(id,title,points){
	$("#point_list").datagrid({
		title : "["+title+"]地理数据",
		nowrap : false,
		striped : true,
		border : true,
		loadMsg : '数据加载中请稍后……',
		fitColums : true,
		rownumbers : true,//行号
		singleSelect : true,//是否单选 
		idField: 'id',
		columns : [ [ {
			field : 'lng',
			title : '经度',
			width : 100
		}, {
			field : 'lat',
			title : '维度',
			width : 100
		} ] ],
		data:points,
		onClickRow:function (index,row){
			map.centerAndZoom(new BMap.Point(row.lng,row.lat), 16);
		}
	});
}

//查询土地区域
function searchFunc() {
	loading = layer.load(1, {
	    shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	saveloc = false;
	map.clearOverlays();
	$.ajax({
		type : "POST",
		url : basepath+"/land/datagrid",
		data : "page=1&rows=500&param="+$("#searchForm").serialize(),
		dataType : 'json',
		success : function(json) {
			layer.close(loading);
			if (json.rows){
				var landareas = json.rows;
				$("#land_list").datagrid({data:landareas});
				for(var i = 0; i < landareas.length; i++) {
					var landPoints = landareas[i].points;
					if (landPoints){
						var pointsArray = new Array();
						for(var p=0;p<landPoints.length;p++){
							pointsArray.push(new BMap.Point(landPoints[p].lng, landPoints[p].lat));
						}
						drawLandArea(landareas[i],pointsArray);
					}
				}
			}
		}
	});
}


function drawLandArea(landarea,pointsArray) {
	//创建多边形
	var polygon = new BMap.Polygon(pointsArray, {
		fillColor:landarea.fillcolor,
		strokeColor : landarea.linecolor,
		strokeWeight : landarea.weight,
		strokeOpacity : landarea.opacity
	}); 
	
	polygon.setFillColor(landarea.fillcolor);//配置填充颜色
	
	var ployobj = {
		id:landarea.id,
		polygon:polygon
	};
	
	polygonArray.push(ployobj);
	
	//选中
	polygon.addEventListener("mouseover", function(e){
		if (updateauth){
			polygon.enableEditing();
		}
		
		if (!$("#showInfoWin").is(':checked')){
			return;
		}
		
		var point = new BMap.Point(e.point.lng, e.point.lat);

		var opt = {
			title : "<font style='font-size:18px;font-weight: bold;'>"+landarea.title+"</font>", //标题
			width : 300, //宽度
			height : 180, //高度
			panel : "panel", //检索结果面板
			enableAutoPan : true, //自动平移
			searchTypes : []
		};
		
		var info_html="<table class='landinfo' cellspacing='0' cellpadding='0' width='100%' heigth='100%'>"
			+"<tr><th width='20%'>土地编号:</th><td>"+landarea.code+"</td></tr>"
			+"<tr><th width='20%'>土地类型:</th><td>"+landarea.classfy+"</td></tr>"
			+"<tr><th width='20%'>土地面积:</th><td>"+landarea.measure+" 平方米</td></tr>";
		if (landarea.corpname){
			info_html +="<tr><th width='20%'>使用企业:</th><td>"+landarea.corpname+"</td></tr>";
		}else{
			info_html +="<tr><th width='20%'>使用企业:</th><td>无</td></tr>";
		}
		info_html += "</table>";
		
		var infoWindow = new BMap.InfoWindow(info_html, opt); // 创建信息窗口对象 
		map.openInfoWindow(infoWindow, point); //开启信息窗口
	});
	
	//退出
	polygon.addEventListener("mouseout", function(){
		//polygon.setFillColor("#FFFFFF");//配置填充颜
		polygon.disableEditing();
		if (polygon.getPath()){
			$("#point_list").datagrid({
				data:polygon.getPath()
			}); 
			saveloc = true;
		}
	});
	
	//保存最新地址信息
	polygon.addEventListener("lineupdate", function(){
		polygon.disableEditing();
		if (polygon.getPath() && saveloc && updateauth){
			saveLandPoints(landarea.id);
		}
	});
	map.addOverlay(polygon); 
}


//保存更新后土地位置信息
function saveLandPoints(landid){
	if(!updateauth){
		layer.msg("您没有操作权限，请联系系统管理员！",{icon: 2});	
		return;
	}
	
	loading = layer.load(1, {
	    shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	
	if (polygonArray){
		for (var i=0;i<polygonArray.length;i++){
			if (landid==polygonArray[i].id){
				var polygonpath = polygonArray[i].polygon.getPath();
				if (polygonpath){
					var landpoints = new Array();
					for(var l=0;l<polygonpath.length;l++){
						var loclng = polygonpath[l].lng;
						var loclat = polygonpath[l].lat;
						var landpoint = {
							lng:loclng,
							lat:loclat,
							landid:landid
						};
						landpoints.push(landpoint);
					}
					
					var pointsStr = JSON.stringify(landpoints);
					$.ajax({
						type : "POST",
						url : basepath+"/land/savePoints",
						data : pointsStr,
						dataType : 'json',
						contentType: "application/json", 
						success : function(json) {
							layer.close(loading);
							if (json.success){
								layer.msg(json.msg,{icon: 1});
							}else{
								layer.msg(json.msg,{icon: 2});
							}
						}
					});
					break;
				}
			}
		}
	}
}

searchFunc();
</script>
</body>
</html>
