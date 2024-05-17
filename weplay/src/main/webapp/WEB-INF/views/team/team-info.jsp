<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        #outer{
            width:80%;
            margin: auto;
            padding-bottom: 5%;
            padding-top: 5%;
            background-color: white;
        }
        #info-area{
            display: flex;
            width: 100%;
        }
        .content-box{
            display: inline-block;
        }
        #logo-area{
            text-align: center;
            width: 50%;
            padding-left: 5%;
            >img{
                width: 60%;
                margin-bottom: 5%;
            }
        }
        #content-area{
            width: 50%;
            padding-right: 10%;
            text-align: left;
            >h1{display: inline-block; margin-right: 10%;}
            >h3{margin-bottom: 5%;}
            span{display: inline-block; font-size: 18px; margin-right: 5%; margin-bottom: 2%;}
            >div{width: 40%;display: inline-block; margin-right: 5%;}
            >p{font-size: 18px;}
        }
        #btn-area{
            width: 100%;
            padding-top: 2%;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="outer">
        <div id="info-area">
            <div id="logo-area" class="content-box">
                <img src="https://storage.googleapis.com/cr-resource/image/f6accb6d63fca640b9ca3eb49c8a7413/juivseo/800/dd3d8aa01c1342889ad71306b7ae2045.jpg"> <br>
                <button class="btn btn-success">팀 가입 신청</button>
                <button class="btn btn-primary">경기 신청</button>
            </div>
            <div id="content-area" class="content-box">
                <input type="hidden" value="">
                <h1>리메이크 FC</h1>
                <button class="btn btn-outline-primary">팀 페이지로 이동</button> <br>
               
                <h3>2승 0무 1패</h3>
                <span>창단연도 : 2023년</span> <br>
                <div>
                    <span>지역 : 서울 종로구</span> <br>
                    <span>팀유형 : 청년</span> <br>
                    <span>실력 : 상</span> <br>
                </div>
                <div>
                    <span>인원 : 15명</span> <br>
                    <span>평균 나이 : 20대</span> <br>
                    <span>유니폼 : 블루</span> <br>
                </div>
                <br><br>
                <h4>팀 소개</h4>
                <p>
                    주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을
                </p>
            </div>
        </div>
        <div id="btn-area">
            <button class="btn btn-info">뒤로가기</button>
        </div>
    </div>
</body>
</html>