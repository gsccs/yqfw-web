<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/style.css" />
<script language="JavaScript"
	src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/layer/src/layer.js?v=1.9.0"></script>
<script type="text/javascript">
	var basePath = "${pageContext.request.contextPath}";
	$(function() {
		$('.title').live("click",function() {
			$(".menuson").slideUp();
			var $ul = $(this).next('ul');
			//$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
		
		//导航切换
		$(".menuson li").live("click",function() {
			$(".menuson li.active").removeClass("active");
			$(this).addClass("active");
		});
	});
	
	
	function loadMenu(id) {
		//var loading = layer.load(0, {shade: false});
		$.ajax({
			type : "post",
			url : basePath + "/menu?pid="+id,
			success : function(data, textStatus) {
			//layer.close(loading);
			var menuHtml = "";
			for (var i = 0; i < data.length; i++){
				var nodes= data[i].subs;
				for (var j = 0; j < nodes.length; j++) {
					menuHtml = menuHtml
					+ "<dd><div class=\"title\"><span><img src=\"${pageContext.request.contextPath}/static/images/leftico01.png\" /></span>"
					+ nodes[j].name
					+ "</div>"
					+"<ul class=\"menuson\" id='"+nodes[j].id+"'>";
					if (nodes[j].subs){
						
						for (var s = 0; s < nodes[j].subs.length; s++) {
							if (s == 0) {
								menuHtml = menuHtml + "<li class=\"active\">";
							} else {
								menuHtml = menuHtml + "<li>";
							}
							menuHtml = menuHtml + "<cite></cite><a href=\"${pageContext.request.contextPath}"+nodes[j].subs[s].url+"\" target=\"rightFrame\">"
											+ nodes[j].subs[s].name + "</a><i></i></li>";
						}
					}
					menuHtml = menuHtml+"</ul></dd>";
				}
			}
			$("#menuTree").html(menuHtml);
			},
			complete : function(XMLHttpRequest, textStatus) {
						//HideLoading();
			},
			error : function() {
						//请求出错处理
			}
		});
	}
	loadMenu(1);
</script>

</head>

<body style="background: #f0f9fd;">

	<div class="lefttop" id="rootMenu">
		<span></span>菜单
	</div>
	
	<dl class="leftmenu" id="menuTree">
		<dd>
			<div class="title">
				<span><img src="static/images/leftico03.png" /></span>园区企业
			</div>
			<ul class="menuson">
				<li class="active"><cite></cite><a href="${pageContext.request.contextPath}/notice/list"
					target="rightFrame"></a><i></i></li>
			</ul>
		</dd>
		
		<dd>
			<div class="title">
				<span><img src="static/images/leftico03.png" /></span>
			</div>
			<ul class="menuson">
				<li class="active"><cite></cite><a href="${pageContext.request.contextPath}/notice/list"
					target="rightFrame"></a><i></i></li>
			</ul>
		</dd>
	</dl>
	

</body>
</html>
