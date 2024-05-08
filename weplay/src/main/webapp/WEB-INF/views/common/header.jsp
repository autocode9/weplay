<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WEPLAY</title>
    <!-- jQuery ���̺귯�� -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- ��Ʈ��Ʈ�� ��Ÿ�� -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- ��Ʈ��Ʈ�� ��ũ��Ʈ -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body{ background-color: black; }
        #header{
            width:80%;
            height:100px;
            padding-top:20px;
            margin:auto;
            >h1{
                text-align: center;
                color: rgb(52, 152, 219);
                font-size: 50px;
                font-weight: 700;
                margin-bottom: 40px;
                > a{text-decoration:none;}
            }
        }
        #header-btn-area {
            display: inline-block;
            padding-left: 80%;
            > a{
                text-decoration:none; color:white; 
            }
        }
        #header-navibar>ul {width:100%; height:100%; list-style-type:none; margin:auto; padding:0;}
        .navi-top {float:left; width:16.66%; height:100%; line-height:55px; text-align:center;}
        .navi-top > a {color:white; font-size:22px; font-weight:900; display: block; width: 100%; height: 100%; transform: scale(1);}
        #header-navibar {height:75%; border-bottom:1px solid lightgray;}
        .navi-in{ list-style-type:none; margin:auto; display: none;}
        .navi-in a{ text-decoration:none; color:white; font-size:18px; font-weight:900; }
        .navi-top > a:hover, .navi-in a:hover{ color: rgb(52, 152, 219); }
        .navi-top > a:hover + .navi-in{ display: block; }
        .navi-in:hover{ display: block; }
    </style>
</head>
<body>
    
    <div id="header">
        <div id="header-btn-area">
            <a href="">�α���</a> | <a href="">ȸ������</a>
            <!--<a href="">����������</a> | <a href="">����� ���� ����</a>-->
        </div>

        <h1><a href="">WEPLAY</a></h1>

        <div id="header-navibar">
            <ul>
                <li class="navi-top"><a href="">��</a></li>
                <li class="navi-top"><a href="">����</a></li>
                <li class="navi-top"><a href="">My��</a></li>
                <li class="navi-top">
                    <a href="">���</a>
                    <ul class="navi-in">
                        <li><a href="#">��ü ���</a></li>
                        <li><a href="#">My�� ���</a></li>
                        <li><a href="#">��� ��û</a></li>
                        <li><a href="#">��� ��û ����</a></li>
                        <li><a href="#">��� ���(��)</a></li>
                        <li><a href="#">��� ���(����)</a></li>
                    </ul>
                </li>
                <li class="navi-top">
                    <a href="">Ŀ�´�Ƽ</a>
                    <ul class="navi-in">
                        <li><a href="#">���� �Խ���</a></li>
                        <li><a href="#">��� �Խ���</a></li>
                        <li><a href="#">���� ����</a></li>
                        <li><a href="#">�� ����</a></li>
                    </ul>
                </li class="navi-top">
                <li class="navi-top"><a href="">����� ����</a></li>
            </ul>
        </div>

    </div>

</body>
</html>