<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<style>
#login-form {
	background-color: cyan;
	padding-top: 10px;
	top: 40%;
	width: 80%;
	margin: auto;
	margin-top: 20%;
}

.container {
 width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 2%;
            background-color: white;
    overflow: hidden; /* 부모 요소의 높이를 자식 요소에 맞추기 위해 사용 */
}

#boardList-area {
    float: left; /* 왼쪽으로 부유시킴 */
    width: 30%; /* 전체 너비의 50%를 차지하도록 설정 */
    /* 원하는 스타일 추가 */
}

#reply-area {
    float: right; /* 오른쪽으로 부유시킴 */
    width: 70%; /* 전체 너비의 50%를 차지하도록 설정 */
    /* 원하는 스타일 추가 */
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div class="outer">
		<div id="boardList-area">
			<div>12132</div>
			<div>12321</div>
			<div>12321</div>
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
								<td><button onclick="insertReply();">글 등록</button></td>
							</c:when>
							<c:otherwise>
								<td><textarea readonly cols="50" rows="3"
										style="resize: none;">로그인 후 이용가능한 서비스입니다.</textarea></td>
								<td><button>글 등록</button></td>
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
	<script>

		function selectReplyList() {

			// Servlet요청 AJAX로 보내서 조회해올건데

			$.ajax({
				url : 'replyList.do',
				data : {
					boardNo :${}
		},
				success : function(result) {
					//console.log(result);

					let resultStr = '';
					for ( let i in result) {

						resultStr += '<tr>' + '<td>' + result[i].replyWriter
								+ '</td>' + '<td>' + result[i].replyContent
								+ '</td>' + '<td>' + result[i].createDate
								+ '</td>' + '</tr>'
					}
					;
					$('#reply-area tbody').html(resultStr);

				},
				error : function(e) {
					console.log(e);
				}

			});

		}

		$(function() {

			selectReplyList();

			setInterval(selectReplyList, 1000);

		});

		function insertReply() {

			$.ajax({
				url : 'replyInsert.do',
				type : 'post',
				data : {
					content : $('#replyContent').val(),
					boardNo :
		},
				success : function(result) {
					//console.log(result);

					if (result == 'success') {
						$('#replyContent').val('');
						selectReplyList();
					}
					;
				}

			});

		}
	</script>

</body>
</html>