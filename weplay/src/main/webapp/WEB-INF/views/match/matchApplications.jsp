<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WEPLAY:MatchApps</title>
    <style>
        #outer{
            width: 80%;
            background-color: white;
            margin: auto;
        }
        .table{text-align: center;}
        .table a{color: black;}
        .more-btn-area{
            width: 100%;
            text-align: center;
        }
        .status-y{color: forestgreen;}
        .status-n{color: #dc3545;}
        .status-a{color: #007bff;}
        .status-r{color: black; }
    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
    
    <div id="outer">
    	<input type="hidden" id="teamNo" value="${ loginUser.teamNo }">
        <div id="recieved-area">
            <h2>받은 경기 신청 내역</h2>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>상대팀</th>
                        <th>경기장</th>
                        <th>경기일시</th>
                        <th>경기시간</th>
                        <th>신청자 정보</th>
                        <th>신청일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">받은 신청 내역이 없습니다.</td>
                    </tr>
                    <tr>
                        <td><a href="">리메이크 FC</a></td>
                        <td><a href="">효창공원운동장</a></td>
                        <td>2024.06.08<br>16:00</td>
                        <td>90분</td>
                        <td><a href="">사용자2 | 이소룡</a><br>010-0000-0000</td>
                        <td>2024.05.20</td>
                        <td>
                            <button class="btn btn-sm btn-success">승낙</button>
                            <button class="btn btn-sm btn-danger">거절</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="more-btn-area">
                <button class="btn btn-primary">더보기</button>
            </div>
        </div>
        <div id="sent-area">
            <h2>보낸 경기 신청 내역</h2>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>상대팀</th>
                        <th>경기장</th>
                        <th>경기일시</th>
                        <th>경기시간</th>
                        <th>신청자 정보</th>
                        <th>신청일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">보낸 신청 내역이 없습니다.</td>
                    </tr>
                    <tr>
                        <td><a href="">리메이크 FC</a></td>
                        <td><a href="">효창공원운동장</a></td>
                        <td>2024.06.08<br>16:00</td>
                        <td>90분</td>
                        <td><a href="">사용자2 | 이소룡</a><br>010-0000-0000</td>
                        <td>2024.05.20</td>
                        <td>
                            <label class="status-y">신청중</label>
                            <button class="btn btn-sm btn-outline-danger">신청 취소</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="more-btn-area">
                <button class="btn btn-primary">더보기</button>
            </div>
        </div>
    </div>
	
	<script>
		var recievedLimit = 5;
		var sentLimit = 5;
		$(() => {
			getMatchApplications();
		});
		function getMatchApplications(boardLimit){
			$.ajax({
				url : 'matchApp/getMatchApplications',
				type : 'get',
				data : {
					teamNo : $('#teamNo').val(),
					recievedLimit : recievedLimit,
					sentLimit : sentLimit
				},
				success : result => {
					console.log(result);
				}
			});
		};
		
	</script>
	
	
</body>
</html>