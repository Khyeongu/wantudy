<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chatting/chat.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>

<script type="text/javascript">

	var ws;
	wsOpen();

	function wsOpen(){
		ws = new WebSocket("ws://localhost/wantudy/chat");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var all = JSON.parse(data.data);
			var member_no = all.member_no;
			var userno = $('#userNo').val();
			var username = $('#userName').val();
			var msg = all.msg; 
			var cmd = all.cmd;
			console.log(msg);
			console.log("받아온msg:"+msg);
			if(cmd == "Enter"){
				var str = "<div class='enterchattinglogcontainer'>";
				 str += "<div class='chattinglogname'>"
				 str += username;
				 str += "</div>";
				 str += "<div class='chattinglogcontent'>"
				 str += msg;
				 str += "</div>";
				str += "</div>";
				$("#chattingloglistcontainer").append(str);
			}
			else{
				if(member_no == userno ){
					var str = "<div class='mychattinglogcontainer'>";
					 str += "<div class='chattinglogcontent'>"
					 str += msg;
					 str += "</div>";
					 str += "<div class='chattinglogname'>"
					 str += username;
					 str += "</div>";
					 str += "</div>";
				}
				else{
					var str = "<div class='chattinglogcontainer'>";
					 str += "<div class='chattinglogname'>"
					 str += username;
					 str += ":</div>";
					 str += "<div class='chattinglogcontent'>"
					 str += msg;
					 str += "</div>";
					 str += "</div>";

				}

				$("#chattingloglistcontainer").append(str);
			}

		}
		
		ws.onclose = function(data){
			wsOpen();
		};


		document.addEventListener("keypress", function(e){
			var message = $('#chatting').val();
			if(e.keyCode == 13){ //enter press
				if(message != ""){
					sendChat();
				}

			}
		});
	}
	
	//입장 시
	function sendEnter(){
		var message = $('#chatting').val();
		var cmd = 'Enter';
		send(message,cmd);
		$('#chatting').val("");
	}
	//메세지 보낼 시
	function sendChat(){
		var message = $('#chatting').val();
		console.log("send누르고"+message);
		var cmd = 'Send';
		send(message,cmd);
		$('#chatting').val("");
	}
	
	//메세지 전송 시 chattinglog 기록
	function insertChattinglog(){
		var message = $('#chatting').val();
		var study_no = $('.nowstudy_no').val();
		var uN = $('#userNo').val();
		
		$.ajax({
			 type:'POST',
			 url:'${pageContext.request.contextPath}/chatting/insertlog',
			 data:{
				 "study_no":study_no,
				 "content":message,
				 "member_no":uN
			 },
			 success:function(data){
				 alert("채팅로그를 저장했습니다.");
				 
			 },error:function(request,status,error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 }
		 })
		
	}


	//message send
	function send(msg,cmd) {
		var uN = $('#userNo').val();
		var study_no = $('.nowstudy_no').val();
		console.log("send보내기"+uN+study_no);
		console.log("msg:"+msg+"cmd:"+cmd);
		var msgData={
				study_no:study_no,
				member_no:uN,
				msg:msg,
				cmd:cmd
		};
		var jsonData = JSON.stringify(msgData);
		ws.send(jsonData);
		$('#chatting').val("");
	}
	
	


	function getStudyNo(study){
		var study_no = $(study).data("value");
		
		
		if($('.nowstudy_no').val()!=study_no){
			$('.nowstudy_no').val(study_no);
			$('#chattingloglistcontainer').text('');
		
	
		
			//입장
			sendEnter();
			
			$.ajax({
				 type:'POST',
				 url:'${pageContext.request.contextPath}/chatting/getlog',
				 data:{
					 "study_no":study_no
				 },
				 datatype:"json",
				 async:false,
				 success:function(data){
					 alert("채팅로그를 불러왔습니다.");
					 console.log(data.chattingloglist);
					 var formal_year ='';
					 var formal_month = '';
					 var formal_day = '';
					 
					 for(var i = 0; i<data.chattingloglist.length; i++){
						 var content = data.chattingloglist[i].content;
						 var time = new Date(data.chattingloglist[i].time);
						 var message_year = time.getFullYear();
						 var now_year = new Date().getFullYear();

						 var message_month = time.getMonth()+1;

						 var message_day = time.getDate();

						 var message_time = time.toLocaleTimeString();
						 
				
						 if(message_year==formal_year){
							 //이전 월과 같을때
							 if(formal_month==message_month){
								 if(formal_day!=message_day){
									 //월,일 시간출력
									 var str = "<div class='chattinglogdate'>"
									 str += message_month+"월 "+message_day+"일";
									 str += "</div>"
									 $("#chattingloglistcontainer").append(str);
								 }
							 }else{
								 //월,일
								 var str = "<div class='chattinglogdate'>"
								 str += message_month+"월 "+message_day+"일";
								 str += "</div>"
								 $("#chattingloglistcontainer").append(str);
							 }
						//년도 다를때
						 }else{
							 //년,월,일 출력
							 var str = "<div class='chattinglogdate'>"
							 str += message_year+"년 "+message_month+"월 "+message_day+"일";
							 str += "</div>"
							 $("#chattingloglistcontainer").append(str);
						 }
						 formal_year = message_year;
						 formal_month = message_month;
						 formal_day = message_day;
				
						 

						 var member_no = data.chattingloglist[i].member_no;
						 var userno = $('#userNo').val();
						 var username = $('#userName').val()
						 
						 if(member_no!=userno){
							 var str = "<div class='chattinglogcontainer'>";
							 str += "<div class='chattinglogname'>"
							 str += username;
							 str += ":</div>";
							 str += "<div class='chattinglogcontent'>"
							 str += content;
							 str += "</div>";
							 str += "<div class='chattinglogtime'>"
							 str += message_time;
							 str += "</div>";
							 str += "</div>";
						 }
						 else{
							 var str = "<div class='chattinglogcontainer mylog'>";
							 str += "<div class='chattinglogtime'>"
							 str += message_time;
							 str += "</div>";
							 str += "<div class='chattinglogcontent'>"
							 str += content;
							 str += "</div>";
							 str += "<div class='chattinglogname'>"
							 str += username;
							 str += "</div>";
							 str += "</div>";
						 }
						 

						 $("#chattingloglistcontainer").append(str);
					 }
					
					 
					 
				 },error:function(){
					 alert("로그 불러오기 실패.");
				 }
			 })
		}

		

	}
	

</script>

<body>
	<div id="container" class="container">
		<h1>채팅</h1>
		<div class="innercontainer">
			<div class="studylistcontainer">
			<input class="nowstudy_no" type="hidden" name="nowstudy_no" value="">
			<c:forEach var="studylist" items="${studylist}">
				<div class="studycontainer" data-value="${studylist.no}" onClick="getStudyNo(this)" >
					${studylist.name}
				</div>

			</c:forEach>
			</div>
			<div class="chattingcontainer">
				<div id="chattingloglistcontainer" class="chattingloglistcontainer">
				</div>
				<input type="hidden" id="userName"
					value="<%=((MemberDTO)session.getAttribute("userInfo")).getName()%>">
				<input type="hidden" id="userNo"
					value="<%=((MemberDTO)session.getAttribute("userInfo")).getNo()%>">
				
				<div id="yourMsg">
					<table class="inputTable">
						<tr>
							<th>메시지</th>
							<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
							<th><button onclick="insertChattinglog(); sendChat();" id="sendBtn">보내기</button></th>
						</tr>
					</table>
				</div>
			</div>

		</div>

	</div>
</body>
</html>