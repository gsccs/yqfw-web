<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>全球眼平台</TITLE>
<META http-equiv=Content-Type content=text/html;charset=utf-8>
<STYLE>
TD {
	PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-SIZE: 9pt; PADDING-BOTTOM: 5px; PADDING-TOP: 5px
}

INPUT {
	WIDTH: 110px
}
</STYLE>

<META content="MSHTML 6.00.2900.3157" name=GENERATOR></HEAD>
<BODY>
<TABLE height=500 cellSpacing=0 cellPadding=0 width=800 align=center border=1>
  <TBODY>
   <TR>
    <TD colSpan=2>
      <H1 align=center>Viss OCX测试页面 </H1>
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>环境配置 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>EMS IP: <INPUT value="10.129.0.46" name=emsIP> 
          		  端口: <INPUT value="8081" name=emsPort> 
              URL: <INPUT value=viss name=emsURI> <BR>
                                    用户: <INPUT value="ZYJingJiKaiFaQu" name=username> 
                                    密码: <INPUT value="jingjikaifaqu" name=passwd> </TD></TR>
         </TBODY>
      </TABLE></TD></TR>
      
     <TR>
     <TD vAlign=center width=370>
     	<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
     	<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
     	<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
     	<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
      <OBJECT class=style1 id=Viss style="WIDTH: 352px; HEIGHT: 288px" 
       codeBase=Viss.cab#version=1,0,0,0 align=middle 
       classid=clsid:84D09179-852A-4881-8AF5-17595C288458 name=Viss viewastext>
      </OBJECT>
      
      <BR><BR>
      <!--  -->  
      <OBJECT id=VissTwo style="WIDTH: 352px; HEIGHT: 288px" 
       classid=clsid:84D09179-852A-4881-8AF5-17595C288458 name=VissTwo ></OBJECT><br>
    	<TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>测试鼠标事件和全屏功能（只对监控画面2有效）</TD></TR>
          <TR bgColor=#ffffff>
          <TD>
            单击鼠标: <INPUT readonly name=mouseclk value=0> 次 <INPUT type="button" onclick="javascript:mouseclk.value=0;" value="清零"><br>
            双击鼠标: <INPUT readonly name=mousedblclk value=0> 次 <INPUT type="button" onclick="javascript:mousedblclk.value=0;" value="清零"><br>
            右键鼠标: <INPUT readonly name=mouserclk value=0> 次 <INPUT type="button" onclick="javascript:mouserclk.value=0;" value="清零"><br>
            <INPUT onclick=FullScreen() type=button value=全屏 name=nfullscreen> 
          </TD></TR>
       </TBODY>
      </TABLE><BR><HR>
      预设点： <DIV id=presetResult style="PADDING-LEFT: 30px"></DIV>
      <HR>
      静态OCX轮巡测试：<br><br>
      <OBJECT id=Viss01 style="WIDTH: 140px; HEIGHT: 120px" 
      classid=clsid:84D09179-852A-4881-8AF5-17595C288458 name=Viss01 ></OBJECT>
      <OBJECT id=Viss02 style="WIDTH: 140px; HEIGHT: 120px" 
      classid=clsid:84D09179-852A-4881-8AF5-17595C288458 name=Viss02 ></OBJECT><br><br>
      <OBJECT id=Viss03 style="WIDTH: 140px; HEIGHT: 120px" 
      classid=clsid:84D09179-852A-4881-8AF5-17595C288458 name=Viss03 ></OBJECT>
      <OBJECT id=Viss04 style="WIDTH: 140px; HEIGHT: 120px" 
      classid=clsid:84D09179-852A-4881-8AF5-17595C288458 name=Viss04 ></OBJECT><br><br>
      <HR>
      <HR>
       动态OCX轮巡测试：<br><br>
      <TABLE cellSpacing=1 cellPadding=0 width="95%" border=0>
        <TBODY>
    		<TD>
    			摄像头: <SELECT id=cameraOCX style="WIDTH: 120px" name=cameraOCX></SELECT> <br>
    			<INPUT onclick=AddObjectElement() type=button value=创建OCX > 
      		<INPUT onclick=DelObjectElement() type=button value=删除OCX ><br><br> 
      		选择其中一个OCX进行删除: <INPUT name=OCXNumber value=0>
      		<INPUT onclick=DelObjectElementOne() type=button value=删除某个OCX > 
      	</TD>
      </TBODY>
      </TABLE>
      <HR>
    	<DIV id=divOcx01 style="WIDTH: 140px; HEIGHT: 120px" ></DIV><HR>
    	<DIV id=divOcx02 style="WIDTH: 140px; HEIGHT: 120px" ></DIV><HR>
    	<DIV id=divOcx03 style="WIDTH: 140px; HEIGHT: 120px" ></DIV><HR>
    	<DIV id=divOcx04 style="WIDTH: 140px; HEIGHT: 120px" ></DIV> 	
    <HR>
<SCRIPT>
var lResult = 1;
var OldSize=0;
var b_HasLogin=false;
var b_Recording=false;
var resultMSG;
var emsIP;
var emsPort;
var emsURI;

//var viss1 = document.createElement("object");
            //viss1.setAttribute("id", "Viss22");
            //viss1.setAttribute("classid", "clsid:84D09179-852A-4881-8AF5-17595C288458");
             //viss1.setAttribute("onfocus", function () { alert("光标停留事件"); });
             //viss1.setAttribute("onblur", function () { alert("光标离开事件"); });
             //viss1.setAttribute("onmouseover", function () { alert("光标停留事件"); });
             //viss1.setAttribute("onmouseout", function () { alert("光标离开事件"); });
             //viss1.setAttribute("OnClick", function () { alert("单击事件"); });
             //viss1.setAttribute("ondblclick", function () { alert("双击事件"); this.SetFullScreen(); });
             //viss1.attachEvent("OnClick", function () { alert("单击事件"); });
           // viss1.style.cssText = "width:352px; height:288px;";
           // viss1.CreateInstance();
//document.getElementById("presetResult").appendChild(viss1);

function over(){
   alert("123");
 }
 
 function out(){
   alert("222");
 }
 function down(){
   alert("333");
 }
 function up(){
 alert("444");	
}
 
if(VissTwo){
	 //VissTwo.onfocus = over;
  // VissTwo.onmouseover = over;
   //VissTwo.onmouseout = out;
   //VissTwo.onmousedown = down;
   //VissTwo.attachEvent("onmouseover", over);  // 停留
   //VissTwo.attachEvent("onmouseout", out);    // 离开
   //VissTwo.attachEvent("OnClick", function () { alert("单击事件"); });
   //VissTwo.attachEvent("OnDbClick", function () { alert("双击事件"); });
   //VissTwo.attachEvent("OnRightClick", function () { alert("右击事件");});
}

//初始化OCx控件
lResult = Viss.CreateInstance();
if(lResult != 0){
	alert("初始化失败");
}
lResult = VissTwo.CreateInstance();
if(lResult != 0)
{
    alert("初始化控件失败");
} 

// Begin, 创建用于轮巡的四个OCX控件
lResult = Viss01.CreateInstance();
if(lResult != 0)
{
    alert("初始化控件失败");
} 

lResult = Viss02.CreateInstance();
if(lResult != 0)
{
    alert("初始化控件失败");
} 

lResult = Viss03.CreateInstance();
if(lResult != 0)
{
    alert("初始化控件失败");
}

lResult = Viss04.CreateInstance();
if(lResult != 0)
{
    alert("初始化控件失败");
}
// End,创建用于轮巡的四个OCX控件


function OnMyClick()
{
	//mouseeve.value="鼠标单击事件";
    mouseclk.value = parseInt(mouseclk.value) + 1;
}
function OnMyDblClick()
{
	//mouseeve.value="鼠标双击事件";
    mousedblclk.value = parseInt(mousedblclk.value) + 1;
	//document.all.VissTwo.SetFullScreen();
}

function OnMyRClick()
{
    mouserclk.value = parseInt(mouserclk.value) + 1;
}

function FullScreen() 
{
	  document.all.VissTwo.SetFullScreen();
}

function getEMS(){
	  emsIP = document.all.emsIP.value;
	  emsPort = document.all.emsPort.value;
	  emsURI = document.all.emsURI.value;
}

//登陆方法
function Login(){
		alert("login");
	  document.all.LoginResult.innerHTML="";
	  var	lResult = 1;
	  getEMS();
	  var username=document.all.username.value;
	  var passwd=document.all.passwd.value;
	  
	  lResult = Viss.Login(emsIP,emsPort,emsURI,username,passwd);
	  resultMSG = " <br>用户名:" + username + "  密码: " + passwd + "      <br>";
	  alert(lResult);
	  if(lResult != 0){
		  resultMSG += "resultCode:" + lResult + " , 登录失败";
	  }else{
		  resultMSG += "resultCode:" + lResult + " , 登录成功";
	  }
	  document.all.LoginResult.innerHTML=resultMSG;
}


//登陆方法扩展
function LoginEx(){
	document.all.LoginResult.innerHTML="";
	var	lResult = 1;
	getEMS()

	var username = document.all.username.value;
	var passwd = document.all.passwd.value;
	var flagLoginExTcp = 0;
	var flagLoginExIndepDataPort = 0;
	
	if(document.getElementById("cboxLoginExTcp").checked==true)
	{
		flagLoginExTcp = 1;
	}
	if(document.getElementById("cboxLoginExIndepDataPort").checked==true)
	{
		flagLoginExIndepDataPort = 1;
	}
	
	lResult = Viss.LoginEx(emsIP,emsPort,emsURI,username,passwd,flagLoginExTcp,flagLoginExIndepDataPort);
	resultMSG = " <br>Username:" + username + "  Passwd: " + passwd + "      <br>";
	if(lResult != 0){
		resultMSG += "resultCode:" + lResult + " , Login is failure";
	}else{
		resultMSG += "resultCode:" + lResult + " , Login is successful";
	}

	document.all.LoginResult.innerHTML=resultMSG;
}

//登陆方法
function LoginTcp(){
	document.all.LoginResult.innerHTML="";
	var	lResult = 1;
	getEMS()

	var username=document.all.username.value;
	var passwd=document.all.passwd.value;
	lResult = Viss.LoginEx(emsIP,emsPort,emsURI,username,passwd, 1);
	resultMSG = " <br>Username:" + username + "  Passwd: " + passwd + "      <br>";
	if(lResult != 0){
		resultMSG += "resultCode:" + lResult + " , Login is failure";
	}else{
		resultMSG += "resultCode:" + lResult + " , Login is successful";
	}

	document.all.LoginResult.innerHTML=resultMSG;
}

function setCameraID(camID){
	cameraID = 	camID;
}

function GetCamList(){
	lResult = Viss.GetCamList();
	var cameras = ""
	var selectCamera = document.getElementById("camera");

	while (selectCamera.length > 0) {
		    selectCamera.remove(0);
		}
		
	if (lResult == "" ){
		resultMSG = "no camera";
	}else{
		resultMSG = ""
		var cameraArr = lResult.split("@");
		for(var i = 0 ; i < cameraArr.length ; i++ ){
			var cameraInfo = cameraArr[i];
			resultMSG += cameraInfo + "<br>";
			cameraInfoArr = cameraInfo.split(":");
			var newOption = document.createElement("option");
			newOption.text=cameraInfoArr[1];
			newOption.value=cameraInfoArr[0];
			selectCamera.add(newOption);
		}
	}
	document.all.GetCamListResult.innerHTML = resultMSG;
	SetAllCamList();
}

function GetCamListEx(){
	lResult = Viss.GetCamListEx();
	var cameras = ""
	var selectCamera = document.getElementById("camera");

	if (lResult == "" ){
		resultMSG = "no camera";
	}else{
		resultMSG = ""
		var cameraArr = lResult.split("@");
		for(var i = 0 ; i < cameraArr.length ; i++ ){
			var cameraInfo = cameraArr[i];
			resultMSG += cameraInfo + "<br>";
			cameraInfoArr = cameraInfo.split(":");
			var newOption = document.createElement("option");
			newOption.text=cameraInfoArr[1];
			newOption.value=cameraInfoArr[0];
			selectCamera.add(newOption);
		}
	}
	document.all.GetCamListResultEx.innerHTML = resultMSG;
}

