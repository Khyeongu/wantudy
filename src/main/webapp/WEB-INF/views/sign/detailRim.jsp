<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="moviedto" value="${movie}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/detail.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		 $('input[type="checkbox"][name="category"]').click(function(){
			 
			  if($(this).prop('checked')){
			 
			     $('input[type="checkbox"][name="category"]').prop('checked',false);
			 
			     $(this).prop('checked',true);
			 
			    }
			  
			});
		 
		 $('.category2').click(function(){
			 if($(this).is(":checked")==true){
				 $('.commentcontainer').each(function(){
						if($(this).data("value")==="spoiler"){
							$(this).css("display","block");
						} else{
							$(this).css("display","none");
						}
					 });
						 
			 }else{
				 $('.commentcontainer').each(function(){
						if($(this).data("value")==="spoiler"){
							$(this).css("display","none");
						} else{
							$(this).css("display","block");
						}
					 });
			 }

			 
			 
			});
		 
		 
		 $('.spoilerdeletebutton').click(function(){
			 var member_id = $(".spoilermember_id").val();
			 var category = $(".spoilercategory").val();
			 var movie_id = $(".movieid").val();
			 
			 $.ajax({
				 type:'POST',
				 url:'${pageContext.request.contextPath}/Commentdelete',
				 data:{
					 "member_id":member_id,
					 "category":category,
					 "movie_id":movie_id
				 },
				 success:function(data){
					 alert("삭제되었습니다.");
					 location.href='${pageContext.request.contextPath}/searchAction';
				 },error:function(){
					 alert("삭제 실패.");
				 }
			 })
			});
		 $('.spoilereditbutton').click(function(){
			 var member_id = $(".spoilermember_id").val();
			 var category = $(".spoilercategory").val();
			 var movie_id = $(".movieid").val();
			 var content = $(".spoilercontent").val();
			 
			 
			 $.ajax({
				 type:'POST',
				 url:'${pageContext.request.contextPath}/Commentedit',
				 data:{
					 "member_id":member_id,
					 "category":category,
					 "movie_id":movie_id,
					 "content":content
				 },
				 success:function(data){
					 alert("수정되었습니다.");
					 location.href='${pageContext.request.contextPath}/searchAction';
				 },error:function(){
					 alert("수정 실패.");
				 }
			 })
			});
		 
		 $('.reviewdeletebutton').click(function(){
			 var member_id = $(".reviewmember_id").val();
			 var category = $(".reviewcategory").val();
			 var movie_id = $(".movieid").val();
			 
			 $.ajax({
				 type:'POST',
				 url:'${pageContext.request.contextPath}/Commentdelete',
				 data:{
					 "member_id":member_id,
					 "category":category,
					 "movie_id":movie_id
				 },
				 success:function(data){
					 alert("삭제되었습니다.");
					 location.href='${pageContext.request.contextPath}/searchAction';
				 },error:function(){
					 alert("삭제 실패.");
				 }
			 })
			});
		 
		 $('.revieweditbutton').click(function(){
			 var member_id = $(".reviewmember_id").val();
			 var category = $(".reviewcategory").val();
			 var movie_id = $(".movieid").val();
			 var content = $(".reviewcontent").val();
			 
			 
			 $.ajax({
				 type:'POST',
				 url:'${pageContext.request.contextPath}/Commentedit',
				 data:{
					 "member_id":member_id,
					 "category":category,
					 "movie_id":movie_id,
					 "content":content
				 },
				 success:function(data){
					 alert("수정되었습니다.");
					 location.href='${pageContext.request.contextPath}/searchAction';
				 },error:function(){
					 alert("수정 실패.");
				 }
			 })
			});
	});
	
