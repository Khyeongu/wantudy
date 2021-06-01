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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/chatting/chat.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>

<script type="text/javascript">
	var now_time;
	var ws;
	wsOpen();

	function wsOpen() {
		ws = new WebSocket("ws://localhost/wantudy/chat");
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
		}

		ws.onmessage = function(data) {
			var all = JSON.parse(data.data);
			var member_no = all.member_no;
			var userno = $('#userNo').val();
			var username = $('#userName').val();
			
			var msg = all.msg;
			var cmd = all.cmd;
			var time = new Date().toLocaleTimeString();

			if (cmd == "Enter") {

			} else {
				if (member_no == userno) {
					var str = "<div class='mychattinglogcontainer'>";
					str += "<div class='chattinglogtime'>"
					str += time;
					str += "</div>";
					str += "<div class='chattinglogcontent'>"
					str += msg;
					str += "</div>";
					str += "<div class='chattinglogname'>"
					str += username;
					str += "</div>";
					str += "</div>";
					$("#chattingloglistcontainer").append(str);
				} else {
					var str = "<div class='chattinglogcontainer'>";
					str += "<div class='chattinglogtime'>"
					str += time;
					str += "</div>";
					str += "<div class='chattinglogname'>"
					str += member_no;
					str += ":</div>";
					str += "<div class='chattinglogcontent'>"
					str += msg;
					str += "</div>";
					str += "</div>";
					$("#chattingloglistcontainer").append(str);
				}

			}
			
		}

		ws.onclose = function(data) {
			wsOpen();
		};

		document.addEventListener("keypress", function(e) {
			var message = $('#chatting').val();
			if (e.keyCode == 13) { //enter press
				if (message != "") {
					insertChattinglog();
					sendChat();
				}

			}
		});
	}

	//입장 시
	function sendEnter() {
		var message = $('#chatting').val();
		var cmd = 'Enter';
		send(message, cmd);
		$('#chatting').val("");
	}
	//메세지 보낼 시
	function sendChat() {
		var message = $('#chatting').val();
		console.log("send누르고" + message);
		var cmd = 'Send';
		if(message!=''){
			send(message, cmd);
			$('#chatting').val("");
		}

	}

	//메세지 전송 시 chattinglog 기록
	function insertChattinglog() {
		var message = $('#chatting').val();
		var study_no = $('.nowstudy_no').val();
		var uN = $('#userNo').val();
		now_time = new Date().toLocaleTimeString();

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chatting/insertlog',
			data : {
				"study_no" : study_no,
				"content" : message,
				"member_no" : uN
			},
			success : function(data) {
				alert("채팅로그를 저장했습니다.");

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})

	}

	//message send
	function send(msg, cmd) {
		var uN = $('#userNo').val();
		var study_no = $('.nowstudy_no').val();
		console.log("send보내기" + uN + study_no);
		console.log("msg:" + msg + "cmd:" + cmd);
		var msgData = {
			study_no : study_no,
			member_no : uN,
			msg : msg,
			cmd : cmd
		};
		var jsonData = JSON.stringify(msgData);
		ws.send(jsonData);
		$('#chatting').val("");
	}

	var now_time ;
	var formal_year ;
	var formal_month;
	var formal_day ;
	var endNo;
	var last_data_no;
	var isScrolled = false;
	var isEnd = false;

	function getStudyNo(study) {

		var study_no = $(study).data("value");

		now_time = new Date();
		formal_year = now_time.getFullYear();
		formal_month = now_time.getMonth() + 1;
		formal_day = now_time.getDate();
		
		endNo = 0;
		isScrolled = false;
		isEnd = false;
		if($('.nowstudy_no').val() == ''){
			
		}

		if ($('.nowstudy_no').val() != study_no) {
			$('.nowstudy_no').val(study_no);
			$('#chattingloglistcontainer').text('');

			console.log("처음 endNO:" + endNo);

			//websocket끊었다 다시연결
			
			//입장
			sendEnter();

			
			$.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/chatting/getlog',
						data : {
							"study_no" : study_no,
							"endNo" : endNo
						},
						datatype : "json",
						async : false,
						success : function(data) {
							alert("채팅로그를 불러왔습니다.");

							console.log(data.chattingloglist);

							var length = data.chattingloglist.length;

							if (length < 10) {
								isEnd = true;
							}else{
								last_data_no = data.chattingloglist[0].no;
							}



							for (var i = 0; i < length; i++) {
								
								var content = data.chattingloglist[i].content;
								var chattinglogno = data.chattingloglist[i].no;
								var time = new Date(
										data.chattingloglist[i].time);
								var message_year = time.getFullYear();

								var message_month = time.getMonth() + 1;

								var message_day = time.getDate();

								var message_time = time.toLocaleTimeString();

								if (message_year == formal_year) {
									//이전 월과 같을때
									if (formal_month == message_month) {
										if (formal_day != message_day) {
											//월,일 시간출력
											var str = "<div class='chattinglogdate'>"
											str += formal_month + "월 "
													+ formal_day + "일";
											str += "</div>"
											$("#chattingloglistcontainer")
													.prepend(str);
										}
									} else {
										//월,일
										var str = "<div class='chattinglogdate'>"
										str += formal_month + "월 " + formal_day
												+ "일";
										str += "</div>"
										$("#chattingloglistcontainer").prepend(
												str);
									}
									//년도 다를때
								} else {
									//년,월,일 출력
									var str = "<div class='chattinglogdate'>"
									str += formal_year + "년 " + formal_month
											+ "월 " + formal_day + "일";
									str += "</div>"
									$("#chattingloglistcontainer").prepend(str);
								}
								formal_year = message_year;
								formal_month = message_month;
								formal_day = message_day;

								var member_no = data.chattingloglist[i].member_no;
								var userno = $('#userNo').val();
								var username = $('#userName').val()

								if (member_no != userno) {
									var str = "<div class='chattinglogcontainer' data-no='"+chattinglogno+"'>";
									str += "<div class='chattinglogname'>"
									str += member_no;
									str += ":</div>";
									str += "<div class='chattinglogcontent'>"
									str += content;
									str += "</div>";
									str += "<div class='chattinglogtime'>"
									str += message_time;
									str += "</div>";
									str += "</div>";
								} else {
									var str = "<div class='chattinglogcontainer mylog' data-no='"+chattinglogno+"'>";
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

								$("#chattingloglistcontainer").prepend(str);
							}

							if(!isEnd){
								var position = $('.chattinglogcontainer').offset().top;

								document.querySelector('.chattingloglistcontainer')
										.scrollTo({
											top : position,
											behavior : 'auto'
										});
							}


						},
						error : function() {
							alert("로그 불러오기 실패.");
						}
					})
		}

	}
	
	


	function logscroll() {

		var scrollTop = $('.chattingloglistcontainer').scrollTop();

		
		console.log("isScrolled:"+isScrolled);
		
		if (scrollTop < 1 && isScrolled == false) {
			isScrolled = true;
			fetchList();
		}

	};

	function fetchList() {
		console.log("fetchlist호출");
		if (isEnd == true) {
			var str = "<div class='chattinglogdate'>"
				str += formal_month + "월 "
						+ formal_day + "일";
				str += "</div>"
				$("#chattingloglistcontainer")
						.prepend(str);
			return;
		}

		endNo += 10;

		console.log("endNo" + endNo);

		var study_no = $('.nowstudy_no').val();
		
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/chatting/getlog',
					data : {
						"study_no" : study_no,
						"endNo" : endNo
					},
					datatype : "json",
					async : false,
					success : function(data) {
						alert("채팅로그를 불러왔습니다.");

						var length = data.chattingloglist.length;

						if (length < 10) {
							isEnd = true;
						}

						last_data_no = data.chattingloglist[0].no;

						for (var i = 0; i < length; i++) {
							var content = data.chattingloglist[i].content;
							var chattinglogno = data.chattingloglist[i].no;
							var time = new Date(
									data.chattingloglist[i].time);
							var message_year = time.getFullYear();

							var message_month = time.getMonth() + 1;

							var message_day = time.getDate();

							var message_time = time.toLocaleTimeString();

							if (message_year == formal_year) {
								//이전 월과 같을때
								if (formal_month == message_month) {
									if (formal_day != message_day) {
										//월,일 시간출력
										var str = "<div class='chattinglogdate'>"
										str += formal_month + "월 "
												+ formal_day + "일";
										str += "</div>"
										$("#chattingloglistcontainer")
												.prepend(str);
									}
								} else {
									//월,일
									var str = "<div class='chattinglogdate'>"
									str += formal_month + "월 " + formal_day
											+ "일";
									str += "</div>"
									$("#chattingloglistcontainer").prepend(
											str);
								}
								//년도 다를때
							} else {
								//년,월,일 출력
								var str = "<div class='chattinglogdate'>"
								str += formal_year + "년 " + formal_month
										+ "월 " + formal_day + "일";
								str += "</div>"
								$("#chattingloglistcontainer").prepend(str);
							}
							formal_year = message_year;
							formal_month = message_month;
							formal_day = message_day;

							var member_no = data.chattingloglist[i].member_no;
							var userno = $('#userNo').val();
							var username = $('#userName').val()

							if (member_no != userno) {
								var str = "<div class='chattinglogcontainer' data-no='"+chattinglogno+"'>";
								str += "<div class='chattinglogname'>"
								str += member_no;
								str += ":</div>";
								str += "<div class='chattinglogcontent'>"
								str += content;
								str += "</div>";
								str += "<div class='chattinglogtime'>"
								str += message_time;
								str += "</div>";
								str += "</div>";
							} else {
								var str = "<div class='chattinglogcontainer mylog' data-no='"+chattinglogno+"'>";
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

							$("#chattingloglistcontainer").prepend(str);
						}

						var position = $(
								'.chattinglogcontainer[data-no='
										+ last_data_no + ']').offset().top;

						console.log("last_data_no:" + last_data_no);

						console.log("position:" + position);

						document.querySelector('.chattingloglistcontainer')
								.scrollTo({
									top : position,
									behavior : 'auto'
								});

						isScrolled = false;

					},
					error : function() {
						alert("로그 불러오기 실패.");
					}
				});

	}
</script>

<body>
	<div id="container" class="container">
		<h1>채팅</h1>
		<div class="innercontainer">
			<div class="studylistcontainer">
				<input class="nowstudy_no" type="hidden" name="nowstudy_no" value="">
				<c:forEach var="studylist" items="${studylist}">
					<div class="studycontainer" data-value="${studylist.no}"
						onClick="getStudyNo(this)">${studylist.name}</div>

				</c:forEach>
			</div>
			<div class="chattingcontainer">
				<div id="chattingloglistcontainer" class="chattingloglistcontainer" onscroll="logscroll()">
				</div>
				<input type="hidden" id="userName"
					value="<%=((MemberDTO) session.getAttribute("userInfo")).getName()%>">
				<input type="hidden" id="userNo"
					value="<%=((MemberDTO) session.getAttribute("userInfo")).getNo()%>">

				<div id="yourMsg">
					<table class="inputTable">
						<tr>
							<th>메시지</th>
							<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
							<th><button onclick="insertChattinglog(); sendChat();"
									id="sendBtn">보내기</button></th>
						</tr>
					</table>
				</div>
			</div>

		</div>

	</div>
</body>
</html>