function SetCamera() {
    var cameraId = document.all.cameraId.value;
	var cameraName = document.all.cameraname.value;
	var cameraX = document.all.cameraX.value;
	var cameraY = document.all.cameraY.value;
	var cameraPlace = document.all.cameraplace.value;
	
	lResult = Viss.SetCamera(cameraId, cameraName, cameraPlace, cameraX, cameraY);
	var cameraResult;
	if(lResult != 0){
		cameraResult += "resultCode:" + lResult + " , SetCamera is failure";
	}else{
		cameraResult += "resultCode:" + lResult + " , SetCamera is successful";
	}

	document.all.setCameraResult.innerHTML=cameraResult;
}

//释放ocx控件
function destroyOcx() {

	Viss.DestroyInstance();
	VissTwo.DestroyInstance();
}
//开始视频方法
function startVideo(){
	var selectCamera = document.getElementById("camera");
	selectedIndex = selectCamera.selectedIndex;
	if(selectedIndex == -1 ){
		alert("No camera");
		return false;
	}
	
	
		 var bSetMousePTZ = false;
		if(document.getElementById("cboxMousePtz").checked==true)
		{
			bSetMousePTZ = true;
		}
	  Viss.SetMousePTZ(bSetMousePTZ);
	  
	  
	cameraID = selectCamera.options(selectedIndex).value;
	cameraName = selectCamera.options(selectedIndex).text;

	lResult = Viss.StartLiveVideo(cameraID,0);
	resultMSG = "camera : " + cameraName  + "(" + cameraID+ ") <br>"
	if(lResult != 0){
		resultMSG += "resultCode:" + lResult + " , startVideo is failure";
	}else{
		resultMSG += "resultCode:" + lResult + " , startVideo is successful";
	}

	document.all.videoResult.innerHTML=resultMSG;
	// getPreset(cameraID);
}

//开始yuv码流
function startFrame(){
	var selectCamera = document.getElementById("camera");
	selectedIndex = selectCamera.selectedIndex;
	if(selectedIndex == -1 ){
		alert("No camera");
		return false;
	}
	cameraID = selectCamera.options(selectedIndex).value;
	cameraName = selectCamera.options(selectedIndex).text;

	lResult = Viss.StartFrame(cameraID);
	resultMSG = "camera : " + cameraName  + "(" + cameraID+ ") <br>"
	if(lResult != 0){
		resultMSG += "resultCode:" + lResult + " , startFrame is failure";
	}else{
		resultMSG += "resultCode:" + lResult + " , startFrame is successful";
	}


	document.all.videoResult.innerHTML=resultMSG;
	//getPreset(cameraID);

}

//停止yuv码流
function stopFrame(){
	var selectCamera = document.getElementById("camera");
	selectedIndex = selectCamera.selectedIndex;
	if(selectedIndex == -1 ){
		alert("No camera");
		return false;
	}
	cameraID = selectCamera.options(selectedIndex).value;
	cameraName = selectCamera.options(selectedIndex).text;

	lResult = Viss.StopFrame(cameraID);
	resultMSG = "camera : " + cameraName  + "(" + cameraID+ ") <br>"
	if(lResult != 0){
		resultMSG += "resultCode:" + lResult + " , StopFrame is failure";
	}else{
		resultMSG += "resultCode:" + lResult + " , StopFrame is successful";
	}


	document.all.videoResult.innerHTML=resultMSG;
	//getPreset(cameraID);

}

function SetPTZSpeed()
{

	var mousespeedcombobox = document.getElementById("mousespeedcombobox");
	var selectedspeedIndex = mousespeedcombobox.selectedIndex;

	var speed = speedcombobox.options(selectedspeedIndex).value;

	lResult = Viss.SetPTZSpeed(speed);
	lResult = VissTwo.SetPTZSpeed(speed);
    
}


function startVideo1()
{
    var selectCamera = document.getElementById("camera");
	selectedIndex = selectCamera.selectedIndex;
	if(selectedIndex == -1 ){
		alert("No camera");
		return false;
	}
	cameraID = selectCamera.options(selectedIndex).value;
	cameraName = selectCamera.options(selectedIndex).text;
	
	cameraID = selectCamera.options(selectedIndex).value;
	cameraName = selectCamera.options(selectedIndex).text;

	lResult = VissTwo.StartLiveVideo(cameraID,0);
	resultMSG = "camera : " + cameraName  + "(" + cameraID+ ") <br>"
	if(lResult != 0){
		resultMSG += "resultCode:" + lResult + " , startVideo is failure";
	}else{
		resultMSG += "resultCode:" + lResult + " , startVideo is successful";
	}

	document.all.videoResult.innerHTML=resultMSG;
	getPreset(cameraID);
    
}


function addPreset(){

	var preset = Viss.GetPresetPtz(cameraID);
	var presetIndex = 1 ;

	if(preset != "" ){
		var presetArr = preset.split("@");

		while(true){

			if(presetIndex > presetArr.length){

				break;
			}

			var presetEl = presetArr[presetIndex-1].split(":");

			if(parseInt(presetEl[0]) != parseInt(presetIndex) ){

				break;
			}

			++presetIndex;
		}


	}

	Viss.SetPresetPtz(cameraID, presetIndex, "presetName" ) ;

	getPreset(cameraID);

}

function deletePreset(presetIndex){
	Viss.SetPresetPtz(cameraID, presetIndex, "" ) ;
	getPreset(cameraID);
}


function getPreset(cameraID){
	var preset = Viss.GetPresetPtz(cameraID);
	var presetHtml = "";
	if( preset != "" ){

		var presetArr = preset.split("@");
		for(var idx = 0 ; idx < presetArr.length ; idx++){
			var presetEl = presetArr[idx].split(":");
			presetHtml += "<br><a href=\"javascript:controlVedio(0x19,"+presetEl[0]+");\">预设点" + presetEl[0] + "</a>";
			presetHtml += "&nbsp;&nbsp;&nbsp;<a href=\"javascript:deletePreset("+presetEl[0]+");\">删除</a>";
		}


	}

	document.all.presetResult.innerHTML=presetHtml;
}

//停止视频方法
function stopVideo(){
	//关闭视频以后显示视频容器颜色
	lResult = Viss.StopLiveVideo();
	if(lResult != 0){
		resultMSG = "resultCode:" + lResult + " , stopVideo is failure";
	}else{
		resultMSG = "resultCode:" + lResult + " , stopVideo is successful";
	}
	document.all.videoResult.innerHTML=resultMSG;

}

function stopVideo1(){
	//关闭视频以后显示视频容器颜色
	lResult = VissTwo.StopLiveVideo();
	if(lResult != 0){
		resultMSG = "resultCode:" + lResult + " , stopVideo is failure";
	}else{
		resultMSG = "resultCode:" + lResult + " , stopVideo is successful";
	}
	document.all.videoResult.innerHTML=resultMSG;

}

function RequestStorageTask() {
	var TaskName=document.all.TaskName.value;
	var CamId=document.all.CamId.value;
	var StartTime=document.all.StartTime0.value;
	var Duration=document.all.Duration.value;
	var MaxTimes=document.all.MaxTimes.value;

	lResult = Viss.RequestStorageTask(TaskName,CamId,StartTime,Duration,MaxTimes);
	if (lResult == "")
	{
	    resultMSG = "TaskId:" + lResult + " , requestStorageTask is failure";
	}
	else
	{
	    resultMSG = "TaskId:" + lResult + " , requestStorageTask is successful";
	}
	document.all.requestStorageTaskResult.innerHTML=resultMSG;
}

function OpenAudio() {
    lResult = Viss.EnableAudio(1);
    if (lResult != 0) 
    {
        resultMSG = "resultCode:" + lResult + " , EnableAudio is failure";
    }
    else 
    {
        resultMSG = "resultCode:" + lResult + " , EnableAudio is successful";
    }
    document.all.audioResult.innerHTML = resultMSG;
}

function CloseAudio() {
    lResult = Viss.EnableAudio(0);
    if (lResult != 0) 
    {
        resultMSG = "resultCode:" + lResult + " , EnableAudio is failure";
    }
    else 
    {
        resultMSG = "resultCode:" + lResult + " , EnableAudio is successful";
    }
    document.all.audioResult.innerHTML = resultMSG;
}

function StartRecordLiveVideo() 
{
    var filepath = document.all.recordfilePath.value;

    lResult = Viss.StartRecordLiveVideo(filepath);
    if (lResult != 0) 
    {
        resultMSG = "resultCode:" + lResult + " , StartRecordLiveVideo is failure";
    }
    else 
    {
        resultMSG = "resultCode:" + lResult + " , StartRecordLiveVideo is successful";
    }
    
    document.all.recordResult.innerHTML = resultMSG;
}

function StopRecordLiveVideo() 
{
    lResult = Viss.StopRecordLiveVideo();
    if (lResult != 0) 
    {
        resultMSG = "resultCode:" + lResult + " , StopRecordLiveVideo is failure";
    }
    else 
    {
        resultMSG = "resultCode:" + lResult + " , StopRecordLiveVideo is successful";
    }

    document.all.recordResult.innerHTML = resultMSG;
}



function QueryStorageTask() 
{
	var TaskId=document.all.TaskId.value;
	var CamId=document.all.CamId2.value;
	lResult = Viss.QueryStorageTask(CamId,TaskId);

	if (lResult == "")
	{
	    resultMSG = "resultCode:" + lResult + " , QueryStorageTask is failure";
	    document.all.queryStorageTaskResult.innerHTML = resultMSG;
	}
	else
	{
		// var json=eval(lResult);
		// for(var i=0;i<json.length;i++){
	// 			resultMSG +="<br>"+json[i].taskId+" "+json[i].status+" "+json[i].createData+" "+json[i].cameraName+" "+json[i].startTime+" "+json[i].duration;
	//		}
	// for(var k in json){alert(k+":"+json[k]);}

	resultMSG = "resultCode: QueryStorageTask is successful";
	document.all.queryStorageTaskResult.innerHTML = resultMSG;
	
	alert(lResult);
	}
}

function PlayVodFile()
{
	  var TaskId=document.all.vodTaskId.value;
	  var CamId=document.all.vodCamId.value;
	  
	  var bPlayProgressBar = false;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = true;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	  
	  var lResult = Viss.PlayVodByFile(TaskId, CamId);
	
	  if (lResult != 0) 
	  {
	    resultMSG = "resultCode:" + lResult + " , PlayVodByFile is failure";
	  }
	  else 
	  {
	    resultMSG = "resultCode:" + lResult + " , PlayVodByFile is successful";
	  }	
	  document.all.vodplayResult.innerHTML = resultMSG;
}

// 第二视频画面
function PlayVodFileTwo()
{
	  var TaskId=document.all.vodTaskIdTwo.value;
	  var CamId=document.all.vodCamIdTwo.value;
	  
	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	  var lResult = VissTwo.PlayVodByFile( TaskId,CamId);
	
	  if (lResult != 0) 
	  {
	    resultMSG = "resultCode:" + lResult + " , PlayVodFile is failure";
	  }
	  else 
	  {
	    resultMSG = "resultCode:" + lResult + " , PlayVodFile is successful";
	  }	
	  document.all.vodplayResultTwo.innerHTML = resultMSG;
}

function PlayVodFileEx() {
    var TaskId = document.all.vodTaskId.value;
    var CamId = document.all.vodCamId.value;
    var starttime = document.all.vodstarttime.value;
    var endtime = document.all.vodendtime.value;

	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
    var lResult = Viss.PlayVodFileEx(CamId, TaskId, starttime, endtime, true, 0);

    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , PlayVodFileEx is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , PlayVodFileEx is successful";
    }
    document.all.vodplayResult.innerHTML = resultMSG;
}

// 第二视频画面
function PlayVodFileExTwo() {
    var TaskId = document.all.vodTaskIdTwo.value;
    var CamId = document.all.vodCamIdTwo.value;
    var starttime = document.all.vodstarttimeTwo.value;
    var endtime = document.all.vodendtimeTwo.value;

	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
    var lResult = VissTwo.PlayVodFileEx(CamId, TaskId, starttime, endtime, true, 0);

    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , PlayVodFileEx is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , PlayVodFileEx is successful";
    }
    document.all.vodplayResultTwo.innerHTML = resultMSG;
}

