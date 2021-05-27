<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!--
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
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				$("#chating").append("<p>" + msg + "</p>");
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}



	function send() {
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		
		var msgData={
				study_no:study_no,
				member_no:uN,
				msg:msg
		};
		var jsonData = JSON.stringify(msgData);
		ws.send(jsonData);
		$('#chatting').val("");
	}
	-->
	function getStudyNo(study){
		var study_no = $(study).data("value");

		
		if($('.nowstudy_no').val()!=study_no){
			$('.nowstudy_no').val(study_no);
			$('#chattingloglistcontainer').text('');
			
			
			
			//ws.open
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
					 
					 for(var i = 0; i<data.chattingloglist.length; i++){
						 var content = data.chattingloglist[i].content;
						 var time = data.chattingloglist[i].time;
						 var member_no = data.chattingloglist[i].member_no;
						 var username = $('#userName').val();
						 
						 if(member_no!=username){
							 var str = "<div class='chattinglogcontainer'>";
							 str += "<div class='chattinglogname'>"
							 str += member_no;
							 str += ":</div>";
							 str += "<div class='chattinglogcontent'>"
							 str += content;
							 str += "</div>";
							 str += "<div class='chattinglogtime'>"
							 str += time;
							 str += "</div>";
							 str += "</div>";
						 }
						 else{
							 var str = "<div class='chattinglogcontainer mylog'>";
							 str += "<div class='chattinglogtime'>"
							 str += time;
							 str += "</div>";
							 str += "<div class='chattinglogname'>"
							 str += member_no;
							 str += ":</div>";
							 str += "<div class='chattinglogcontent'>"
							 str += content;
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
					value="<%=session.getAttribute("member_no")%>">
				<div id="yourMsg">
					<table class="inputTable">
						<tr>
							<th>메시지</th>
							<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
							<th><button onclick="send()" id="sendBtn">보내기</button></th>
						</tr>
					</table>
				</div>
			</div>

		</div>

	</div>
</body>
</html>