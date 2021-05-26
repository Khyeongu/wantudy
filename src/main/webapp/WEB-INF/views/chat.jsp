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
<!-- 
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
		ws.send(uN+" : "+msg);
		$('#chatting').val("");
	}
</script>
-->
<body>
	<div id="container" class="container">
		<h1>채팅</h1>
		<div class="innercontainer">
			<div class="studylistcontainer">
			<c:forEach var="studylist" items="${studylist}">
				<div class="studycontainer" data-value="${studylist.no}">
					${studylist.name}
				</div>

			</c:forEach>
			</div>
			<div class="chattingcontainer">
				<div id="chating" class="chating"></div>
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