function StopVodFile() {
    var lResult = Viss.StopVodFile();

    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StopVodFile is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , StopVodFile is successful";
    }
    document.all.vodplayResult.innerHTML = resultMSG;
}

// 第二视频画面
function StopVodFileTwo() {
    var lResult = VissTwo.StopVodFile();

    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StopVodFile is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , StopVodFile is successful";
    }
    document.all.vodplayResultTwo.innerHTML = resultMSG;
}

function setVsLocalStorageTask() {
	  var CamId=document.all.CamId3.value;
	  var RecycleRecEnable=document.all.RecycleRecEnable.value;
	  var Schedule=document.all.Schedule.value;
	  lResult = Viss.SetVsLocalStorageTask(CamId,Schedule,RecycleRecEnable);
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , setVsLocalStorageTask is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , setVsLocalStorageTask is successful";
	  }
	  document.all.setVsLocalStorageTaskResult.innerHTML=resultMSG;
}

function CancelStorageTask(){
	  var TaskId=document.all.TaskId2.value;
	  lResult = Viss.CancelStorageTask(TaskId);
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , CancelStorageTask is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , CancelStorageTask is successful";
	  }
	  document.all.CancelStorageTaskResult.innerHTML=resultMSG;
}

function QueryStorageFile(){
	  var TaskId=document.all.TaskId3.value;
	  var CamId=document.all.CamId4.value;
	  var StartTime=document.all.StartTime.value;
	  var EndTime=document.all.EndTime.value;

	  lResult = Viss.QueryStorageFile(TaskId,CamId,StartTime,EndTime);
	  if(lResult ==""){
		   resultMSG = "file:" + lResult + " , QueryStorageFile is failure";
	  }else{
				resultMSG = lResult;
	  }
	  document.all.QueryStorageFileResult.innerHTML=resultMSG;
}

function DownloadStorageFile(){
	  var TaskId=document.all.TaskId4.value;
	  var RemotePath=document.all.RemotePath.value;
	  var SaveFileName=document.all.SaveFileName.value;
	  lResult = Viss.DownloadStorageFile(TaskId,RemotePath,SaveFileName);
	  
	  if(lResult != 0){
				resultMSG = "resultCode:" + lResult + " , DownloadStorageFile is failure";
		}else{
				resultMSG = "resultCode:" + lResult + " , DownloadStorageFile is successful";
		}
		document.all.DownloadStorageFileResult.innerHTML=resultMSG;
}

// 设置中心录像默认下载目录
function OnBnClickedButtonSetStorageDefaultDlPath(){
	  var strDir = document.all.StorageDefaultDlPath.value;
	  lResult = Viss.SetStorageDefaultDLPath(strDir,true);
	  if(lResult != 0){
				resultMSG = "resultCode:" + lResult + " , SetStorageDefaultDlPath is failure";
		}else{
				resultMSG = "resultCode:" + lResult + " , SetStorageDefaultDlPath is successful";
		}
		document.all.DownloadStorageFileResult.innerHTML=resultMSG;
}

function NetGetFileByFile() {
	  var CamIdDownVs=document.all.CamIdDownVs.value;
	  var FilenameVs=document.all.FilenameVs.value;
	  var SaveFileNameVs=document.all.SaveFileNameVs.value;
	  
	  
	  lResult = Viss.NetGetFileByFile(CamIdDownVs,FilenameVs,SaveFileNameVs);
	
		if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByFile is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByFile is successful";
	  }
	  document.all.DownloadVsFileResult.innerHTML=resultMSG;
}

function NetGetFileByTimes() {
    var CamIdDownVs = document.all.CamIdDownVs.value;
    var starttime = document.all.vsStartTime.value;
    var endtime = document.all.vsEndTime.value;
    var SaveFileNameVs = document.all.SaveFileNameVs.value;
    lResult = Viss.NetGetFileByTimes(CamIdDownVs,starttime, endtime, SaveFileNameVs);

    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , NetGetFileByTimes is failure";
    } else {
    resultMSG = "resultCode:" + lResult + " , NetGetFileByTimes is successful";
    }
    document.all.DownloadVsFileResult.innerHTML = resultMSG;

}

function NetGetFilePos() 
{
    lResult = Viss.NetGetFilePos();

    if (lResult != 0) 
    {
        resultMSG = "NetGetFilePos:" + lResult;
    }
    else 
    {
        resultMSG = "NetGetFilePos:" + lResult;
    }
    document.all.DownloadVsFileResult.innerHTML = resultMSG;

}

function NetStopGetFile() {
    lResult = Viss.NetStopGetFile();

    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , NetStopGetFile is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , NetStopGetFile is successful";
    }
    document.all.DownloadVsFileResult.innerHTML = resultMSG;

}

// 设置前端录像默认下载目录, Added by wxh_2013_4_22
function OnBnClickedButtonSetVsDefaultDlPath(){
	  var strDir = document.all.SaveFileDefaultPathVs.value;
	
	  lResult = Viss.SetVsDefaultDLPath(strDir,true);
	  if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , SetVsDefaultDlPath is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , SetVsDefaultDlPath is successful";
    }
    document.all.DownloadVsFileResult.innerHTML = resultMSG;
}

function GetVsLocalStorageTask(){
	  var CamId=document.all.CamId5.value;
	  lResult = Viss.GetVsLocalStorageTask(CamId);
	  if(lResult ==""){
	      resultMSG = "resultCode:" + lResult + " , GetVsLocalStorageTask is failure";
	  }else{
		    resultMSG =lResult;
	  }
	  document.all.GetVsLocalStorageTaskResult.innerHTML=resultMSG;
}

function QueryVsLocalStorageFiles(){
	  var CamId=document.all.CamId6.value;
	  var StartTime=document.all.vsStartTime2.value;
	  var EndTime=document.all.vsEndTime2.value;

	  lResult = Viss.QueryVsLocalStorageFiles(CamId, StartTime, EndTime);
	  if(lResult ==""){
	      resultMSG = "resultCode:" + lResult + " , QueryVsLocalStorageFiles is failure";
	  }else{
		    resultMSG =lResult;
	  }
	  document.all.QueryVsLocalStorageFilesResult.innerHTML=resultMSG;	
}

function QueryVsLocalStorageFilesEx() {
    var CamId = document.all.CamId6.value;
    var StartTime = document.all.vsStartTime2.value;
    var EndTime = document.all.vsEndTime2.value;

    lResult = Viss.QueryVsLocalStorageFilesEx(CamId, StartTime, EndTime, 3);
   
    if(lResult ==""){
	    resultMSG = "resultCode:" + lResult + " , QueryVsLocalStorageFilesEx is failure";
	  }else{
		  resultMSG =lResult;
    }
	  document.all.QueryVsLocalStorageFilesResult.innerHTML=resultMSG;
}

function NetPlayBackByFile(){
	  var CamId=document.all.CamId7.value;
	  var FileName=document.all.FileName2.value;
	  var PlayHwnd=document.all.PlayHwnd.value;

	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	  lResult = Viss.NetPlayBackByFile(CamId,FileName,PlayHwnd);
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByFile is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByFile is successful";
	  }
	  document.all.NetPlayBackByFileResult.innerHTML=resultMSG;
}

// 第二视频画面
function NetPlayBackByFileTwo(){
	  var CamId = document.all.CamId7Two.value;
	  var FileName = document.all.FileName2Two.value;
	  var PlayHwnd = document.all.PlayHwndTwo.value;

	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	  lResult = VissTwo.NetPlayBackByFile(CamId,FileName,PlayHwnd);
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByFile is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByFile is successful";
	  }
	  document.all.NetPlayBackByFileResultTwo.innerHTML = resultMSG;
}

function NetPlayBackByTimes(){
	  var CamId = document.all.CamId7.value;
	  var StartTime = document.all.StartTime3.value;
	  var EndTime = document.all.EndTime3.value;
	  var PlayHwnd = document.all.PlayHwnd.value;

	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	  lResult = Viss.NetPlayBackByTimes(CamId,StartTime,EndTime,PlayHwnd);
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByTimes is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByTimes is successful";
	  }
	  document.all.NetPlayBackByFileResult.innerHTML=resultMSG;
}

// 第二视频画面
function NetPlayBackByTimesTwo(){
	  var CamId = document.all.CamId7Two.value;
	  var StartTime = document.all.StartTime3Two.value;
	  var EndTime = document.all.EndTime3Two.value;
	  var PlayHwnd = document.all.PlayHwndTwo.value;

	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	  lResult = VissTwo.NetPlayBackByTimes(CamId,StartTime,EndTime,PlayHwnd);
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByTimes is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackByTimes is successful";
	  }
	  document.all.NetPlayBackByFileResultTwo.innerHTML=resultMSG;
}

function NetPlayBackStop(){
	  lResult = Viss.NetPlayBackStop();
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackStop is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackStop is successful";
	  }
	  document.all.NetPlayBackByFileResult.innerHTML=resultMSG;
}

// 第二视频画面
function NetPlayBackStopTwo(){
	  lResult = VissTwo.NetPlayBackStop();
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackStop is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackStop is successful";
	  }
	  document.all.NetPlayBackByFileResultTwo.innerHTML=resultMSG;
}

function NetPlayBackPause(){
	  lResult = Viss.NetPlayBackPause();
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackPause is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackPause is successful";
	  }
	  document.all.NetPlayBackByFileResult.innerHTML = resultMSG;
}

// 第二视频画面
function NetPlayBackPauseTwo(){
	  lResult = VissTwo.NetPlayBackPause();
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackPause is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackPause is successful";
	  }
	  document.all.NetPlayBackByFileResultTwo.innerHTML = resultMSG;
}

function NetPlayBackResume(){
	  lResult = Viss.NetPlayBackResume();
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackResume is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackResume is successful";
	  }
	  document.all.NetPlayBackByFileResult.innerHTML=resultMSG;
}

// 第二视频画面
function NetPlayBackResumeTwo(){
	  lResult = VissTwo.NetPlayBackResume();
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackResume is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetPlayBackResume is successful";
	  }
	  document.all.NetPlayBackByFileResultTwo.innerHTML=resultMSG;
}

function NetPlayGetPlayPos(){
	  lResult = Viss.NetPlayGetPlayPos();
	  document.all.NetPlayBackByFileResult.innerHTML=lResult;
}

// 第二视频画面
function NetPlayGetPlayPosTwo(){
	  lResult = VissTwo.NetPlayGetPlayPos();
	  document.all.NetPlayBackByFileResultTwo.innerHTML=lResult;
}

function NetSetSpeed()
{
	  var speed=document.all.NetSpeed.value;
	  lResult = Viss.NetPlaySetSpeed(speed);
		  
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetSetSpeed is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetSetSpeed is successful";
	  }
	  document.all.NetPlayBackByFileResult.innerHTML=resultMSG;
}

// 第二视频画面
function NetSetSpeedTwo()
{
	  var speed=document.all.NetSpeedTwo.value;
	  lResult = VissTwo.NetPlaySetSpeed(speed);
		  
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetSetSpeed is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetSetSpeed is successful";
	  }
	  document.all.NetPlayBackByFileResultTwo.innerHTML=resultMSG;
}

function NetSetPos()
{
	  var pos=document.all.NetPos.value;
	  lResult = Viss.NetPlaySetPlayPos(pos);
	
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetSetPos is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetSetPos is successful";
	  }
	  document.all.NetPlayBackByFileResult.innerHTML=resultMSG;
}

// 第二视频画面
function NetSetPosTwo()
{
	  var pos = document.all.NetPosTwo.value;
	  lResult = VissTwo.NetPlaySetPlayPos(pos);
	
	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , NetSetPos is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , NetSetPos is successful";
	  }
	  document.all.NetPlayBackByFileResultTwo.innerHTML=resultMSG;
}

