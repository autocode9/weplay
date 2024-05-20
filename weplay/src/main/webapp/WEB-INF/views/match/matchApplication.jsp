<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        #home-teamName, #away-teamName{
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
		.modal-search-area{
			text-align: center;		
		}
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<!-- teamModal -->
    <jsp:include page="matchApplicationTeamModal.jsp"/>	
	
	<script src="resources/js/common/city-district-select.js"></script>
	
    <div id="outer">
        <div id="match-header">
            <h3 style="color:rgb(52, 152, 219);">HOME</h3>
            <h2>경기 신청</h2>
            <h3 style="color:rgb(231, 76, 60);">AWAY</h3>
        </div>
        <div id="match-team">
        	<input type="hidden" id="home-team" value="${ homeTeam.teamNo }">
            <div id="home-teamName"><h2>${ homeTeam.teamName }</h2></div>
            <div><h2>VS</h2></div>
            <input type="hidden" id="away-team" value="${ awayTeam.teamNo }">
            <div id="away-teamName"><h2><c:out value="${ awayTeam.teamName }" default="선택 안함" /></h2></div>
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
            <button id="search-field-btn" type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#fieldModal">경기장 검색</button>
            <br>
            <input type="hidden" name="fieldNo" id="fieldNo">
            <span>경기장 : </span><b id="fieldName">선택 안함</b> <br>
            <span>위치 : </span><b id="location">--</b> <br>
            <span>정보 : </span><b id="fieldInfo">--</b> <br>
            <br>
            <input type="hidden" name="memberNo" value="${ loginUser.userNo }">
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
		<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		
			      <!-- Modal Header -->
			    <div class="modal-header">
				    <h4 class="modal-title">경기장 검색</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			    </div>
			
			    <!-- Modal body -->
			    <div class="modal-body">
			        <div class="modal-search-area">
			            <label for="category">카테고리:</label>
			            <select id="category">
			                <option value="all" selected>전체</option>
			                <option value="fieldName">경기장명</option>
			                <option value="location">지역</option>
			            </select>
			        	<input type="text" id="query" placeholder="검색어 입력"/>
			        	<button id="searchField" class="btn btn-sm btn-dark">검색</button>
			        </div>
			        <div id="fields-area">
			        	<div id="field-result-area">
			        	</div>
			        	<table class="table table-bordered table-hover">
			        		<thead>
			        			<tr>
			        				<th>경기장</th>
			        				<th>지역</th>
			        				<th>바닥 재료</th>
			        				<th>크기</th>
			        				<th>준공연도</th>
			        				<th></th>
			        			</tr>
			        		</thead>
			        		<tbody>
			        		
			        		</tbody>
			        	</table>
			        	<div id="field-page-area">
			            	
			            </div>
			        </div>
			    </div>
			
			    <!-- Modal footer -->
			    <div class="modal-footer">
		        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      	</div>
		
		    </div>
		</div>
	</div>
	
	<script>
		$(() => {
			$('#search-field-btn').click(() => {
				$('#category').val('all');
				$('#query').val('');
				selectFields(page);
			});
			$('#searchField').click(() => {
				selectFields(page);
			});
		});
		function selectFields(page){
			$.ajax({
				url : 'fields/' + page,
				type : 'get',
				data : {
					category : $('#category').val(),
					query : $('#query').val()
				},
				success : result => {
					const pageInfo = result[0];
					const fields = result[1];
					
					$('#field-result-area').html(createFieldResult(pageInfo.listCount));
					
					if(fields.length == 0){
						const fieldTrEmpty = '<tr><td colspan="6">조회된 경기장이 없습니다.</td></tr>';
						$('#fields-area tbody').html(fieldTrEmpty);
						$('#field-page-area').html('');
					}
					else{
						$('#fields-area tbody').html('');
						for(let i in fields){
							const fieldTr = createFieldTr(fields[i]);
							$('#fields-area tbody').append(fieldTr);
						}
						const pageUl = fieldPagination(pageInfo);
						
						$('#field-page-area').html(pageUl);
						
					}
					
				}
				
			});
		}
		
		function createFieldResult(listCount){
			const $query= $('#query').val();
			const $category = $('#category').val();
			
			let result = '';
			if($query != ''){
				result = '<b>' + $query + '</b>';
				switch($category){
				case 'all' : result += ' 전체 검색 결과 : '; break;
				case 'fieldName' : result += ' 경기장명 검색 결과 : '; break;
				case 'location' : result += ' 지역 검색 결과 : '; break;
				}
			}
			else{
				result = '조회 결과 : ';
			}
			result += listCount + '건';
			return result;
		}
		
		function createFieldTr(field){ // 팀 테이블 행 생성 메소드
			const fieldTr = document.createElement('tr');
			fieldTr.setAttribute("class", "field-tr");
	
			const keys = Object.keys(field);
				
			for (let i in keys) {
				const key = keys[i] // 각각의 키
				const value = field[key] // 각각의 키에 해당하는 각각의 값
				
				if(i == 0){ // teamNo => input:hidden
					const fieldNo = document.createElement("input");
					fieldNo.setAttribute("class", "fieldNo");
					fieldNo.setAttribute("type", "hidden");
					fieldNo.setAttribute("value", value);
					fieldTr.appendChild(fieldNo);
				}
				else{
					const td = document.createElement('td');
					td.innerText = value;
					fieldTr.appendChild(td);
				}
			}
			const td = document.createElement('td');
			td.innerHTML = '<button type="button" class="btn btn-sm btn-success chooseField" data-dismiss="modal">선택</button>';
			fieldTr.appendChild(td);
			
			return fieldTr;
		}
		
		function fieldPagination(pageInfo){ // 페이징 처리
    		
		    const pageUl = document.createElement('ul');
		    pageUl.setAttribute("class", "pagination justify-content-center");
		    		
		    const moveLi = document.createElement('li');
		    moveLi.setAttribute("class", "page-item");
		    
		    if(pageInfo.currentPage != 1){
		    	moveLi.innerHTML = '<a class="page-link" onclick="selectFields(' + (pageInfo.currentPage - 1) + ');">이전</a>';
		  		pageUl.appendChild(moveLi);
		    }
		    
		    for(let i = pageInfo.startPage; i <= pageInfo.endPage; i++){
		  		
		  	const pageLi = document.createElement('li');
		    	if(i == pageInfo.currentPage){
		  			pageLi.setAttribute("class", "page-item active");
		    	}
		    	else{
		    		pageLi.setAttribute("class", "page-item");
		    	}
		  		pageLi.innerHTML = '<a class="page-link" onclick="selectFields(' + i + ');">' + i + '</a>';
		  		pageUl.appendChild(pageLi);
		    }
		    
		    if(pageInfo.maxPage > pageInfo.currentPage){
		    	moveLi.innerHTML = '<a class="page-link" onclick="selectFields(' + (pageInfo.currentPage + 1) + ');">다음</a>';
		  		pageUl.appendChild(moveLi);
		    }
		    
		    return pageUl;
		}
	</script>
	
	
    
</body>
</html>