</script>
</head>
<body>
<%String userid = (String)session.getAttribute("userid"); %>
<c:set var="userid" value="<%=userid%>"/>
<div class="container">
	<div class="innercontainer">
		<div class="leftcontainer">
			<div class="movieposter">
				<img class="poster" src="${pageContext.request.contextPath}/resources/img/${moviedto.imagepath}">
			</div>
			<div class="movietitle">
				<%String title = (String)session.getAttribute("title");
				Long movie_id = (Long)session.getAttribute("movieid");
				%>
				<input type="hidden" class="movieid" value="<%=movie_id%>">
				${title}
			</div>
		</div>
		<div class="rightcontainer">
			<div class="formcontainer">
				<form action="${pageContext.request.contextPath}/CommentInsert" method="POST" >
					<div class="mycommentdisc">
						나의 리뷰 작성 (${userid} 님) 
					</div>
				
					<div class="spoilercheck">
						<div class="check1">
							<input type="checkbox" name="category" value="spoiler">spoiler
						</div>
						<div class="check2">
							<input type="checkbox" name="category" value="review">review
						</div>
					</div>
			

					<div class="mycomment">
						<div class="inputcommentcontainer">
							<textarea placeholder="리뷰를 입력하세요" name="content" class="inputcomment"></textarea>
						</div>
					</div>
					<div class="confirmbutton">
						<input type="submit" value="등록" class="buttonconfirm">
					</div>
				</form>
			</div>
			

			<div class="commentlistcontainer">
				<div class="commentlistdesc">
					리뷰보기
				</div>
				<div class="otherspoilercheck">
					<div class="check1">
						<input type="checkbox" class="category2" name="category2" value="spoiler">spoiler
					</div>

				</div>
				<div class="commentcontenlistcontainer">
				<c:forEach var="commentdto" items="${comment}">
					<c:choose>
					<c:when  test="${commentdto.category eq 'spoiler'}">
					<c:if test="${commentdto.member_id eq userid}">

					<div class="commentcontainer" data-value="${commentdto.category}" style="display:none;">
					<input class="spoilercategory" name="category" type="hidden" value="${commentdto.category}">
					<input class="spoilermember_id" name="member_id" type ="hidden" value="${commentdto.member_id}">
						<div class="commentuser">
							${commentdto.member_id}
						</div>
						<div class="commentcontentcontainer">
							<div class="commentcontent">
								<textarea name="content"  class="commentcontenttext spoilercontent">${commentdto.content}</textarea>
							</div>
						</div>
						
						<div class="commentbutton">
							<div class="commentedit">
								<button class="spoilereditbutton" value="edit">수정</button>
							</div>
							<div class="commentdelete">
								<button  class="spoilerdeletebutton" value="delete">삭제</button>
							</div>
						</div>
						
					</div>

					</c:if>
					</c:when>
					
					<c:otherwise>

					<c:if test="${commentdto.member_id eq userid}">

					<div class="commentcontainer" data-value="${commentdto.category}" >
						<input class="reviewcategory" name="category" type="hidden" value="${commentdto.category}">
						<input class="reviewmember_id" name="member_id" type ="hidden" value="${commentdto.member_id}">
						<div class="commentuser">
							${commentdto.member_id}
						</div>
						<div class="commentcontentcontainer">
							<div class="commentcontent">
								<textarea name="content"  class="commentcontenttext reviewcontent">${commentdto.content}</textarea>
							</div>
							
						</div>
						
						<div class="commentbutton">
							
							<div class="commentedit">
								<button class="revieweditbutton" value="edit">수정</button>
							</div>
							<div class="commentdelete">
								<button class="reviewdeletebutton" value="delete">삭제</button>
							</div>
							
						</div>
					</div>

					</c:if>

					</c:otherwise>

					</c:choose>

					</c:forEach>
					
					
					
					<c:forEach var="commentdto" items="${comment}">
					<c:choose>
					<c:when  test="${commentdto.category eq 'spoiler'}">
					<c:if test="${commentdto.member_id ne userid}">
					<div class="commentcontainer" data-value="${commentdto.category}" style="display:none;">
						<div class="commentuser">
							${commentdto.member_id}
						</div>
						<div class="commentcontentcontainer">
							<div class="commentcontent">
								${commentdto.content}
							</div>
						</div>
					</div>
					</c:if>
					</c:when>
					
					<c:otherwise>

					<c:if test="${commentdto.member_id ne userid}">
						<div class="commentcontainer" data-value="${commentdto.category}" >
						<div class="commentuser">
							${commentdto.member_id}
						</div>
						<div class="commentcontentcontainer">
							<div class="commentcontent">
								${commentdto.content}
							</div>
						</div>
					</div>
					</c:if>

					</c:otherwise>

					</c:choose>

					</c:forEach>
				</div>

			</div>
		</div>
	</div>

</div>
</body>
</html>