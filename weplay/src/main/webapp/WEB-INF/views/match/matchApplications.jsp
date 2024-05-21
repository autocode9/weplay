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
                        <th>신청메세지</th>
                        <th>신청일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">받은 신청 내역이 없습니다.</td>
                    </tr>
                    <tr>
                        <td>
                        	<input type="hidden" class="applyNo">
                        	<input type="hidden" class="homeTeamNo">
                        	<a href="">리메이크 FC</a>
                        </td>
                        <td>
                        	<input type="hidden" class="fieldNo">
                        	<a href="">효창공원운동장</a>
                        </td>
                        <td>2024.06.08<br>16:00</td>
                        <td>90분</td>
                        <td><a href="">사용자2 | 이소룡</a><br>010-0000-0000</td>
                        <td>경기합시다.</td>
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
                        <th>신청메세지</th>
                        <th>신청일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">보낸 신청 내역이 없습니다.</td>
                    </tr>
                    <tr>
                        <td>
                        	<input type="hidden" class="applyNo">
                        	<a href="">리메이크 FC</a>
                        </td>
                        <td><a href="">효창공원운동장</a></td>
                        <td>2024.06.08<br>16:00</td>
                        <td>90분</td>
                        <td><a href="">사용자2 | 이소룡</a><br>010-0000-0000</td>
                        <td>경기합시다.</td>
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
					const recievedList = result.recievedList;
					for(let i in recievedList){
						const recievedTr = createRecievedTr(recievedList[i]);
						$('#recieved-area tbody').append(recievedTr);
					}
					/*
					const sentList = result.sentList;
					for(let i in sentList){
						createSentTr(result.sentList);
					}
					*/
				}
			});
		};
		
		function createRecievedTr(application){
			
			const tr = document.createElement('tr');
			
			const td1 = document.createElement('td');
			
			const applyNo = document.createElement('input');
			applyNo.setAttribute('type', 'hidden');
			applyNo.setAttrubute('class', 'applyNo');
			applyNo.setAttribute('value', application.applyNo);
			td1.appendChild(applyNo);
			
			const teamNo = document.createElement('input');
			teamNo.setAttribute('type', 'hidden');
			teamNo.setAttrubute('class', 'homeTeamNo');
			teamNo.setAttribute('value', application.homeTeam);
			td1.appendChild(teamNo);
			
			const opponentName = document.createElement('a');
			opponentName.setAttribute('href', '');
			opponentName.innerText = application.opponentName;
			td1.appendChild(opponentName);
			
			tr.appendChild(td1);
			
			const td2 = document.createElement('td');
			const fieldNo = document.createElement('input');
			fieldNo.setAttribute('class', 'fieldNo');
			fieldNo.setAttribute('value', application.fieldNo);
			td2.appendChild(fieldNo);
			
			const fieldName = document.createElement('a');
			fieldName.setAttribute('href', '');
			fieldName.innerText = application.fieldName;
			td2.appendChild(fieldName);
			
			
			
		}
	</script>
	
	
</body>
</html>