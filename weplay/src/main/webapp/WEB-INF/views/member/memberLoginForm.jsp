<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />


	<div id="">
		<p>로그인
		<p>
	</div>

	<form id="login-form" action="insert.member" method="post">
		<table align="center">
			<tr>
				<th>아이디</th>
				<th><input type="text" name="userId" id="" required /></th>
			</tr>
			<tr>
				<td class="space" colspan="2">
				<td>
			<tr>
			<tr>
				<td class="space" colspan="2">
				<td>
			<tr>
			<tr>
				<td class="space" colspan="2">
				<td>
			<tr>
				<th>비밀번호</th>
				<th><input type="password" name="userPwd" id="" required /></th>
			</tr>
			<tr>
				<td class="space" colspan="2">
				<td>
			<tr>
			<tr>
				<td class="space" colspan="2">
				<td>
			<tr>
			<tr>
				<td class="space" colspan="2">
				<td>
			<tr>
			<tr>
				<th colspan="2" style="margin: 0 auto;" style="text-align: center;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-sm btn-primary">로그인</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-sm btn-secondary"
						onclick="enrollForm.member">회원가입</button>
				</th>
			</tr>
		</table>


	</form>

</body>
</html>