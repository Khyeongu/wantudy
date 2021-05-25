<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chatting/chattingmain.css"/>
<script type="text/javascript">
	$(document).ready(function(){
		alert("hi");
		
		$("#buttonsubmit").on("click",function(e){
			var msg = document.getElementById("inputcontent");
			stomp.send('/pub/chat/message',{},JSON.stringify({study_no:study_no,message:msg.value, writer:member_no}));
			msg.value='';
		});
	});
	

</script>
</head>
<body>
	<div class="container">
		<div class="innercontainer">
		<input type="hidden" value="<%=(String)session.getAttribute("member_no")%>">
			<div class="studylistcontainer">
				<c:forEach var="studylist" items="${studylist}">
				<div class="studycontainer" data-value="${studylist.no}">
					${studylist.name}
				</div>

				</c:forEach>
			</div>
			<div class="chattingcontainer">
				<div class="chattinglogcontainer">
				</div>
				<div class="inputcontainer">
					<div class="contentcontainer">
						<input type="text" name="content" id="inputcontent">
					</div>
					<div class="submitcontainer">
						<input type="submit" id="buttonsubmit">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>