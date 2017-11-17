<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>张掖三维数字社区</title>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/static/css/style.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/layer/src/layer.js?v=1.9.0"></script>
<!-- map -->
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=glbe8fDURt2c8Nh8YUlflchE"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<style type="text/css">
.title {
	cursor: pointer;
	width: 150px;
	font-style: normal;
}

.infolist li {
	font-style: normal;
}

.monitcorp {
	width: 150px;
	overflow: hidden;
	height: 100%;
}

.monitype {
	width: 100px;
}

.monitval {
	width: 50px;
	color: red;
}

.monitunit {
	width: 50px;
}

.menu-bar {
	position: absolute;
	right: 20px;
	top: 100px;
	width: 100px;
}

.menu-bar ul li {
	clear: both;
}

.infowintab {
	margin-top:5px;
	border-bottom: 1px solid #E5E5E5;
	height: 35px;
}

.infowintab li {
	float: left;
	list-style-type: none;
	line-height: 36px;
	/* border-top: 2px solid #FFFFFF; */
	padding: 0px 10px;
	cursor: pointer;
	position: relative;
	font-size: 14px;
	font-weight: bold;
	height: 33px;
}

.tab-curr {
	background:#FFFFFF;
	border-top: 2px solid #219898;
	border-left: 1px solid #E5E5E5;
	border-right: 1px solid #E5E5E5;
	bottom: -1px;
}

.corp_info{
	padding: 5px;
	height: 200px;
	width: 348px;
	overflow-x:hidden;
	border-left: 1px solid #E5E5E5;
	border-right: 1px solid #E5E5E5;
	border-bottom: 1px solid #E5E5E5;
}

.infotable td{
	font-size: 12px;
}
.infotable th{
	font-size: 12px;
	height: 30px;
	line-height: 30px;
}
</style>
</head>

<body>
<div id="index_map" class="allmap"  style="width: 100%;height: 100%;"></div>
<!-- 
<div id="map-tab" class="menu-bar" style="">
	<ul>
		<li><a href="javascript:void(0);" onclick="loadWarnlist();">预警指标</a></li>
		<li><a href="javascript:void(0);">工作通知</a></li>
	</ul>
</div> 
-->

<div id="info_window" style="display: none;">
		<div style="width: 100%">
			<ul class="infowintab">
				<li class="tab_item tab-curr" onclick="tabclick('jbxx',this);">基本信息</li>
				<li class="tab_item" onclick="tabclick('jcsj',this);">监测数据</li>
				<li class="tab_item" onclick="tabclick('sptx',this);">视频图像</li>
			</ul>
		</div>
		<div id="corp_jbxx" class="corp_info">
			
		</div>
		<div id="corp_jcsj" class="corp_info" style="display: none;">
			<table cellspacing="0" cellpadding="0">
				<thead>
					<tr><td style="width: 40%;">监测指标</td><td style="width: 20%;">监测值</td><td style="width: 20%;">单位</td><td>监测日期</td></tr>
				</thead>
				<tbody id="data_list">
					
				</tbody>
			</table>
		</div>
		<div id="corp_sptx" class="corp_info" style="display: none;"></div>
</div>