function VodSetSpeed()
{
	  var speed=document.all.VodSpeed.value;
	  lResult = Viss.SetPlaySpeedVodFile(speed);
    if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , VodSetSpeed is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , VodSetSpeed is successful";
	  }
	  document.all.vodplayResult.innerHTML=resultMSG;
}

// 第二视频画面
function VodSetSpeedTwo()
{
	  var speed = document.all.VodSpeedTwo.value;
	  lResult = VissTwo.SetPlaySpeedVodFile(speed);
    if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , VodSetSpeed is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , VodSetSpeed is successful";
	  }
	  document.all.vodplayResultTwo.innerHTML=resultMSG;
}

function VodSetPos()
{
	  var pos=document.all.VodPos.value;
	  lResult = Viss.SetPlayPosVodFile(pos);

	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , VodSetPos is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , VodSetPos is successful";
	  }
	  document.all.vodplayResult.innerHTML=resultMSG;
}

// 第二视频画面
function VodSetPosTwo()
{
	  var pos=document.all.VodPosTwo.value;
	  lResult = VissTwo.SetPlayPosVodFile(pos);

	  if(lResult != 0){
		  resultMSG = "resultCode:" + lResult + " , VodSetPos is failure";
	  }else{
		  resultMSG = "resultCode:" + lResult + " , VodSetPos is successful";
	  }
	  document.all.vodplayResultTwo.innerHTML=resultMSG;
}

//退出
function Logout(){
	document.all.LoginResult.innerHTML="";
	var lResult = Viss.Logout();
	if(lResult != 0){
		resultMSG = "resultCode:" + lResult + " , Logout is failure";
	}else{
		resultMSG = "resultCode:" + lResult + " , Logout is successful";
	}

	document.all.LoginResult.innerHTML=resultMSG;
}


//control 云台
function controlVedio(mode,nAssist){
	if( nAssist == "" ){
		nAssist = 0x18;
	}

	var speedcombobox = document.getElementById("speedcombobox");
	var selectedspeedIndex = speedcombobox.selectedIndex;

	var speed = speedcombobox.options(selectedspeedIndex).value;

	lResult = Viss.ControlPtz(cameraID,mode,speed,nAssist);
	resultMSG = " mode : " + mode + "&nbsp;&nbsp;"
	if(lResult != 0){
	    resultMSG += "resultCode:" + lResult + " , controlVideo is failure";
	}else{
	resultMSG += "resultCode:" + lResult + " , controlVideo is successful";
	}
	document.all.videoResult.innerHTML=resultMSG;

}

function PlayFile() {
	var FileName=document.all.FileName3.value;
	
		  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	lResult = Viss.PlayFile(FileName);

	if (lResult != 0) {
	    resultMSG = "resultCode:" + lResult + " , PlayFile is failure";
	} else {
	resultMSG = "resultCode:" + lResult + " , PlayFile is successful";
	}

	document.all.PlayResult.innerHTML = resultMSG;
}

// 第二视频画面
function PlayFileTwo() {
	  var FileName = document.all.FileName3Two.value;
	  
	  	  var bPlayProgressBar = 0;
		if(document.getElementById("cboxPBProgress").checked==true)
		{
			bPlayProgressBar = 1;
		}
	  Viss.SetPlayProgressBar(bPlayProgressBar);
	  
	  
	  lResult = VissTwo.PlayFile(FileName);

	  if (lResult != 0) {
	    resultMSG = "resultCode:" + lResult + " , PlayFile is failure";
	  } else {
	    resultMSG = "resultCode:" + lResult + " , PlayFile is successful";
	  }
	  document.all.PlayResultTwo.innerHTML = resultMSG;
}

function PauseFile(){
    lResult = Viss.PauseFile();
	  if (lResult != 0) {
	    resultMSG = "resultCode:" + lResult + " , PauseFile is failure";
	  } else {
	    resultMSG = "resultCode:" + lResult + " , PauseFile is successful";
	  }
	  document.all.PlayResult.innerHTML = resultMSG;
}

// 恢复本地录像回放,第二视频画面
function ResumeFileTwo(){
    lResult = VissTwo.ResumeFile();
	  document.all.PlayResultTwo.innerHTML="Resume: "+lResult;
}

// 恢复本地录像回放,第一视频画面
function ResumeFile(){
	  lResult = Viss.ResumeFile();
	  document.all.PlayResult.innerHTML="Resume: "+lResult;
}

// 第二视频画面
function PauseFileTwo(){
    lResult = VissTwo.PauseFile();
	  if (lResult != 0) {
	      resultMSG = "resultCode:" + lResult + " , PauseFile is failure";
	  } else {
	      resultMSG = "resultCode:" + lResult + " , PauseFile is successful";
	  }
	  document.all.PlayResultTwo.innerHTML = resultMSG;
}

function StopFile() {
    lResult = Viss.StopFile();
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StopFile is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , StopFile is successful";
    }
    document.all.PlayResult.innerHTML = resultMSG;
}

// 第二视频画面
function StopFileTwo() {
    lResult = VissTwo.StopFile();
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StopFile is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , StopFile is successful";
    }
    document.all.PlayResultTwo.innerHTML = resultMSG;
}

function SetSnapFilePath() {
    var FileName = document.all.snapPathTxt.value;
    lResult = Viss.SetSnapFilePath(FileName);
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , SetSnapFilePath is failure";
    } else {
        resultMSG = "resultCode:" + lResult + " , SetSnapFilePath is successful";
    }
    document.all.snapResult.innerHTML = resultMSG;
}

function SnapShot() {
 	// var SnapShotStorePath=document.all.SnapShotStorePath.value;
     lResult = Viss.SnapShot();
     if (lResult != 0) 
     {
         resultMSG = "resultCode:" + lResult + " , SnapShot is failure";
     }
     else 
     {
        resultMSG = "resultCode:" + lResult + " , SnapShot is successful";
     }
     document.all.snapResult.innerHTML = resultMSG;
 }

function SetPlaySpeed(){
	var Speed=document.all.Speed.value;
	lResult = Viss.SetPlaySpeed(Speed);
	document.all.PlayResult.innerHTML="SetPlaySpeed: "+lResult;
}

function SetPlayPercent(){
	var PlayPercent=document.all.PlayPercent.value;
	lResult = Viss.SetPlayPercent(PlayPercent);
	document.all.PlayResult.innerHTML="SetPlayPercent: "+lResult;
}

function GetTotalFrame(){
	var FileName=document.all.FileName3.value;
	lResult = Viss.GetTotalFrame(FileName);
	document.all.PlayResult.innerHTML="GetTotalFrame: "+lResult;
}

function GetPlayPercent(){
	lResult = Viss.GetPlayPercent();
	document.all.PlayResult.innerHTML="GetPlayPercent: "+lResult;
}

function GetCurFrame(){
	lResult = Viss.GetCurFrame();
	document.all.PlayResult.innerHTML="GetCurFrame: "+lResult;
}
function GetPlaySpeed(){
	lResult = Viss.GetPlaySpeed();
	document.all.PlayResult.innerHTML="GetPlaySpeed: "+lResult;
}

function NextFrame(){
	lResult = Viss.NextFrame();
	document.all.PlayResult.innerHTML="NextFrame: "+lResult;
}

function PriviousFrame(){
	lResult = Viss.PriviousFrame();
	document.all.PlayResult.innerHTML="PriviousFrame: "+lResult;
}

function ReturnToPlayMode(){
	lResult = Viss.ReturnToPlayMode ();
	document.all.PlayResult.innerHTML="ReturnToPlayMode: "+lResult;
}

function NetGetPic() {
    var CamId=document.all.picCamId.value;
    var FileName = document.all.picFileName.value;
    var SaveName = document.all.picSaveFileName.value;   
	
	var lResult = Viss.NetGetPic(CamId, FileName, SaveName);
	if (lResult != 0)
	{
		resultMSG = "resultCode:" + lResult + " , NetGetPic is failure";
    }
    else
	{
		resultMSG = "resultCode:" + lResult + " , NetGetPic is successful";
	}

	document.all.picResult.innerHTML=resultMSG;
}

function GetVersion() {
    var lResult = Viss.GetVersion();

    arrayRes = (lResult & 255);
    arrayRes1 = (lResult & 65535) >> 8;
    arrayRes2 = (lResult & 16777215) >> 16;
    arrayRes3 = lResult >> 24;

    document.all.versionResult.innerHTML = arrayRes + "," + arrayRes1 + "," + arrayRes2 + "," + arrayRes3;
	document.all.GetVersionSpan.innerHTML = Viss.GetVersion();
}

function GetLastErrorMessage() {
    var lResult = Viss.GetLastErrorMessage();
    document.all.errorResult.innerHTML = lResult;
}

function ChangePassword() {
    var oldPwd = document.all.oldPwdTxt.value;
    var newpwd = document.all.newPwdTxt.value;
    
    var lResult = Viss.ChangePassword(oldPwd, newpwd);
    
    if(lResult != 0)
    {
		resultMSG = "resultCode:" + lResult + " , ChangePassword is failure";
	}
	else
	{
		resultMSG = "resultCode:" + lResult + " , ChangePassword is successful";
	}

	document.all.pwdResult.innerHTML = resultMSG;
}

function GetSessionId() {
    var lResult = Viss.GetSessionId();
    document.all.sessionIdResult.innerHTML = lResult;
}

function GetAreaList() {
    var lResult = Viss.GetAreaList();

    if (lResult == "") {
        resultMSG = "no area";
    } else {
        resultMSG = ""
        var cameraArr = lResult.split("@");
        for (var i = 0; i < cameraArr.length; i++) {
            var cameraInfo = cameraArr[i];
            resultMSG += cameraInfo + "<br>";
            cameraInfoArr = cameraInfo.split(":");
        }
    }
    
    document.all.areaResult.innerHTML = resultMSG;

}

function GetAreaSubAH() 
{
    var areaid = document.all.areaidtxt.value;
    
    var lResult = Viss.GetAreaSubAH(areaid);

    if (lResult == "") 
    {
        resultMSG = "resultCode:" + lResult + " , GetAreaSubAH is failure";
    }
    else 
    {
        resultMSG = lResult;
    }

    alert(resultMSG);
    // document.all.ahresult.innerHTML = resultMSG;

}

function GetAreaSubCameraList()
 {
    var areaid = document.all.areaidcamtxt.value;

    var lResult = Viss.GetAreaSubCameraList(areaid);

    if (lResult == "") {
        resultMSG = "resultCode:" + lResult + " , GetAreaSubCameraList is failure";
    }
    else {
        resultMSG = lResult;
    }

    alert(resultMSG);
    // document.all.areaCamResult.innerHTML = resultMSG;

}
function StartSpeekByCam() 
{

    var TalkCamId = document.all.txtTalkCamId.value;
    var lResult = Viss.StartSpeekByCam(TalkCamId);
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StartSpeekByCam is failure";
    }
    else {
         resultMSG = "resultCode:" + lResult + " , StartSpeekByCam is succeed";
    }

    //alert(resultMSG);
    document.all.ResultTalk.innerHTML = resultMSG;
}
function StartSpeekBroadcastByCam() {

    var TalkCamId = document.all.txtTalkCamId.value;
    var lResult = Viss.StartSpeekBroadcastByCam(TalkCamId);
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StartSpeekBroadcastByCam is failure";
    }
    else {
        resultMSG = "resultCode:" + lResult + " , StartSpeekBroadcastByCam is succeed";
    }

    //alert(resultMSG);
    document.all.ResultTalk.innerHTML = resultMSG;
}
function StartSpeekByVs() {

    var TalkCamId = document.all.txtTalkVsId.value;
    var lResult = Viss.StartSpeekByVs(TalkCamId);
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StartSpeekByVs is failure";
    }
    else {
        resultMSG = "resultCode:" + lResult + " , StartSpeekByVs is succeed";
    }

    //alert(resultMSG);
    document.all.ResultTalk.innerHTML = resultMSG;
}
function StartSpeekBroadcastByVs() {

    var TalkCamId = document.all.txtTalkVsId.value;
    var lResult = Viss.StartSpeekBroadcastByVs(TalkCamId);
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StartSpeekBroadcastByVs is failure";
    }
    else {
        resultMSG = "resultCode:" + lResult + " , StartSpeekBroadcastByVs is succeed";
    }

    //alert(resultMSG);
    document.all.ResultTalk.innerHTML = resultMSG;
}
function StopSpeek() 
{
    var lResult = Viss.StopSpeek();
    if (lResult != 0) {
        resultMSG = "resultCode:" + lResult + " , StopSpeek is failure";
    }
    else {
         resultMSG = "resultCode:" + lResult + " , StopSpeek is succeed";
    }

    //alert(resultMSG);
    document.all.ResultTalk.innerHTML = resultMSG;
}


