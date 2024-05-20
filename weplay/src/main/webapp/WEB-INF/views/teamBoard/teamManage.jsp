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
						<td>팀번호</td>
						<td>신청글</td>
						<td>신청일</td>
						<td>상태</td>
						<td>승인</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>개똥이1</td>
							<td>1</td>
							<td>하이요1</td>
							<td>20240515</td>
							<td><select>
									<option>Y</option>
									<option>N</option>
									<option>A</option>
									<option>R</option>
							</select></td>
							<td><a style="cursor: pointer;">👌</a></td>
						</tr>
						<tr>
							<td>개똥이2</td>
							<td>1</td>
							<td>하이요1</td>
							<td>20240515</td>
							<td>
							<select>
									<option>Y</option>
									<option>N</option>
									<option>A</option>
									<option>R</option>
							</select>
							</td>
							<td><a style="cursor: pointer;">👌</a></td>
						</tr>
						<tr>
							<td>개똥이3</td>
							<td>1</td>
							<td>하이요1</td>
							<td>20240515</td>
							<td>
							<select>
								<option>Y</option>
								<option>N</option>
								<option>A</option>
								<option>R</option>
							</select>
							</td>
							<td><a style="cursor: pointer;">👌</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-pane container fade" id="menu1">...</div>
			<div class="tab-pane container fade" id="menu2">...</div>
		</div>

	</div>
	<script>
		
	</script>

</body>
</html>