<script type="text/javascript">
function tabclick(idstr,obj){
	$(".tab_item").removeClass("tab-curr");
	$(obj).addClass("tab-curr");
	$(".corp_info").hide();
	$("#corp_"+idstr).show();
}
</script>
<script type="text/javascript">
	var basepath = "${pageContext.request.contextPath}";
	var authkey = "glbe8fDURt2c8Nh8YUlflchE";
	var gisconf;
	// 创建Map实例
	var map = new BMap.Map("index_map",{enableMapClick:false});
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
	
	function mapconf(gisconf){
		// 初始化地图,设置中心点坐标和地图级别
		map.centerAndZoom(new BMap.Point(gisconf.centerx, gisconf.centery), 14);
		//控制视野范围
		if (gisconf.isbound=='1'){
			var b = new BMap.Bounds(new BMap.Point(gisconf.bsswlng, gisconf.bsswlat),
					new BMap.Point(gisconf.bsnelng, gisconf.bsnelat));
			try {
				//BMapLib.AreaRestriction.setBounds(map, b);
			} catch (e) {
				alert(e);
			}
		}
	}
		// 图层加载完成事件
		map.addEventListener("tilesloaded", function() {
		});

		// 要素数组
		var arrayMarkers = new Array();
		var polylineArray = new Array();
		
		var currPoint = new Object();
		//绘制标注
		function drawMarker(corpPoint) {
			var type = corpPoint.classid;
			var point = new BMap.Point(corpPoint.lng,corpPoint.lat);
			//自定义标注图标
			var icon = new BMap.Icon('pin.png', new BMap.Size(20, 32), {
				anchor : new BMap.Size(10, 30)
			});
			
			
			var marker = new BMap.Marker(point, icon);
			marker.addEventListener("mouseover", function(e) {
				corpMonitData(corpPoint.id);
				openInfoWin(corpPoint, e);
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			});
			
			marker.addEventListener("mouseout", function(e) {
				marker.setAnimation(null); 
			});
			
			var plotobj = {
				id:corpPoint.id,
				marker:marker
			};
			arrayMarkers.push(plotobj);
			map.addOverlay(marker);
		}
		//绘制管道
		function drawPipeLine(pipeline,pointsArray) {
			var polyline = new BMap.Polyline(pointsArray, {
				strokeColor : pipeline.linecolor,
				strokeWeight : pipeline.weight,
				strokeOpacity : pipeline.opacity
			}); 
			
			/* var ployobj = {
				id:pipeline.id,
				polyline:polyline
			};
			
			polylineArray.push(ployobj); */
			
			//绑定事件
			polyline.addEventListener("mouseover", function(e){
				var point = new BMap.Point(e.point.lng, e.point.lat);
				var opt = {
					title : "<font style='font-size:18px;font-weight: bold;'>"+pipeline.title+"</font>", //标题
					width : 300, //宽度
					height : 150, //高度
					panel : "panel", //检索结果面板
					enableAutoPan : true, //自动平移
					searchTypes : []
				};
				
				var info_html="<table class='infotable' cellspacing='0' cellpadding='0' width='100%' heigth='100%'>"
					+"<tr><th width='20%'>管道编号:</th><td>"+pipeline.code+"</td></tr>"
					+"<tr><th width='20%'>管道类型:</th><td>"+pipeline.classfy+"</td></tr>"
					+"<tr><th width='20%'>管道长度:</th><td>"+pipeline.length+" 米</td></tr>"
					+"<tr><th width='20%'>使用企业:</th><td>"+pipeline.corpname+"</td></tr>"
				+"</table>";
				
				var infoWindow = new BMap.InfoWindow(info_html, opt); // 创建信息窗口对象 
				map.openInfoWindow(infoWindow, point); //开启信息窗口
			});
			map.addOverlay(polyline); //增加折线
		}
		
		//绘制土地要素
		function drawLandArea(landarea,pointsArray) {
			var polygon = new BMap.Polygon(pointsArray, {
				fillColor:landarea.fillcolor,
				strokeColor : landarea.linecolor,
				strokeWeight : landarea.weight,
				strokeOpacity : landarea.opacity
			}); 
			
			//选中
			polygon.addEventListener("mouseover", function(e){
				var point = new BMap.Point(e.point.lng, e.point.lat);

				var opt = {
					title : "<font style='font-size:18px;font-weight: bold;'>"+landarea.title+"</font>", //标题
					width : 300, //宽度
					height : 180, //高度
					panel : "panel", //检索结果面板
					enableAutoPan : true, //自动平移
					searchTypes : []
				};
				
				var info_html="<table class='infotable' cellspacing='0' cellpadding='0' width='100%' heigth='100%'>"
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
			
			map.addOverlay(polygon); 
		}
		
		//信息窗口
		function openInfoWin(markerPoint, e) {
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng+0.001, p.getPosition().lat+0.001);

			var opt = {
				title : "<font style='font-size=16px;font-weight: bold;'>"+markerPoint.title+"</font>", //标题
				width : 360, //宽度
				height : 280, //高度
				panel : "panel", //检索结果面板
				enableAutoPan : true, //自动平移
				searchTypes : []
			};

			var jbxx_html="<table cellspacing='0' cellpadding='0' width='100%' heigth='100%'>"
				+"<tr><td colspan='2'><img src='"+markerPoint.logo+"' width='330' height='100'/> </td></tr>"
				+"<tr><th>企业名称:</th><td>"+markerPoint.title+"</td></tr>"
				+"<tr><th>负  责  人:</th><td>"+markerPoint.leader+"</td></tr>"
				+"<tr><th>联系电话:</th><td>"+markerPoint.tel+"</td></tr>"
				+"<tr><th>成立日期:</th><td>"+markerPoint.newtimestr+"</td></tr>"
				+"<tr><th>入驻时间:</th><td>"+markerPoint.intimestr+"</td></tr>"
			+"</table>";
			$("#corp_jbxx").html(jbxx_html);
			var info_html = $("#info_window").html();
			var infoWindow = new BMap.InfoWindow(info_html, opt); // 创建信息窗口对象 
			map.openInfoWindow(infoWindow, point); //开启信息窗口
		}
		
		//加载预警数据
		function loadCorpData(){
			map.clearOverlays();
			$.ajax({
		        type: "POST",
		        dataType : 'json',
		        url : basepath + "/company/datagrid",
		        data : "page=1&rows=500",
		        success: function (json) {
		        	var data = json.rows;
					if (data){
						for (var i = 0; i < data.length; i++) {
							drawMarker(data[i]);
						}
					}
		        }
		     });
		}
		//加载管道数据
		function loadPipeData(){
			$.ajax({
				type : "POST",
				url : basepath+"/pipe/datagrid",
				data : "page=1&rows=50",
				dataType : 'json',
				success : function(json) {
					if (json.rows){
						var pipeLines = json.rows;
						for(var i = 0; i < pipeLines.length; i++) {
							var pipePoints = pipeLines[i].points;
							var pointsArray = new Array();
							if (pipePoints){
								for(var p=0;p<pipePoints.length;p++){
									pointsArray.push(new BMap.Point(pipePoints[p].lng, pipePoints[p].lat));
								}
							}
							drawPipeLine(pipeLines[i],pointsArray);
						}
					}
				}
			});
		}
		
		//查询土地区域
		function loadLandData() {
			$.ajax({
				type : "POST",
				url : basepath+"/land/datagrid",
				data : "page=1&rows=50&param=",
				dataType : 'json',
				success : function(json) {
					if (json.rows){
						var landareas = json.rows;
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
		
		function corpMonitData(corpid){
			$.ajax({
				type : "POST",
				url : basepath + "/company/corpMonitVals",
				data : "corpid="+corpid,
				dataType : 'json',
				success : function(json) {
					var html_="";
					var data = json.data;
					console.info("montdata",data);
					//loadCorpData(row.id,row.title,data);
					for(var i=0;i<data.length;i++){
						var typename = data[i].typename;
						var monitval = data[i].monitval;
						var typeunit = data[i].unit;
						var addtime = data[i].addtimestr;
						if (!data[i].typename){
							addtime = "";
						}
						if (!data[i].monitval){
							monitval = "";
						}
						if (!data[i].unit){
							typeunit = "";
						}
						if (!data[i].addtimestr){
							addtime = "";
						}
						html_+="<tr><td>"+typename+"</td><td>"+monitval+"</td><td>"+typeunit+"</td><td>"+addtime+"</td></tr>";
					}
					$("#data_list").html(html_);
				}
			});
		}
		
	loadCorpData();
	loadPipeData();
	loadLandData();		
</script>	
</body>
</html>
