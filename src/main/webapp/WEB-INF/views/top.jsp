<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数字社区管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript">
var basePath = "${pageContext.request.contextPath}";
function showSubMenu(nodeid){
	var node = top.leftFrame.document.getElementById(nodeid);
	var $nodeObj = $(node);
	$nodeObj.show();
}

$(function(){
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
		top.leftFrame.document.getElementById("rootMenu").innerHTML="<span></span>"+$(this).attr("title");
		if($(this).attr("name")=="workplat"){
			top.rightFrame.src="forward?path=index";
			return;
		}else{
			$(".menuson").slideUp();
			var currmenuid = $(this).attr("id");
			if (currmenuid=="9"){
				showSubMenu("901");
			}
			if (currmenuid=="10"){
				showSubMenu("21");
			}
		}
	});
});
</script>

</head>
<body style="background:url(${pageContext.request.contextPath}/static/images/topbg.gif) repeat-x;">

    <div class="topleft">
    	<a href="${pageContext.request.contextPath}" target="_parent"><img src="${pageContext.request.contextPath}/static/images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    	<li><a name="workplat" href="forward?path=index" href="javascript:void(0);" target="rightFrame" class="selected" title="工作台" ><img src="${pageContext.request.contextPath}/static/images/icon01.png" /><h2>工作台</h2></a></li>
    	<c:forEach items="${menus }" var="menu" varStatus="status">
    		<c:choose>  
			   <c:when test="${menu.id==5 }">
			   	<li><a href="company/map" id="${menu.id }" target="rightFrame" title="${menu.name }" ><img src="${pageContext.request.contextPath}/static/images/${menu.icon}.png" /><h2>${menu.name }</h2></a></li>
			   </c:when>
			   <c:when test="${menu.id==6 }">
			   	<li><a href="land/map" id="${menu.id }" target="rightFrame" title="${menu.name }" ><img src="${pageContext.request.contextPath}/static/images/${menu.icon}.png" /><h2>${menu.name }</h2></a></li>
			   </c:when>  
			   <c:when test="${menu.id==8 }">
			   	<li><a href="pipe/map" id="${menu.id }" target="rightFrame" title="${menu.name }" ><img src="${pageContext.request.contextPath}/static/images/${menu.icon}.png" /><h2>${menu.name }</h2></a></li>
			   </c:when>  
			     
			   <c:otherwise> 
			   	<li><a href="javascript:void(0);" id="${menu.id }" target="rightFrame" title="${menu.name }" ><img src="${pageContext.request.contextPath}/static/images/${menu.icon}.png" /><h2>${menu.name }</h2></a></li>
			   </c:otherwise>  
			</c:choose>  
    	</c:forEach>
    </ul>
            
    <div class="topright">    
    <ul>
    <%-- 
    	<li><span><img src="${pageContext.request.contextPath}/static/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    	<li><a href="#">关于</a></li> 
    --%>
    <li><a href="${pageContext.request.contextPath}/login" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span><shiro:principal/></span>
   <!--  <i>消息</i>
    <b>0</b> -->
    </div>    
    
    </div>

</body>
</html>
