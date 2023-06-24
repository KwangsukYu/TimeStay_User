<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./global.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TIME STAY : 로그인</title>

  <link rel="stylesheet" href="<%= BASE_URL %>resources/css/reset.css"/>
  <link rel="stylesheet" href="<%= BASE_URL %>resources/css/navigation.css">

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script> <!--생년월일 select 박스-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!--jquery 3.6 적용-->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <style>
    
    </style>
</head>
<body>
    <header id="header" class="deactive">        
        <nav class="navbar">
            <div class="navbar_menu">
                <div id="title"> 
                    <h4><a href="*">TIME STAY</a></h4>
                </div>
                <ul>
                    <li><a href="*">카페소개</a>
                        <div class="sub">
                            <ul>
                                <li><a href="*">Time stay</a></li>
                                <li><a href="*">오시는 길</a></li>
                                <li><a href="*">갤러리</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="#">메  뉴</a>
                        <div class="sub">
                            <ul>
                                <li><a href="*">제과</a></li>
                                <li><a href="*">음료</a></li>
                                <li><a href="*">음식</a></li>
                                <li><a href="*">원두</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="#">EVENT</a>
                        <div class="sub">
                            <ul>
                               	<li><a href="*">진행중 이벤트</a></li>
                                <li><a href="*">종료된 이벤트</a></li>
                                <li><a href="#"></a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="*">공지사항</a>
                        <div class="sub">
                            <ul>
                                <li><a href="*">공지사항</a></li>
                                <li><a href="*">자주 묻는 질문</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>           
        </nav>   
         
  		<c:if test= "${login==null}">
	  		<ul class="navbar_links">
	 			<li><a href="<%= BASE_URL %>user/login">로그인</a></li>	    
	            <li><a href="*">장바구니</a></li>
	            <li><a href="*">고객센터</a></li>
	        </ul>
        </c:if>
     	<c:if test ="${login!=null}">
	        <ul class="navbar_links" style="width:330px;">
	            <li><a href="*" style="padding:0 4px">로그아웃</a></li>
	            <li><a href="*" style="padding:0 4px">마이페이지</a></li>
	            <li><a href="*" style="padding:0 4px">장바구니</a></li>
	            <li><a href="*" style="padding:0 4px">고객센터</a></li>
	        </ul>
  		</c:if> 
        
    </header>
        </div>
    </div>
    <script>  

        // 스크롤 시 header 색변화 fade-in
        $(function(){
            $(document).on('scroll', function(){
                if($(window).scrollTop() > 100){
                    $("#header").removeClass("deactive");
                    $("#header").addClass("active");
                }else{
                    $("#header").removeClass("active");
                    $("#header").addClass("deactive");
                }
            })
        });   
    </script>
</body>
</html>
        