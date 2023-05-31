<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="./global.jsp" %>
<% int test = 1; %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Title2</title>
  </head>
  <body>
    <div>
      <h1>안녕하신가</h1>
      <h2>진짜 인텔리제이 자동완성좀 시켜주지</h2>
      <h3>세상에나</h3>
      		<c:set var="name" value="홍길동" />
            로그인 유저 : ${UMAIL}
      		이름 : <c:out value="${name}" />
      		</br>
            <%=test%>
      <h4>ㄱㄱ</h4>
      <a href="<%=BASE_URL%>user/login">login</a>
        <form action="<%= BASE_URL %>user/logout" method="post">
          <button type="submit">로그아웃</button>
        </form>
    </div>
  </body>

  <script></script>
</html>
