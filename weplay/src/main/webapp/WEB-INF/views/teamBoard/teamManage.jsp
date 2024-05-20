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

#boardSelect-area {
	float: right;
	width: 70%;
}

#teamBoardName {
	resize: none; /* 사용자가 크기를 조절할 수 없도록 함 */
	width: 90%;
	height: 30px;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div class="outer">
		<h2>팀 관리</h2>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#home">신청</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu1">Menu 1</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu2">Menu 2</a></li>
		</ul>

		<!-- Tab panes -->

		<div class="tab-content">
			<div class="tab-pane container active" id="home">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>이름</td>
							<td>팀이름</td>
							<td>신청글</td>
							<td>신청일</td>
							<td>상태</td>
							<td>승인하기</td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
						    <c:when test="${empty list}">
						        <tr>
						            <td colspan="6">내용 없음</td>
						        </tr>
						    </c:when>
						    <c:otherwise>
						        <c:forEach var="teamApplication" items="${list}">
						            <tr>
						            	<td style="display: none;">${teamApplication.memberNo}</td>
						                <td>${teamApplication.nickName}</td>
						                <td>${teamApplication.teamName}</td>
						                <td>${teamApplication.applyContent}</td>
						                <td>${teamApplication.applyDate}</td>
						                <td>
						                    <select>
						                        <option value="Y" <c:if test="${teamApplication.status eq 'Y'}">selected</c:if>>신청중</option>
						                        <option value="N" <c:if test="${teamApplication.status eq 'N'}">selected</c:if>>신청취소</option>
						                        <option value="A" <c:if test="${teamApplication.status eq 'A'}">selected</c:if>>승낙</option>
						                        <option value="R" <c:if test="${teamApplication.status eq 'R'}">selected</c:if>>거절</option>
						                    </select>
						                </td>
						                <td><a style="cursor: pointer;" onclick="come(this);">👌</a></td>
						            </tr>
						        </c:forEach>
						    </c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="tab-pane container fade" id="menu1">...</div>
			<div class="tab-pane container fade" id="menu2">...</div>
		</div>

	</div>
	<script>
	
		// 파라미터 받아와서 teamNo 넣기
	    function getParameterByName(name) {
	        name = name.replace(/[\[\]]/g, "\\$&");
	        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
	            results = regex.exec(window.location.href);
	        if (!results)
	            return null;
	        if (!results[2])
	            return '';
	        return decodeURIComponent(results[2].replace(/\+/g, " "));
	    }
		  
		  
		function come(element){
			
			$.ajax({
				url:'insertToTeamMember',
				data : {
					  teamNo: getParameterByName('teamNo'),
					  memberNo: 
				},
				success: function(response){
					if(response ==='success'){
						alert("팀 영입 성공!");
						
					}else{
						alert("실패")
					}
				}
			});
		}
			
			
		
	
	</script>

</body>
</html>