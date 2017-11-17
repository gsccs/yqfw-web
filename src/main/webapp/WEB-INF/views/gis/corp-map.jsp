<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>园区企业分布图</title>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/static/css/style.css" />
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

.searchForm{
	padding: 20px 5px;
}

.fm_item{
	border: 1px solid #E5E5E5 ;
	min-height: 30px;
	min-width: 120px;
}
</style>
<script type="text/javascript">
	var basepath = "${pageContext.request.contextPath}";
	var authkey = "glbe8fDURt2c8Nh8YUlflchE";
	var updateauth = false;
	<shiro:hasPermission name="corp:update">
	updateauth = true;
	</shiro:hasPermission>
</script>
</head>

<body style="margin: 0px;">
	<div id="land_box" class="easyui-layout" style="width: 100%; height: 100%;">
		<div region="west" collapsed="true"  iconCls="icon-reload" title="搜索选项" split="true" style="width: 250px;">
			<form id="searchForm" class="searchForm">
					<div class="cond_item">
						<label>企业名称</label> 
						<input type="text" class="fm_item" id="title" name="title" />
					</div>
	
					<div class="cond_item">
						<label>所属行业</label> 
						<select class="fm_item" id="classid" name="classid">
							<option value="">----请选择----</option>
							<c:forEach items="${makFacts }" var="makfact">
								<option value="${makfact.id }">${makfact.title }</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="cond_item">
						<!-- <label>显示信息窗口</label>  -->
						<input type="checkbox" id="showInfoWin" checked="checked" /> 显示信息窗口
					</div>
	
					<div class="cond_item" style="text-align: center; margin: 0 auto;">
						<input class="fm_item" type="button" name="state" value="查  询"
							onclick="searchFunc();"> 
					</div>
				</form>
		</div>
		<div data-options="region:'south',title:'搜索结果',split:true,collapsed:true"
			style="height: 150px;">
			<table id="corp_data" cellspacing="0" cellpadding="0"></table>
		</div>

		<div id="corp_map"
			data-options="region:'center',title:'',iconCls:'icon-map',split:true"
			style="width: 100%;"></div>
	</div>
	
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
		var loading;
		$(function() {
			$("#corp_data").datagrid({
				height : 'auto',
				nowrap : false,
				striped : true,
				border : true,
				collapsible : false,//是否可折叠的 
				fit : true,//自动大小 
				loadMsg : '数据加载中请稍后……',
				remoteSort : false,
				fitColums : true,
				singleSelect : true,//是否单选 
				pagination : true,//分页控件 
				rownumbers : true,//行号
				idField : 'id',
				columns : [ [ {
					field : 'id',
					title : '编号',
					width : 150,
					checkbox : true
				}, {
					field : 'title',
					title : '企业名称',
					width : 150
				}, {
					field : 'leader',
					title : '负责人',
					width : 80
				}, {
					field : 'tel',
					title : '联系电话',
					width : 80
				}, {
					field : 'address',
					title : '位置',
					width : 150
				}, {
					field : 'classfy',
					title : '行业',
					width : 100
				}, {
					field : 'scalestr',
					title : '规模',
					width : 100
				}, {
					field : 'newtimestr',
					title : '成了日期',
					width : 100
				}, {
					field : 'intimestr',
					title : '入驻日期',
					width : 100
				}, {
					field : 'state',
					title : '状态',
					width : 50,
					formatter : function(value, row) {
						var str = "";
						if (value == "0") {
							str = "<font style=''>关闭</font>";
						} else {
							str = "<font style=''>正常</font>";
						}
						return str;
					}
				}, {
					field : 'lng',
					title : '经度',
					width : 100
				}, {
					field : 'lat',
					title : '维度',
					width : 100
				}, {
					field : 'remark',
					title : '描述',
					width : 150
				} ] ],
				onClickRow:function (index,row){
					if (arrayMarkers){
						for (var i=0;i<arrayMarkers.length;i++){
							if (row.id==arrayMarkers[i].id){
								var position = arrayMarkers[i].marker.getPosition();
								var lng = position.lng;
								var lat = position.lat;
								map.centerAndZoom(new BMap.Point(lng,lat), 16);
								arrayMarkers[i].marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
							}else{
								arrayMarkers[i].marker.setAnimation(null); 
							}
						}
					}
					locCorpPoint(row);
				},
				onLoadSuccess: function () {
					var p = $('#corp_data').datagrid('getPager');
					$(p).pagination({
						pageSize : 5,//每页显示的记录条数，默认为10 
						pageList : [ 5, 10, 15 ],//可以设置每页记录条数的列表 
						beforePageText : '第',//页数文本框前显示的汉字 
						afterPageText : '页    共 {pages} 页',
						displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
					});
				}
			});
			$('#corp_data').layout('collapse','south');
			$('#corp_data').layout('collapse','west');
		});
		
		
	</script>

	<script type="text/javascript">
		var gisconf;
		// 创建Map实例
		var map = new BMap.Map("corp_map",{enableMapClick:false});
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
			//searchFunc();
		});

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
		//标注地图要素
		//单击事件:添加标注
		//map.addEventListener("click", map_click);
		// 要素数组
		var arrayMarkers = new Array();
		var currPoint = new Object();
		//绘制标注
		//(data[i].longitude, data[i].latitide, data[i].type, data[i].content);
		function drawMarker(corpPoint) {
			var point = new BMap.Point(corpPoint.lng,corpPoint.lat);
			//自定义标注图标
			var icon = new BMap.Icon('pin.png', new BMap.Size(20, 32), {
				anchor : new BMap.Size(10, 30)
			});
			/* //根据不同企业，采用不同的标注
			if (type == "1") {
				icon = new BMap.Icon('1.png', new BMap.Size(20, 32), {
					anchor : new BMap.Size(10, 30)
				});
			} else if (type == "2") {
				icon = new BMap.Icon('2.png', new BMap.Size(20, 32), {
					anchor : new BMap.Size(10, 30)
				});
			} else if (type == "3") {
				icon = new BMap.Icon('3.png', new BMap.Size(20, 32), {
					anchor : new BMap.Size(10, 30)
				});
			} */
			var marker = new BMap.Marker(point, icon);
			marker.addEventListener("mouseover", function(e) {
				if (updateauth){
					marker.enableDragging();
				}
				
				//locCorpPoint(corpPoint);
				corpMonitData(corpPoint.id);
				if ($("#showInfoWin").is(':checked')){
					openInfoWin(corpPoint, e);
				}
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			});
			
			marker.addEventListener("mouseout", function(e) {
				marker.enableDragging();
				marker.setAnimation(null); 
			});
			
			marker.addEventListener("dragend", function(e) {
				//获取地址信息  
				if ($("#showInfoWin").is(':checked')){
					openInfoWin(corpPoint, e);
				}
				//保存位置信息
				saveCorpPoints(corpPoint.id);
			});
			
			var plotobj = {
				id:corpPoint.id,
				marker:marker
			};
			
			arrayMarkers.push(plotobj);
			map.addOverlay(marker);
		}
		
		//信息窗口
		function openInfoWin(markerPoint, e) {
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng+0.001, p.getPosition().lat+0.001);

			var opt = {
				title : "<font style='font-size:18px;font-weight: bold;'>"+markerPoint.title+"</font>", //标题
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

		
		function locCorpPoint(row){
			$.ajax({
				type : "POST",
				url : basepath + "/company/corpMonitVals",
				data : "corpid="+row.id,
				dataType : 'json',
				success : function(json) {
					layer.close(loading);
					var data = json.data;
					loadCorpData(row.id,row.title,data);
				}
			});
		}
		
		//监测数据
		function corpMonitData(corpid){
			$.ajax({
				type : "POST",
				url : basepath + "/company/corpMonitVals",
				data : "corpid="+corpid,
				dataType : 'json',
				success : function(json) {
					var html_="";
					var data = json.data;
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
		
	function saveCorpPoints(corpid){
		if(!updateauth){
			layer.msg("您没有操作权限，请联系系统管理员！",{icon: 2});	
			return;
		}
		loading = layer.load(1, {
		    shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		if (arrayMarkers){
			for (var i=0;i<arrayMarkers.length;i++){
				if (corpid==arrayMarkers[i].id){
					var position = arrayMarkers[i].marker.getPosition();
					var lng = position.lng;
					var lat = position.lat;
					$.ajax({
						type : "POST",
						url : basepath+"/company/savePoints",
						data : "lng="+lng+"&lat="+lat+"&corpid="+corpid,
						dataType : 'json',
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
	
	function searchFunc() {
		loading = layer.load(1, {
		    shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		map.clearOverlays();
		$.ajax({
			type : "POST",
			url : basepath + "/company/datagrid",
			data : "page=1&rows=500&company="+$("#searchForm").serialize(),
			dataType : 'json',
			success : function(json) {
				layer.close(loading);
				var data = json.rows;
				if (data){
					$("#corp_data").datagrid({data:data});
					for (var i = 0; i < data.length; i++) {
						drawMarker(data[i]);
					}
				}
			}
		});
	}
	searchFunc();
	</script>
</body>
</html>
