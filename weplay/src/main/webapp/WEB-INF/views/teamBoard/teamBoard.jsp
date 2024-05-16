<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
#login-form {
	background-color: cyan;
	padding-top: 10px;
	top: 40%;
	width: 80%;
	margin: auto;
	margin-top: 20%;
}

.outer {
	width: 80%;
	margin: auto;
	padding-bottom: 5%;
	padding-top: 2%;
	background-color: white;
	overflow: hidden; /* 부모 요소의 높이를 자식 요소에 맞추기 위해 사용 */
}

#boardList-area {
	float: left;
	width: 30%;
	border-right: 1px solid black; /* 세로 줄 스타일 지정 */
	padding-right: 10px; /* 원하는 간격 조정 */
	padding-left: 20px;
}

#reply-area {
	float: right;
	width: 70%;

}

#teamBoardName {
	resize: none; /* 사용자가 크기를 조절할 수 없도록 함 */
	width: 90%;
	height : 30px;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div class="outer">


		<!-- 여기는 ajax할필요없음 -->
		<div id="boardList-area" align="center">
			<table>
				<thead>
					<tr>
						<td><textarea id="teamBoardName"></textarea></td>
						<td><button class="btn btn-sm btn-primary">등록</button></td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="2">현재 게시판없어요.😢</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="teamBoardBrg" items="${list}">
								<tr>
									<td>${ teamBoardBrg.boardName }</td>
									<td>❌</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!-- 
					<tr>
						<td>자유게시판</td>
						<td><a href="">❌</a></td>
					</tr>
					<tr>
						<td>유머게시판</td>
						<td>❌</td>
					</tr>
						<td>수다게시판</td>
						<td>❌</td>
					<tr>	
						<td>신고게시판</td>
						<td>❌</td>
					</tr> -->

				</tbody>
			</table>
		</div>

		<div id="reply-area">

			<table border="1" align="center">
				<thead>
					<tr>
						<th>${ loginUser.nickName }</th>
						<c:choose>
							<c:when test="${not empty sessionScope.loginUser }">
								<td><textarea id="replyContent" cols="50" rows="3"
										style="resize: none;"></textarea></td>
								<td><button onclick="">글 등록</button></td>
							</c:when>
							<c:otherwise>
								<td><textarea readonly cols="50" rows="3"
										style="resize: none;">로그인 후 이용가능한 서비스입니다.</textarea></td>
								<td><button class="btn btn-sm btn-primary">글 등록</button></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<br> <br> <br> <br>
		</div>

	</div>


</body>
</html>