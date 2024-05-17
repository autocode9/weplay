<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WEPLAY:AllTeams</title>

    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 2%;
            background-color: white;
        }

        #search-area{
            width: 100%;
            text-align: center;
            margin-top: 2%;
            margin-bottom: 2%;
        }
        #result-area{
        	width: 100%;
            text-align: right;
            margin-bottom: 2%;
            padding-right: 2%;
        }
        #sigungu{
            margin-right: 2%;
        }
        #teams-area{
        	padding-left: 2%;
        	padding-right: 2%;
        }
		.page-link:hover{
			cursor: pointer;
		}
    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="outer">
        <div id="search-area">
            <b>지역 : </b>
            <label for="sido">시도:</label>
            <select id="sido">
				<option value="all" selected>전체</option>
            </select>
            <label for="sigungu">시군구:</label>
            <select id="sigungu">
                <option value="all" selected>전체</option>
            </select>
            <input type="text" id="keyword" placeholder="팀명 검색">
            <button id="searchByKeyword" class="btn btn-sm btn-dark">검색</button>
        </div>
        <div id="result-area">
            <p></p>
        </div>
        <div id="teams-area">
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
            <div id="page-area">
            	
            </div>

        </div> <!-- #teams-area -->

    </div> <!-- #outer -->
    
    <script>
    	const optionAll = '<option value="all" selected>전체</option>';
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
    		
    		$('#teams-area tbody').on('click', 'team-tr', () => {
    			console.log($(this));
    		})
    			
    		
    		
    	});
    	
    	
    	function selectCities(){ // 시도 셀렉트 옵션 조회
    		$.ajax({
    			url : 'city',
    			type : 'get',
    			success : city => {
    				let options = optionAll;
    				for(let i in city){
    					options += '<option value="' + city[i].sido + '">' + city[i].sido + '</option>';
    				}
    				$('#sido').html(options);
    			}
    		});
    	} // selectLocation() End
    	
    	function selectDistricts(){ //시군구 셀렉트 옵션 조회
    		$.ajax({
    			url : 'city/' + $('#sido').val(),
    			type : 'get',
    			success : district => {
    				let options = optionAll;
    				for(let i in district){
    					options += '<option value"' + district[i].sigungu + '">' + district[i].sigungu + '</option>';
    				}
    				$('#sigungu').html(options);
    			}
    			
    		});
    	}
    	
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
    		td.innerHTML = '<button class="btn btn-sm btn-success apply-match">경기신청</button>'
    					 + '<button class="btn btn-sm btn-primary apply-join">가입신청</button>';
    		teamTr.appendChild(td);
    		
    		return teamTr;
    	}
    	
    	function pagination(pageInfo){ // 팀 목록 페이징 처리
    		
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