////////////////////////////////////////////////////////////////
// Begin, 创建OCX,以及关闭OCX的操作, Added_wxh_2013_11_7 
// 显示摄像头列表在下拉框中, Added_wxh_2013_11_7
function SetAllCamList()
{
		lResult = Viss.GetCamList();
		var cameras = ""
		var selectCamera = document.getElementById("camera01");
		SetCamList(selectCamera);
		selectCamera = document.getElementById("camera02");
		SetCamList(selectCamera);
		selectCamera = document.getElementById("camera03");
		SetCamList(selectCamera);
		selectCamera = document.getElementById("camera04");
		SetCamList(selectCamera);
		selectCamera = document.getElementById("cameraOCX");
		SetCamList(selectCamera);
}

// 显示摄像头列表在其中一个下拉框中, Added_wxh_2013_11_7
function SetCamList(mSelectCamera)
{
		lResult = Viss.GetCamList();
		var cameras = ""
		var selectCamera = mSelectCamera
	
		while (selectCamera.length > 0) 
		{
			    selectCamera.remove(0);
		}
			
		if (lResult == "" )
		{
			resultMSG = "no camera";
		}
		else
		{
			resultMSG = ""
			var cameraArr = lResult.split("@");
			for(var i = 0 ; i < cameraArr.length ; i++ )
			{
				var cameraInfo = cameraArr[i];
				resultMSG += cameraInfo + "<br>";
				cameraInfoArr = cameraInfo.split(":");
				var newOption = document.createElement("option");
				newOption.text=cameraInfoArr[1];
				newOption.value=cameraInfoArr[0];
				selectCamera.add(newOption);
			}
		}
}

var id_of_setinterval = 0;
var id_of_setinterval2 = 0;
var id_of_setinterval3 = 0;
var createOCXNumber = 1;
var myArray = new Array(0,0,0,0);
  
// 创建OCX对象, Added_wxh_2013_11_7 
function AddObjectElement()
{
	  if (createOCXNumber > 4)
	  {
	  	alert("只模拟创建四个OCX!");
	  	return;
	  }
	  var createOCXNumberTemp = 1;
	  for (var i = 0; i < 4; i++)
	  {
	  	if (myArray[i] == 0)
	  	{
	  		createOCXNumberTemp = i+1;
	  		break;
	  	}
	  }
	  if (createOCXNumberTemp < 5)
	  {
	  	 AddObjectElementOne(createOCXNumberTemp);
	  }  
}

// 动态创建4个OCX对象, Added_wxh_2013_11_7 
function AddObjectElementAll()
{
	  var createOCXNumberTemp = 1;
	  for (var i = 0; i < 4; i++)
	  {
	  	if (myArray[i] == 0)
	  	{
	  		createOCXNumberTemp = i+1;
	  	  AddObjectElementOne(createOCXNumberTemp); 
	  	}
	  }   
}

// 动态创建其中一个OCX对象
function AddObjectElementOne(createOCXNumberTemp)
{
	  if (myArray[createOCXNumberTemp-1] == 1)
	  {
	  	alert("该Div已创建一个OCX!");
	  	return;
	  }
	  
	  var vissObject = document.createElement("object");
    vissObject.setAttribute("id", "VissNumber" + createOCXNumberTemp);
    vissObject.setAttribute("classid", "clsid:84D09179-852A-4881-8AF5-17595C288458");
    vissObject.style.cssText = "width:140px; height:120px;";
    vissObject.CreateInstance();
    var selectCamera = document.getElementById("cameraOCX");
	  selectedIndex = selectCamera.selectedIndex;
	  if(selectedIndex == -1 ){
		  alert("No camera");
		  return false;
	  }
	  cameraID = selectCamera.options(selectedIndex).value;
	  cameraName = selectCamera.options(selectedIndex).text;
	
    document.getElementById("divOcx0"+createOCXNumberTemp).appendChild(vissObject);
    
    lResult = vissObject.StartLiveVideo(cameraID,0);
    createOCXNumber++;
    myArray[createOCXNumberTemp-1] = 1;
}

// 删除OCX操作, Added by wxh_2013_11_7
function DelObjectElement()
{
	  var createOCXNumberTemp = 1;
	  for (var i = 0; i < 4; i++)
	  {
	  	if (myArray[i] == 1)
	  	{
	  		createOCXNumberTemp = i+1;
	  		break;
	  	}
	  }
    var aaa = document.getElementById("VissNumber" +(createOCXNumberTemp));
    aaa.StopLiveVideo();
		document.getElementById('divOcx0'+createOCXNumberTemp).removeChild(aaa);
		myArray[createOCXNumberTemp-1] = 0;
		createOCXNumber--;
}

// 删除其中的一个OCX视频, Added by wxh_2013_11_7
function DelObjectElementOne()
{
	  var OCXNumberTemp = document.all.OCXNumber.value;//document.getElementById("OCXNumber");
	  if (OCXNumberTemp < 0 || OCXNumberTemp > createOCXNumber || OCXNumberTemp == 0)
	  {
	  	alert("请输入已创建的OCX的序号,序号由1开始!");
	  	return;
	  }
	  else if (createOCXNumber < 0 || createOCXNumber == 0)
	  {
	  	alert("必须先创建OCX!");
	  	return;
	  }
    var aaa = document.getElementById("VissNumber" + OCXNumberTemp);
    aaa.StopLiveVideo();
    aaa.DestroyInstance();
		document.getElementById('divOcx0'+OCXNumberTemp).removeChild(aaa);
		myArray[OCXNumberTemp-1] = 0;
		createOCXNumber--;
}

// 在页面关闭时,要执行该操作,将所有的OCX停止并关掉,不然进程里面会有IE线程, Added by wxh_2013_11_7
// 在关闭页面前处理函数testunload()中调用该函数
function DelObjectElementAll()
{
		for (var i = 0; i < 4; i++)
	  {
	  	if (myArray[i] == 1)
	  	{
	  		createOCXNumberTemp = i+1;
	  		var aaa = document.getElementById("VissNumber" +(createOCXNumberTemp));
        aaa.StopLiveVideo();
		    document.getElementById('divOcx0'+createOCXNumberTemp).removeChild(aaa);
		    myArray[createOCXNumberTemp-1] = 0;
		    createOCXNumber--;
	  	}
	  }   
	  for (var i = 0; i < 4; i++)
	  {
	  	if (myArray[i] == 1)
	  	{
	  		createOCXNumberTemp = i+1;
	  		var aaa = document.getElementById("VissNumber" +(createOCXNumberTemp));
        aaa.DestroyInstance();
		    document.getElementById('divOcx0'+createOCXNumberTemp).removeChild(aaa);
		    myArray[createOCXNumberTemp-1] = 0;
		    createOCXNumber--;
	  	}
	  } 
}
// End, 创建OCX,以及关闭OCX的操作, Added_wxh_2013_11_7 
///////////////////////////////////////////////////////


///////////////////////////////////////////////////////
// Begin,静态OCX, Added_wxh_2013_11_4
// 静态OCX固定摄像头开始轮巡, Added by wxh_2013_11_4
function StartShowMoreLive()
{
	  StartShowMoreLiveStart();
	  id_of_setinterval = self.setInterval("StartShowMoreLiveStart()",20000);
}

// 静态OCX任意摄像头开始轮巡, Added by wxh_2013_11_4
function StartShowMoreLiveDiff()
{
	  StartShowMoreLiveStartDiff();
	  id_of_setinterval2 = self.setInterval("StartShowMoreLiveStartDiff()",20000);
}

// 静态OCX开始动态轮巡, Added by wxh_2013_11_4
function StartShowMoreLiveDyn()
{
	  AddObjectElementAll();
	  StartShowMoreLiveStartDyn();
	  id_of_setinterval3 = self.setInterval("StartShowMoreLiveStartDyn()",20000);
}

// 静态OCX固定四个开始单个轮巡, Added by wxh_2013_11_4
function StartShowMoreLiveStart()
{
		var selectCamera01 = document.getElementById("camera01");
		var selectCamera02 = document.getElementById("camera02");
		var selectCamera03 = document.getElementById("camera03");
		var selectCamera04 = document.getElementById("camera04");
		
		if (nCountNum >= 4)
		{
			nCountNum = 0;
		}
		var numberTemp = nCountNum + 1;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLive(selectCamera01, numberTemp);
			
		numberTemp = nCountNum + 2;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLive(selectCamera02, numberTemp);
		
		numberTemp = nCountNum + 3;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLive(selectCamera03, numberTemp);
		
		numberTemp = nCountNum + 4;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLive(selectCamera04, numberTemp);
		nCountNum++;
}

// 静态OCX任意摄像头开始单个轮巡, Added by wxh_2013_11_4
function StartShowMoreLiveStartDiff()
{
		var selectCamera01 = document.getElementById("camera01");
		var selectCamera02 = document.getElementById("camera02");
		var selectCamera03 = document.getElementById("camera03");
		var selectCamera04 = document.getElementById("camera04");
		
		if (nCountNum >= 4)
		{
			nCountNum = 0;
		}
		var numberTemp = nCountNum + 1;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDiff(selectCamera01, numberTemp);
			
		numberTemp = nCountNum + 2;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDiff(selectCamera02, numberTemp);
		
		numberTemp = nCountNum + 3;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDiff(selectCamera03, numberTemp);
		
		numberTemp = nCountNum + 4;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDiff(selectCamera04, numberTemp);
		nCountNum ++;
		if (nCountNum == 3)
		{
			Viss04.Logout();
		}
}

// 静态OCX开始单个轮巡, Added by wxh_2013_11_4
function StartShowOneLive(bselectCamera, mflag)
{
		var selectCamera = bselectCamera; //document.getElementById("camera01");
		selectedIndex = selectCamera.selectedIndex;
		if(selectedIndex == -1 )
		{
			alert("No camera");
			return false;
		}
		var cameraID = selectCamera.options(selectedIndex).value;
		var cameraName = selectCamera.options(selectedIndex).text;
	
	  if (mflag == 1)
	  {
	  	Viss01.StopLiveVideo();
	    lResult = Viss01.StartLiveVideo(cameraID,0);
	  }
	  else if (mflag == 2)
	  {
	  	Viss02.StopLiveVideo();
	  	lResult = Viss02.StartLiveVideo(cameraID,0);
	  }
	  else if (mflag == 3)
	  {
	  	 Viss03.StopLiveVideo();
	  	lResult = Viss03.StartLiveVideo(cameraID,0);
	  }
	  else if (mflag == 4)
	  {
	  	Viss04.StopLiveVideo();
	  	lResult = Viss04.StartLiveVideo(cameraID,0);
	  }
		resultMSG = "camera : " + cameraName  + "(" + cameraID+ ") <br>"
		if(lResult != 0)
		{
			resultMSG += "resultCode:" + lResult + " , startVideo is failure";
		}
		else
		{
			resultMSG += "resultCode:" + lResult + " , startVideo is successful";
		}
	
		document.all.videoResult.innerHTML=resultMSG;
}

var countMoreCamera01 = 0; // 01分屏不超过50个
var countMoreCamera02 = 0; // 02分屏不超过50个
var countMoreCamera03 = 0; // 03分屏不超过50个
var countMoreCamera04 = 0; // 04分屏不超过50个

