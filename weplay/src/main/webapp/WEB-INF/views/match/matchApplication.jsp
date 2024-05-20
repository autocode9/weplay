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
	
    <div id="outer">
        <div id="match-header">
            <h3 style="color:rgb(52, 152, 219);">HOME</h3>
            <h2>경기 신청</h2>
            <h3 style="color:rgb(231, 76, 60);">AWAY</h3>
        </div>
        <div id="match-team">
            <div id="home-team"><h2>리메이크 FC</h2></div>
            <div><h2>VS</h2></div>
            <div id="away-team"><h2>FC 경실련</h2></div>
        </div>
        <button id="search-team-btn" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#teamModal">상대팀 검색</button>
        <form action="" method="post" id="match-form">
            
            <label for="matchDate">경기 희망일시 : </label>
            <input type="date" name="matchDate" id="matchDate"/>
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
            <label for="applyPhone">전화번호 : </label><input type="text" name="applyPhone" id="applyPhone" placeholder="010-0000-0000" required> <br>
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

    
</body>
</html>