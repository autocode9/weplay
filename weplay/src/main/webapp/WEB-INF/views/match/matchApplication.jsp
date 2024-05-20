<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>경기 신청</title>
    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 2%;
            background-color: white;
        }
        #match-header{
            width: 100%;
            text-align: center;
            > h3, h2{
                display: inline-flex;
            }
            > h2{
                margin-left: 10%;
                margin-right: 10%;
                font-weight: 700;
            }
        }
        #match-team{
            background-color: lightgray;
            text-align: center;
            padding: auto;
            > div {
                display: inline-block;
            }
        }
        #search-team-btn{
            float: inline-end;
            margin-right: 10%;
        }
        #home-team, #away-team{
            width: 35%;
        }
        #match-form{
            padding-top: 3%;
            text-align: center;
        }
        textarea[name='applyContent']{
            display: inline-flex;
            width: 40%;
            height: 200px;
        }

    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<script src="resources/js/common/city-district-select.js"></script>
	
    <div id="outer">
        <div id="match-header">
            <h3 style="color:rgb(52, 152, 219);">HOME</h3>
            <h2>경기 신청</h2>
            <h3 style="color:rgb(231, 76, 60);">AWAY</h3>
        </div>
        <div id="match-team">
        	<input type="hidden" id="home-teamNo" value="${ homeTeam.teamNo }">
            <div id="home-team"><h2>${ homeTeam.teamName }</h2></div>
            <div><h2>VS</h2></div>
            <input type="hidden" id="away-teamNo" value="${ awayTeam.teamNo }">
            <div id="away-team"><h2><c:out value="${ awayTeam.teamName }" default="선택 안함"/></h2></div>
        </div>
        <button id="search-team-btn" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#teamModal">상대팀 검색</button>
        <form action="" method="post" id="match-form">
            
            <label for="matchDate">경기 희망일시 : </label>
            <input type="date" name="matchDate" id="matchDate"/>
            <input type="time" name="matchDateTime" id="matchDateTime"/>
            <label for="matchTime">경기 시간 : </label>
            <select name="matchTime" id="matchTime">
                <option value="90">90분</option>
                <option value="60">60분</option>
                <option value="40">40분</option>
            </select>
            <br>
            <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#fieldModal">경기장 검색</button>
            <br>
            <span>경기장 : </span><b id="fieldName">선택 안함</b> <br>
            <span>위치 : </span><b id="location">--</b> <br>
            <span>정보 : </span><b id="fieldInfo">--</b> <br>
            <br>
            <label for="applyName">신청자명 : </label><input type="text" name="applyName" id="applyName" placeholder="본명 입력" required> <br>
            <label for="applyPhone">전화번호 : </label><input type="text" name="applyPhone" id="applyPhone" value="${ loginUser.phone }" placeholder="010-0000-0000" required> <br>
            <textarea name="applyContent" placeholder="신청 사유 / 추가 정보를 입력해주세요."></textarea> <br>
            <br>
            <button type="button" class="btn btn-secondary">취소</button>
            <button type="submit" class="btn btn-primary">신청</button>
        </form>



    </div>
    
    <!-- fieldModal -->
	<div class="modal" id="fieldModal">
		<div class="modal-dialog">
		    <div class="modal-content">
		
			      <!-- Modal Header -->
			    <div class="modal-header">
				    <h4 class="modal-title">경기장 검색</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			    </div>
			
			    <!-- Modal body -->
			    <div class="modal-body">
			        <div>
			            <label for="district">카테고리:</label>
			            <select id="district">
			                <option value="all" selected>전체</option>
			                <option value="fieldName" selected>경기장명</option>
			                <option value="location" selected>지역</option>
			            </select>
			        	<input type="text" id="keyword" placeholder="검색어 입력"/>
			        	<button class="btn btn-sm btn-dark">검색</button>
			        </div>
			        <div>
			        	
			        
			        
			        </div>
			    </div>
			
			    <!-- Modal footer -->
			    <div class="modal-footer">
		        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      	</div>
		
		    </div>
		</div>
	</div>
	
	<!-- teamModal -->
	<div class="modal" id="teamModal">
		<div class="modal-dialog modal-xl">
		    <div class="modal-content">
		
			      <!-- Modal Header -->
			    <div class="modal-header">
				    <h4 class="modal-title">팀 검색</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			    </div>
			
			    <!-- Modal body -->
			    <div class="modal-body">
			        <div>
			        	<b>지역 : </b>
			            <label for="sido">시도:</label>
			            <select id="sido">
							<option value="all" selected>전체</option>
			            </select>
			            <label for="sigungu">시군구:</label>
			            <select id="sigungu">
			                <option value="all" selected>전체</option>
			            </select>
			            <br>
			        	<input type="text" id="keyword" placeholder="검색어 입력"/>
			        	<button class="btn btn-sm btn-dark">검색</button>
			        
			        </div>
			        <div id="teams-area">
			        	<div id="result-area">
			        	</div>
			            <table class="table table-bordered table-hover">
			                <thead>
			                    <tr>
			                        <th>순위</th>
			                        <th>팀명</th>
			                        <th>팀 유형</th>
			                        <th>지역</th>
			                        <th>실력</th>
			                        <th>팀원수</th>
			                        <th>평균 나이</th>
			                        <th>전적</th>
			                        <th></th>
			                    </tr>
			                </thead>
			                <tbody>
			
			                </tbody>
			            </table>
			            <div class="page-area">
			            	
			            </div>
			
			        </div> <!-- #teams-area -->
			        
			    </div>
			
			    <!-- Modal footer -->
			    <div class="modal-footer">
		        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      	</div>
		
		    </div>
		</div>
	</div>
	
	<script>
		let page = 1;
		$(() => {
			selectCities();
			selectTeams(page);
			
			// 시도 선택시 시도에 맞는 시군구를 가져옴
			$('#sido').change(() => { 
				if($('#sido').val() != 'all' && $('#sido').val() != '세종'){
					selectDistricts();
				}
				else{
					$('#sigungu').html(optionAll);
				}
				selectTeams(page);
			});
			$('#sigungu').change(() => { 
				selectTeams(page);
			});
			
			$('#searchByKeyword').click(() => {
				selectTeams(page);
			});
			
			$('#teams-area tbody').on('click', '.chooseTeam', function() {
				const $teamTds = $(this).parent().parent().children();
				
				$('#away-teamNo').val($teamTds.eq(0).val());
				$('#away-team').html('<h2>' + $teamTds.eq(2).text() + '</h2>');
			})
			
		});
	
		function selectTeams(page){ // 팀 목록 조회	
			$.ajax({
				url : 'teams/' + page,
				type : 'get',
				data : {
					sido : $('#sido').val(),
					sigungu : $('#sigungu').val(),
					keyword : $('#keyword').val()
				},
				success : result => {
					const pageInfo = result[0];
					const teams = result[1];
					
					$('#result-area').html(createResultStr(pageInfo.listCount));
	
					if(teams.length == 0){
						const teamTrEmpty = '<tr><td colspan="9">조회된 팀이 없습니다.</td></tr>';
						$('#teams-area tbody').html(teamTrEmpty);
						$('#page-area').html('');
					}
					else{
						$('#teams-area tbody').html('');
						for(let i in teams){
							const teamTr = createTeamTr(teams[i]);
							$('#teams-area tbody').append(teamTr);
						}
						const pageUl = pagination(pageInfo);
						
						$('#page-area').html(pageUl);
						
					}
				}
			});
		}
	
		function createResultStr(listCount){
			const $keyword = $('#keyword').val();
			const $sido = $('#sido').val();
			const $sigungu = $('#sigungu').val();
			
			let result = '';
			if($keyword == ''){
				result = '조회 결과 : ';
			}
			else{
				result = '<b>' + $keyword + '</b> 검색 결과 : ';
			}
			result += '<b>' + listCount + '</b>팀';
	
			if($sido != 'all' && $sigungu == 'all'){
				result += '(' + $sido + ')';
			}
			else if($sigungu != 'all' && $sigungu != 'all'){
				result += '(' + $sido + ' ' + $sigungu + ')';
			}
			return result;
		}
	
		function createTeamTr(team){ // 팀 테이블 행 생성 메소드
			const teamTr = document.createElement('tr');
			teamTr.setAttribute("class", "team-tr");
	
			const keys = Object.keys(team);
				
			for (let i in keys) {
				const key = keys[i] // 각각의 키
				const value = team[key] // 각각의 키에 해당하는 각각의 값
				
				if(i == 0){ // teamNo => input:hidden
					const teamNo = document.createElement("input");
					teamNo.setAttribute("class", "teamNo");
					teamNo.setAttribute("type", "hidden");
					teamNo.setAttribute("value", value);
					teamTr.appendChild(teamNo);
				}
				else{
					const td = document.createElement('td');
					td.innerText = value;
					teamTr.appendChild(td);
				}
			}
			const td = document.createElement('td');
			td.innerHTML = '<button type="button" class="btn btn-sm btn-success chooseTeam" data-dismiss="modal">선택</button>';
			teamTr.appendChild(td);
			
			return teamTr;
		}
	
		function pagination(pageInfo){ // 페이징 처리
		    		
		    const pageUl = document.createElement('ul');
		    pageUl.setAttribute("class", "pagination justify-content-center");
		    		
		    const moveLi = document.createElement('li');
		    moveLi.setAttribute("class", "page-item");
		    
		    if(pageInfo.currentPage != 1){
		    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage - 1) + ');">이전</a>';
		  		pageUl.appendChild(moveLi);
		    }
		    
		    for(let i = 1; i <= pageInfo.endPage; i++){
		  		
		  	const pageLi = document.createElement('li');
		    	if(i == pageInfo.currentPage){
		  			pageLi.setAttribute("class", "page-item active");
		    	}
		    	else{
		    		pageLi.setAttribute("class", "page-item");
		    	}
		  		pageLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + i + ');">' + i + '</a>';
		  		pageUl.appendChild(pageLi);
		    }
		    
		    if(pageInfo.maxPage > pageInfo.currentPage){
		    	moveLi.innerHTML = '<a class="page-link" onclick="selectTeams(' + (pageInfo.currentPage + 1) + ');">다음</a>';
		  		pageUl.appendChild(moveLi);
		    }
		    
		    return pageUl;
		}
	</script>
    
</body>
</html>