// 静态OCX轮巡使用不同的摄像头,每个分屏分50个,Added by wxh_2013_11_16
function StartShowOneLiveDiff(bselectCamera, mflag)
{
		var selectCamera = bselectCamera; //document.getElementById("camera01");
		var selectedIndexTemp = 0;
		
		if (selectCamera.length == -1)
		{
			return false;
		}
		
		var countMore50 = 0;
		var numberTemp = parseInt(selectCamera.length / 4);
		
		if (mflag == 1)
	  {
	    if (countMoreCamera01 > numberTemp)
			{
				countMoreCamera01 = 0;
			}
			countMore50 = countMoreCamera01;
			countMoreCamera01++;
	  }
	  else if (mflag == 2)
	  {
	  	if (countMoreCamera02 > numberTemp)
			{
				countMoreCamera02 = 0;
			}
			countMore50 = countMoreCamera02;
			countMoreCamera02++;
	  }
	  else if (mflag == 3)
	  {
	  	if (countMoreCamera03 > numberTemp)
			{
				countMoreCamera03 = 0;
			}
			countMore50 = countMoreCamera03;
			countMoreCamera03++;
	  }
	  else if (mflag == 4)
	  {
	  	if (countMoreCamera04 > numberTemp)
			{
				countMoreCamera04 = 0;
			}
			countMore50 = countMoreCamera04;
			countMoreCamera04++
	  }
	  
		selectedIndexTemp = countMore50 + (numberTemp * (mflag - 1));
		
		//alert(selectedIndexTemp + '|' + countMore50 + '|' + numberTemp +'|' + mflag);
		
		
		if(selectedIndexTemp == -1 ){
			alert("No camera");
			return false;
		}	
		
		var cameraID = selectCamera.options(selectedIndexTemp).value;
		var cameraName = selectCamera.options(selectedIndexTemp).text;
	
		//alert(selectedIndexTemp + '|' + cameraID+cameraName);
		
	  if (mflag == 1)
	  {
	  	Viss01.StopLiveVideo();
	    lResult = Viss01.StartLiveVideo(cameraID,0);
	  }
	  else if (mflag == 2)
	  {
	  	Viss02.StopLiveVideo();
	  	lResult = Viss02.StartLiveVideo(cameraID,0);
	  }
	  else if (mflag == 3)
	  {
	  	Viss03.StopLiveVideo();
	  	lResult = Viss03.StartLiveVideo(cameraID,0);
	  }
	  else if (mflag == 4)
	  {
	  	Viss04.StopLiveVideo();
	  	lResult = Viss04.StartLiveVideo(cameraID,0);
	  }
		resultMSG = "camera : " + cameraName  + "(" + cameraID+ ") <br>"
		if(lResult != 0){
			resultMSG += "resultCode:" + lResult + " , startVideo is failure";
		}else{
			resultMSG += "resultCode:" + lResult + " , startVideo is successful";
		}
	
		document.all.videoResult.innerHTML=resultMSG;
}

// 静态OCX停止轮巡, Added by wxh_2013_11_4
function StopShowMoreLive()
{
		self.clearInterval(id_of_setinterval);
		lResult = Viss01.StopLiveVideo();
		lResult = Viss02.StopLiveVideo();
		lResult = Viss03.StopLiveVideo();
		lResult = Viss04.StopLiveVideo();
}

// 静态OCX不同摄像头停止轮巡, Added by wxh_2013_11_4
function StopShowMoreLiveDiff()
{
		self.clearInterval(id_of_setinterval2);
		lResult = Viss01.StopLiveVideo();
		lResult = Viss02.StopLiveVideo();
		lResult = Viss03.StopLiveVideo();
		lResult = Viss04.StopLiveVideo();
}

// End,静态OCX, Added_wxh_2013_11_4
///////////////////////////////////////////////////////

///////////////////////////////////////////////////////
// Begin,动态OCX, Added_wxh_2013_11_4
// 创建动态OCX的测试,  Added by wxh_2013_11_7
function StartShowMoreLiveStartDyn()
{
	  if (createOCXNumber > 4)
	  {
		  DelObjectElementAll();	 
	  }
	  AddObjectElementAll();
	  StartShowMoreLiveStartDyn();
}

var nCountNum = 0;

// 动态OCX显示不同的摄像头, Added by wxh_2014_3_5
function StartShowMoreLiveStartDyn()
{
		var selectCamera01 = document.getElementById("camera01");
		var selectCamera02 = document.getElementById("camera02");
		var selectCamera03 = document.getElementById("camera03");
		var selectCamera04 = document.getElementById("camera04");
		
		if (nCountNum >= 4)
		{
			nCountNum = 0;
		}
		var numberTemp = nCountNum + 1;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDyn(selectCamera01, numberTemp);
			
		numberTemp = nCountNum + 2;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDyn(selectCamera02, numberTemp);
		
		numberTemp = nCountNum + 3;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDyn(selectCamera03, numberTemp);
		
		numberTemp = nCountNum + 4;
		if (numberTemp > 4)
		{
			numberTemp = numberTemp - 4;
		}
		StartShowOneLiveDyn(selectCamera04, numberTemp);
		nCountNum ++;
}

// 动态OCX开始单个轮巡, Added by wxh_2013_11_4
function StartShowOneLiveDyn(bselectCamera, mflag)
{
		var selectCamera = bselectCamera; //document.getElementById("camera01");
		selectedIndex = selectCamera.selectedIndex;
		if(selectedIndex == -1 )
		{
			alert("No camera");
			return false;
		}
		var cameraID = selectCamera.options(selectedIndex).value;
		var cameraName = selectCamera.options(selectedIndex).text;
	
	  var aaa = document.getElementById("VissNumber" + mflag);
	  lResult = aaa.StartLiveVideo(cameraID,0);
		resultMSG = "camera : " + cameraName  + "(" + cameraID+ ") <br>"
		if(lResult != 0)
		{
			resultMSG += "resultCode:" + lResult + " , startVideo is failure";
		}
		else
		{
			resultMSG += "resultCode:" + lResult + " , startVideo is successful";
		}
	
		document.all.videoResult.innerHTML=resultMSG;
}

// 动态OCX停止轮巡, Added by wxh_2013_11_4
function StopShowMoreLiveDyn()
{
	self.clearInterval(id_of_setinterval3);
	DelObjectElementAll();
}

// 关闭页面前处理, Added by wxh_2013_11_4
window.onbeforeunload=testunload; 
function testunload() 
{ 
	  StopShowMoreLive();
	  StopShowMoreLiveDiff();
	  StopShowMoreLiveDyn();
}

// End, 动态OCX Added_wxh_2013_11_4 
//////////////////////////////////////////////////////////////////

</SCRIPT>
  
<script language="javascript" for=Viss event="OnReceiveYUV(lMsgID, bstrDeviceID, hWnd, lMessage, bstrMessage)">
	if (lMsgID=="-2147209216") {
	    //document.all.yuvData.innerHTML=bstrMessage;
		document.all.yuvData.innerHTML=bstrMessage + "|" +bstrDeviceID;
	}
</script>
  

<!--On GetData(Data)是OCX控件中的事件，这里的事件名称必须与OCX控件中的事件名称一样 -->
	<script for=visstwo event="onclick">
    return onmyclick();
  </script>
  <!--On GetData(Data)是OCX控件中的事件，这里的事件名称必须与OCX控件中的事件名称一样 -->
  <!--script for=VissTwo event="OnDbClick"-->

  <!--/script-->
  
  <script for=VissTwo event="OnRightClick">
    return OnMyRClick();
  </script>
  
    </TD>
     <TD vAlign=top>
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>用户登陆 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>
          	<INPUT onclick=Login() type=button value=登陆 name=Login> 
          	<INPUT onclick=Logout(); type=button value=退出 name=Logout> <br>
            <input type="checkbox" name="checkboxLoginExTcp" id = "cboxLoginExTcp" ><label for="cboxLoginExTcp">TCP模式</lable>
						<input type="checkbox" name="checkboxLoginExTcp" id = "cboxLoginExIndepDataPort" ><label for="cboxLoginExIndepDataPort">独立数据端口模式</lable><br>
            <INPUT onclick=LoginEx() type=button value=登陆(扩展) name=LoginEx>
          	<!--<INPUT onclick=LoginTcp() type=button value=登陆(扩展) name=LoginTCP>--> 
            <BR><br />
             执行结果: <SPAN id=LoginResult style="PADDING-LEFT: 30px"></SPAN></TD></TR>
        </TBODY>
      </TABLE><BR>
      
       <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>控制 </TD></TR>
          <TR bgColor=#ffffff>
          
          	 <TD colspan="3">云台转动速度:
                    <SELECT id=mousespeedcombobox style="WIDTH: 120px" name=mousespeedcombobox>
                      <option value=1>1</option>
                      <option  value=2 selected>2</option>
                    <option  value=3 >3</option>
                      <option  value=4>4</option>
                      <option  value=5>5</option>
                    </SELECT> 	<INPUT onclick=SetPTZSpeed() type=button value=设置鼠标云台速度 name=defaultPtz> 
						<input type="checkbox" name="cboxPBProgress" id = "cboxPBProgress" ><label for="cboxPBProgress">回放是否显示进度条</lable>
						<input type="checkbox" name="cboxMousePtz" id = "cboxMousePtz" ><label for="cboxMousePtz">鼠标是否可以控制云台</lable></TD>
                 
						</TR>
        </TBODY>
      </TABLE><BR>		
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>获取摄像机列表 </TD></TR>
	        <TR bgColor=#ffffff>
	          <TD>
					  <input name="GetCamList" type="button" value="GetCamList" onclick="GetCamList();" />
			       <br /><br />
			       执行结果: <br>(以下记录格式为：摄像机id|摄像机Areaid:摄像机名称:Vsid|VsAreaid:在线状态:设备是否被禁用)</br>
						<SPAN id=GetCamListResult></SPAN>
						</TD>
					</TR>
			  </TBODY>
			</TABLE>
			
			<TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>获取摄像机列表扩展 </TD></TR>
	        <TR bgColor=#ffffff>
	          <TD>
						<input name="GetCamListEx" type="button" value="GetCamListEx" onclick="GetCamListEx();" /> 
			       <br /><br />
			       执行结果: <br>(以下记录格式为：摄像机ID:CamDevID:摄像机名称:地点:所属单位:使用者:管理者移动电话:接入方式:X:Y:摄像头类型:在线状态:地区ID)</br>
						<SPAN id=GetCamListResultEx></SPAN>
						</TD>
					  </TR>
			 </TBODY>
			</TABLE><BR>
			
			<BR>
			<TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>轮巡测试 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>
          	摄像头01: <SELECT id=camera01 style="WIDTH: 120px" name=camera01></SELECT> <br>
            摄像头02: <SELECT id=camera02 style="WIDTH: 120px" name=camera02></SELECT> <br>
            摄像头03: <SELECT id=camera03 style="WIDTH: 120px" name=camera03></SELECT> <br>
            摄像头04: <SELECT id=camera04 style="WIDTH: 120px" name=camera04></SELECT> <br><br>
		        <INPUT onclick=StartShowMoreLive(); type=button value=静态OCX开始轮巡 name=startShowMoreLive>  
		        <INPUT onclick=StopShowMoreLive(); type=button value=静态OCX停止轮巡 name=stopShowMoreLive><hr>
		        <INPUT onclick=StartShowMoreLiveDiff(); type=button value=静态OCX任意摄像头开始轮巡 name=startShowMoreLiveDiff>
		        <INPUT onclick=StopShowMoreLiveDiff(); type=button value=静态OCX任意摄像头停止轮巡 name=stopShowMoreLiveDiff><hr>
		        <INPUT onclick=StartShowMoreLiveDyn(); type=button value=动态OCX开始轮巡 name=startShowMoreLive>
		        <INPUT onclick=StopShowMoreLiveDyn(); type=button value=动态OCX停止轮巡 name=stopShowMoreLive>
            <br />
			    </TD>
			   </TR>
			  </TBODY>
			</TABLE><BR>

			
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>视频监控 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>摄像头: <SELECT id=camera style="WIDTH: 120px" name=camera></SELECT> <BR>
              <br />
              <INPUT onclick=startVideo(); type=button value=打开监控 name=startVideo> 
              <INPUT onclick=addPreset(); type=button value=增加预设点 name=startVideo> 
              <INPUT onclick=stopVideo(); type=button value=关闭监控 name=stopVideo> 
              <BR><INPUT id=Button1 onclick=startVideo1(); type=button value=打开监控2> 
              <INPUT id=Button2 type=button value=增加预设点2> <INPUT id=Button3 onclick=stopVideo1(); type=button value=关闭监控2> 
			  <br>
				<input name=startFrame type=button value=接受YUV onclick=startFrame(); id=Button4>
				<input name=stopFrame type=button value=停止YUV onclick=stopFrame(); id=Button5>
				<br>
				执行结果:<br>
				<span style="MARGIN-LEFT: 30px" id="videoResult"></span>
				<br>
				接受到的yuv数据:	<span style="MARGIN-LEFT: 0px" id=yuvData></span>
				<br>
              <BR><br />
            <TABLE width=300 border=0>
              <TBODY>
              <TR>
                <TD colspan="3">云台转动速度:
                    <SELECT id=speedcombobox style="WIDTH: 120px" name=speedcombobox>
                      <option value=1>1</option>
                      <option  value=2 selected>2</option>
                    <option  value=3 >3</option>
                      <option  value=4>4</option>
                      <option  value=5>5</option>
                    </SELECT></TD>
                  </TR>
              <TR>
                <TD><INPUT onclick=controlVedio(0x20,0x18); type=button value=" 左右自动巡航(IPCAM)" name=control> 
                </TD>
                <TD><INPUT onmouseup=controlVedio(0x18,0x01); onmousedown=controlVedio(0x01,0x18); type=button value=向上 name=control> 
                </TD>
                <TD><INPUT onclick=controlVedio(0x21,0x18); type=button value=" 上下自动巡航(IPCAM)" name=control> 
                </TD></TR>
              <TR>
                <TD><INPUT onmouseup=controlVedio(0x18,0x03); onmousedown=controlVedio(0x03,0x18); type=button value=向左 name=control> 
                </TD>
                <TD>&nbsp; </TD>
                <TD><INPUT onmouseup=controlVedio(0x18,0x04); onmousedown=controlVedio(0x04,0x18); type=button value=向右 name=control> 
                </TD></TR>
              <TR>
                <TD></TD>
                <TD><INPUT onmouseup=controlVedio(0x18,0x02); onmousedown=controlVedio(0x02,0x18); type=button value=向下 name=control> 
                </TD>
                <TD></TD></TR>
              <TR>
                <TD><INPUT onmouseup=controlVedio(0x18,0x09); onmousedown=controlVedio(0x09,0x18); type=button value=焦点调近 name=control> 
                </TD>
                <TD><INPUT onmouseup=controlVedio(0x18,0x0A); onmousedown=controlVedio(0x0A,0x18); type=button value=焦点调远 name=control> 
                </TD>
                <TD></TD></TR>
              <TR>
                <TD><INPUT onclick=controlVedio(0x0C,0x18); type=button value=自动调焦（IPCAMERA） name=control> 
                </TD>
                <TD><INPUT onmouseup=controlVedio(0x18,0x0D); onmousedown=controlVedio(0x0D,0x18); type=button value=焦距拉近 name=control> 
                </TD>
                <TD><INPUT onmouseup=controlVedio(0x18,0x0E); onmousedown=controlVedio(0x0E,0x18); type=button value=焦距拉远 name=control> 
                </TD></TR>
              <TR>
                <TD></TD>
                <TD><INPUT onclick=controlVedio(0x11,0x18); type=button value=光圈自动调节 name=control> 
                </TD>
                <TD><INPUT onmouseup=controlVedio(0x10,0x12); onmousedown=controlVedio(0x12,0x10); type=button value=光圈增大 name=control> 
                </TD></TR>
              <TR>
                <TD><INPUT onmouseup=controlVedio(0x10,0x13); onmousedown=controlVedio(0x13,0x10); type=button value=光圈减小 name=control> 
                </TD>
                <TD><INPUT onclick=controlVedio(0x14,0x15); type=button value=擦拭启动 name=control> 
                </TD>
                <TD><INPUT onclick=controlVedio(0x15,0x14); type=button value=擦拭停止 name=control> 
                </TD></TR>
              <TR>
                <TD><INPUT onclick=controlVedio(0x16,0x18); type=button value=自动巡航 name=control> 
                </TD>
                <TD><INPUT onclick=controlVedio(0x18,0x16); type=button value=巡航停止 name=control> 
                </TD>
                <TD></TD></TR>
              <TR>
                <TD></TD>
                <TD></TD>
                <TD></TD></TR></TBODY></TABLE></TD></TR>
            </TBODY>
      </TABLE><BR>
                
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>实时音频</TD></TR>
          <TR bgColor=#ffffff>
           <TD><INPUT onclick=OpenAudio() type=button value=开启 name=control> 
           <INPUT onclick=CloseAudio() type=button value=关闭 name=control><br />
           <BR>执行结果: <SPAN id=audioResult style="paddding-left: 30"></SPAN></TD></TR>
         </TBODY>
      </TABLE><BR>
                
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>实时录像</TD></TR>
          <TR bgColor=#ffffff>
          <TD>文件路径: <INPUT name=recordfilePath><br /><br />
           <INPUT onclick=StartRecordLiveVideo() type=button value=开始录像 name=control> 
           <INPUT onclick=StopRecordLiveVideo() type=button value=停止录像 name=control> <br />
           <BR>执行结果: <SPAN id=recordResult style="paddding-left: 30"></SPAN></TD></TR>
        </TBODY>
      </TABLE><BR>
                
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>定制中心存储任务 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>TaskName: <INPUT name=TaskName> CamId: <INPUT name=CamId> 
            StartTime: <INPUT value="12 30 0 0 0" name=StartTime0> Duration: 
            <INPUT value=1 name=Duration> MaxTimes: <INPUT value=1 name=MaxTimes><br /><br />
            <INPUT onclick=RequestStorageTask() type=button value=定制中心存储任务 name=control> <br />
            <BR>执行结果: <SPAN id=requestStorageTaskResult style="paddding-left: 30"></SPAN></TD></TR>
         </TBODY>
      </TABLE><BR>
                              
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>查询中心存储任务 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>TaskId: <INPUT name=TaskId> CamId: <INPUT name=CamId2><br /><br />
              <INPUT onclick=QueryStorageTask() type=button value=查询中心存储任务 name=control><br /><br />
              执行结果: <SPAN id=queryStorageTaskResult style="paddding-left: 30"></SPAN></TD>
              </TR>
         </TBODY>
      </TABLE><BR>
            
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
          <TR>
          <TD bgColor=#ebebeb>播放中心存储文件(第一视频)</TD></TR>
          <TR bgColor=#ffffff>
          <TD>TaskId: <INPUT name=vodTaskId> FilePath（扩展为:camID）: <INPUT name=vodCamId> <BR />
							开始时间: <INPUT name=vodstarttime> 结束时间: <INPUT name=vodendtime> <BR />
							是否显示进度条：<INPUT name=processbar value=false><br /><br />
							<input name="control" type="button" value="播放" onclick="PlayVodFile()"/>
							<input name="control" type="button" value="播放(扩展）" onclick="PlayVodFileEx()"/>
							<input name="control" type="button" value="停止播放" onclick="StopVodFile()" /><br />
							<input name="control" type="button" value="SetSpeed" onclick="VodSetSpeed()"> 
             	speed:<input type="text" name="VodSpeed" value="2"><br />
							<input name="control" type="button" value="SetPos" onclick="VodSetPos()"> 
							pos: <input type="text" name="VodPos" value="90"><br />
              执行结果: <SPAN id=vodplayResult style="paddding-left: 30"></SPAN>      
           </TD></TR>
        </TBODY>
     </TABLE><BR>
     
     <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
          <TR>
          <TD bgColor=#ebebeb>播放中心存储文件(第二视频)</TD></TR>
          <TR bgColor=#ffffff>
          <TD>TaskId: <INPUT name=vodTaskIdTwo> FilePath（扩展为:camID）: <INPUT name=vodCamIdTwo> <BR />
							开始时间: <INPUT name=vodstarttimeTwo> 结束时间: <INPUT name=vodendtimeTwo> <BR />
							是否显示进度条：<INPUT name=processbarTwo value=false><br /><br />
							<input name="control" type="button" value="播放" onclick="PlayVodFileTwo()"/>
							<input name="control" type="button" value="播放(扩展）" onclick="PlayVodFileExTwo()"/>
							<input name="control" type="button" value="停止播放" onclick="StopVodFileTwo()" /><br />
							<input name="control" type="button" value="SetSpeed" onclick="VodSetSpeedTwo()"> 
             	speed:<input type="text" name="VodSpeedTwo" value="2"><br />
							<input name="control" type="button" value="SetPos" onclick="VodSetPosTwo()"> 
							pos: <input type="text" name="VodPosTwo" value="90"><br />
              执行结果: <SPAN id=vodplayResultTwo style="paddding-left: 30"></SPAN>      
           </TD></TR>
        </TBODY>
     </TABLE><BR>
            
     <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>设置视频服务器本地存储任务 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>Schedule: <INPUT value=0,1,12,30,13,30@0,2,12,30,13,30 name=Schedule> 
              CamId: <INPUT name=CamId3> RecycleRecEnable: 
              <INPUT value=false name=RecycleRecEnable><br /><br />
              <INPUT onclick=setVsLocalStorageTask() type=button value=设置本地存储任务 name=control> <br /><br />
              执行结果: <SPAN id=setVsLocalStorageTaskResult style="paddding-left: 30"></SPAN></TD></TR>
         </TBODY>
      </TABLE><BR>
      
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>删除中心平台录像存储任务 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>TaskId: <INPUT name=TaskId2> 
            <INPUT onclick=CancelStorageTask() type=button value=取消中心平台录像存储任务 name=control><br /><br />
            执行结果: <SPAN id=CancelStorageTaskResult style="paddding-left: 30"></SPAN></TD></TR>
          </TBODY>
      </TABLE><BR>
      
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>平台录像文件查询 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>TaskId: <INPUT name=TaskId3> CamId: <INPUT name=CamId4><br />
              StartTime: <INPUT value="2013-04-17 08:30:00" name=StartTime> 
              EndTime: <INPUT value="2013-04-18 08:30:00" name=EndTime><br /><br />
              <INPUT onclick=QueryStorageFile() type=button value=录像文件查询 name=control><br /><br />
              执行结果: <SPAN id=QueryStorageFileResult style="PADDING-LEFT: 30px"></SPAN></TD></TR>
         </TBODY>
      </TABLE><BR>
      
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
          <TR>
          <TD bgColor=#ebebeb>下载平台录像文件 </TD></TR>
          <TR bgColor=#ffffff>
             <TD>TaskId: <INPUT name=TaskId4 value="">
		          RemotePath: <INPUT name=RemotePath value=""> <br> 
		          SaveFileName: <INPUT name=SaveFileName value=""><br />
		          StorageDefaultDlPath: <INPUT name=StorageDefaultDlPath value="D:\"><br /><BR>
              <INPUT onclick=DownloadStorageFile() type=button value=下载录像文件 name=control>
              <INPUT onclick=OnBnClickedButtonSetStorageDefaultDlPath() type=button value=设置默认下载目录 name=control><br /><br />
              执行结果：<SPAN id=DownloadStorageFileResult style="PADDING-LEFT: 30px"></SPAN> </TD></TR>
        </TBODY>
     </TABLE><BR>
     
     <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>下载VS录像文件 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>CamId: <INPUT name=CamIdDownVs value="B73BD7CE5B82B71BE5EF581FD189DB57"> Filename: <INPUT name=FilenameVs value=""><br />
              StartTime: <INPUT value="2013-04-17 16:47:53" name=vsStartTime> 
              EndTime: <INPUT value="2013-04-18 16:53:59" name=vsEndTime>  
              SaveFileName: <INPUT name=SaveFileNameVs value="D:\01\"><br />
              DefaultPath: <INPUT name=SaveFileDefaultPathVs value="D:\02\"><br /><br />
              <INPUT onclick=NetGetFileByFile() type=button value=按文件名下载 name=control>
              <INPUT onclick=NetGetFileByTimes() type=button value=按时间下载 name=control>
              <INPUT onclick=NetGetFilePos() type=button value=获取下载进度 name=contro>
              <INPUT onclick=NetStopGetFile() type=button value=停止下载 name=contro0>
              <INPUT onclick=OnBnClickedButtonSetVsDefaultDlPath() type=button value=设置默认下载目录 name=control><br /><br />
              执行结果：<SPAN id=DownloadVsFileResult style="PADDING-LEFT: 30px"></SPAN> </TD></TR>
         </TBODY>
      </TABLE><BR>
            
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>下载图片文件</TD></TR>
          <TR bgColor=#ffffff>
          <TD>CamId: <INPUT name=picCamId value="B73BD7CE5B82B71BE5EF581FD189DB57"> Filename: <INPUT name=picFileName value=""><br />
              SaveFileName: <INPUT name=picSaveFileName value="D:\01\"><br /><br />
              <INPUT onclick=NetGetPic() type=button value=下载图片 name=control><br /><br />
              执行结果：<SPAN id=picResult style="PADDING-LEFT: 30px"></SPAN> </TD></TR>
         </TBODY>
      </TABLE><BR>          
            
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
          <TR>
          <TD bgColor=#ebebeb>得到vs本地的存储任务 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>CamId: <INPUT name=CamId5>  
           <INPUT onclick=GetVsLocalStorageTask() type=button value=获取存储任务 name=control /><br /><br />
           执行结果：<SPAN id=GetVsLocalStorageTaskResult style="PADDING-LEFT: 30px"></SPAN> </TD></TR>
        </TBODY>
      </TABLE><BR>
      
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
          <TR>
          <TD bgColor=#ebebeb>查询VS本地录像文件 </TD></TR>
          <TR bgColor=#ffffff>
          <TD>CamId: <INPUT name=CamId6><br />
              StartTime: <INPUT value="2013-04-17 08:00:00" name=vsStartTime2> 
              EndTime: <INPUT value="2013-04-18 08:59:59" name=vsEndTime2 /><br />
              <INPUT onclick=QueryVsLocalStorageFiles() type=button value=查询录像文件 name=control> 
              <INPUT onclick=QueryVsLocalStorageFilesEx() type=button value=查询录像文件(扩展) name=control><br /><br />
              执行结果：<SPAN id=QueryVsLocalStorageFilesResult 
              style="PADDING-LEFT: 30px"></SPAN> </TD></TR>
        </TBODY>
      </TABLE><BR>
      
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>前端录像回放(第一视频画面)</TD></TR>
          <TR bgColor=#ffffff>
          <TD>CamId: <INPUT name=CamId7 value=""> 
              FileName: <INPUT name=FileName2 value=""><br />
              StartTime: <INPUT value="2013-04-17 08:00:00" name=StartTime3> 
              EndTime: <INPUT value="2013-04-18 08:59:59" name=EndTime3> PlayHwnd: 
              <INPUT name=PlayHwnd value=0 /><br /><br />
	            <INPUT onclick=NetPlayBackByFile() type=button value=按文件回放 name=control> 
						  <INPUT onclick=NetPlayBackByTimes() type=button value=按时间回放 name=control> 
							<INPUT onclick=NetPlayBackStop() type=button value=停止 name=control>  
							<INPUT onclick=NetPlayBackPause() type=button value=暂停 name=control> 
							<INPUT onclick=NetPlayBackResume() type=button value=resume name=control> 
							<INPUT onclick=NetPlayGetPlayPos() type=button value=获取播放进度 name=control><br /><br />
							<input name="control" type="button" value="SetSpeed" onclick="NetSetSpeed()"> 
             	speed:<input type="text" name="NetSpeed" value="2"><br />
							<input name="control" type="button" value="SetPos" onclick="NetSetPos()"> 
							pos: <input type="text" name="NetPos" value="90"><br /><br />
              执行结果：<SPAN id=NetPlayBackByFileResult style="PADDING-LEFT: 30px"></SPAN>     		
          </TD></TR>
        </TBODY>
      </TABLE><BR>
      
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>前端录像回放(第二视频画面)</TD></TR>
          <TR bgColor=#ffffff>
          <TD>CamId: <INPUT name=CamId7Two value=""> 
              FileName: <INPUT name=FileName2Two value=""><br />
              StartTime: <INPUT value="2013-04-17 08:00:00" name=StartTime3Two> 
              EndTime: <INPUT value="2013-04-18 08:59:59" name=EndTime3Two> 
              PlayHwndTwo: <INPUT name=PlayHwndTwo value=0 /><br /><br />
	            <INPUT onclick=NetPlayBackByFileTwo() type=button value=按文件回放 name=control> 
						  <INPUT onclick=NetPlayBackByTimesTwo() type=button value=按时间回放 name=control> 
							<INPUT onclick=NetPlayBackStopTwo() type=button value=停止 name=control>  
							<INPUT onclick=NetPlayBackPauseTwo() type=button value=暂停 name=control> 
							<INPUT onclick=NetPlayBackResumeTwo() type=button value=resume name=control> 
							<INPUT onclick=NetPlayGetPlayPosTwo() type=button value=获取播放进度 name=control><br /><br />
							<input name="control" type="button" value="SetSpeed" onclick="NetSetSpeedTwo()"> 
             	speed:<input type="text" name="NetSpeedTwo" value="2"><br />
							<input name="control" type="button" value="SetPos" onclick="NetSetPosTwo()"> 
							pos: <input type="text" name="NetPosTwo" value="90"><br /><br />
              执行结果：<SPAN id=NetPlayBackByFileResultTwo style="PADDING-LEFT: 30px"></SPAN>     		
          </TD></TR>
        </TBODY>
      </TABLE><BR>
        
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>本地文件播放(第一视频画面)</TD></TR>
        	<TR bgColor=#ffffff>
          <TD>FileName: <INPUT name=FileName3 value="D:\01\01.dua"><br /><br />
	            <INPUT onclick=PlayFile() type=button value=播放本地文件 name=control> 
	            <INPUT onclick=StopFile() type=button value=停止播放本地文件 name=control> 
	            <INPUT onclick=PauseFile() type=button value=暂停播放本地文件 name=control>
	            <INPUT onclick=ResumeFile() type=button value=恢复播放本地文件 name=control><br /><BR>
	            执行结果：<SPAN id=PlayResult style="paddding-left: 30"></SPAN> 
          </TD></TR>
         </TBODY>
      </TABLE><BR>
      
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>本地文件播放(第二视频画面)</TD></TR>
        	<TR bgColor=#ffffff>
          <TD>FileName: <INPUT name=FileName3Two value="D:\01\01.dua"><br /><br />
	            <INPUT onclick=PlayFileTwo() type=button value=播放本地文件 name=control> 
	            <INPUT onclick=StopFileTwo() type=button value=停止播放本地文件 name=control> 
	            <INPUT onclick=PauseFileTwo() type=button value=暂停播放本地文件 name=control>
	            <INPUT onclick=ResumeFileTwo() type=button value=恢复播放本地文件 name=control><br /><BR>
	            执行结果：<SPAN id=PlayResultTwo style="paddding-left: 30"></SPAN> 
          </TD></TR>
         </TBODY>
      </TABLE><BR>
        
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
          <TR>
           <TD bgColor=#ebebeb>截图 </TD>
           </TR>
              <TR bgColor=#ffffff>
              <TD>SnapShotStorePath: <INPUT name=snapPathTxt>
              <INPUT onclick=SetSnapFilePath() type=button value=设置文件存储路径 name=control><br /><br />
              <INPUT onclick=SnapShot() type=button value=快照 name=control> <BR><br />
              执行结果：<SPAN id=snapResult style="paddding-left: 30"></SPAN> 
           </TD>
         </TR>
        </TBODY>
      </TABLE><BR>

      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#ebebeb>获取版本号</TD></TR>
          <TR bgColor=#ffffff>
          <TD><INPUT onclick=GetVersion() type=button value=获取版本号 name=control /><BR><br />
		      未转化版本号：<SPAN id=GetVersionSpan style="paddding-left: 30"></SPAN><br />
              版本号：<SPAN id=versionResult style="paddding-left: 30"></SPAN> 
			  
        </TD></TR>
       </TBODY>
     </TABLE><BR>
        
     <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>获取错误信息</TD></TR>
          <TR bgColor=#ffffff>
          <TD><INPUT onclick=GetLastErrorMessage() type=button value=获取错误信息 name=control /><BR><br />
              执行结果：<SPAN id=errorResult style="paddding-left: 30"></SPAN> 
          </TD></TR>
        </TBODY>
      </TABLE><BR>
        
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
          <TR>
          <TD bgColor=#ebebeb>修改密码</TD></TR>
          <TR bgColor=#ffffff>
          <TD>
              旧密码: <INPUT name=oldPwdTxt><br />
              新密码: <INPUT name=newPwdTxt /><br /><br />
              <INPUT onclick=ChangePassword() type=button value=修改密码 name=control><BR><br />
              执行结果：<SPAN  id=pwdResult style="paddding-left: 30"></SPAN> 
          </TD></TR>
         </TBODY>
      </TABLE><BR>
        
     <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
       <TBODY>
        <TR>
          <TD bgColor=#ebebeb>获取SessionID</TD></TR>
          <TR bgColor=#ffffff>
          <TD><INPUT onclick=GetSessionId() type=button value=获取SessionID name=control />
              <BR><br />
              执行结果：<SPAN id=sessionIdResult style="paddding-left: 30"></SPAN> 
          </TD></TR>
       </TBODY>
     </TABLE><BR>
        
     <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#ebebeb>获取地区列表</TD></TR>
          <TR bgColor=#ffffff>        
          <TD>
           <INPUT onclick=GetAreaList() type=button value=获取地区列表 name=control /><BR><br />
            执行结果：<SPAN id=areaResult style="paddding-left: 30"></SPAN> 
        </TD>
        </TR>
       </TBODY>
      </TABLE><BR>
        
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#ebebeb>获取AH列表</TD></TR>
          <TR bgColor=#ffffff>        
          <TD>地区ID:<INPUT name=areaidtxt>
            <INPUT onclick=GetAreaSubAH() type=button value=获取地区下AH name=control /><BR><br />
            执行结果：<SPAN id=ahresult style="paddding-left: 30"></SPAN> 
          </TD></TR>
        </TBODY>
      </TABLE><BR>
        
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
        <TBODY>
         <TR>
          <TD bgColor=#ebebeb>获取地区下摄像头列表</TD></TR>
          <TR bgColor=#ffffff>        
          <TD>
             地区ID:<INPUT name=areaidcamtxt>
             <INPUT onclick=GetAreaSubCameraList() type=button value=获取摄像头列表 name=control /><BR><br />
             执行结果：<SPAN id=areaCamResult style="paddding-left: 30"></SPAN> 
         </TD>
         </TR>
        </TBODY>
      </TABLE><BR>
        
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#000000 border=0>
         <TBODY>
           <TR>
            <TD bgColor=#ebebeb>语音对讲和广播</TD></TR>
            <TR bgColor=#ffffff>
            <TD>
              模式1：CamId(广播时,多个id以逗号分开): <INPUT value=892ABAAB8B2D9B0D413EB05F1FAA5CEF name=txtTalkCamId><br />
              <INPUT onclick=StartSpeekByCam() type=button value=开始对讲 name=control> &nbsp;<br />
              <INPUT onclick=StartSpeekBroadcastByCam() type=button value=开始广播 name=control2><br />
              模式2：VsId(广播时,多个id以逗号分开): <INPUT value=ECEAE73881FBC70D741C42EC1532FD7A name=txtTalkVsId><br />
              <INPUT onclick=StartSpeekByVs() type=button value=开始对讲 name=control> &nbsp;<BR>
              <INPUT onclick=StartSpeekBroadcastByVs() type=button value=开始广播 name=control3><br /><br />
              <INPUT onclick=StopSpeek() type=button value=停止对讲/广播 name=control1/><br /><br />
              执行结果：<SPAN id=ResultTalk style="paddding-left: 30"></SPAN> 
              </TD></TR>
         </TBODY>
       </TABLE><BR>
     
       </TD></TR>
      </TBODY>
    </TABLE>
		
<!-- 
<script language="javascript">
function window.onunload()
{
	try
	{
		Logout();
	}
	catch(e)
	{
	}
}
</script> 
-->
   </BODY>
</HTML>
        
       