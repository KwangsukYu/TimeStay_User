<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="./navigation.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../resources/css/login.css" />
  </head>
  <body>
    <div class="nav_space"></div>
    <div class="find">
      <div class="Login">
        <h4>로그인</h4>
        <form action="*" method="post" id="frm">
          <table>
            <tr>
              <td>
                <input
                  class="login_ID"
                  type="text"
                  placeholder="아이디"
                  name="Mid"
                />
              </td>
            </tr>
            <tr>
              <td>
                <input
                  class="login_PW"
                  type="password"
                  placeholder="비밀번호"
                  name="Mpwd"
                />
              </td>
              <!-- name값 필드값과 동일하게 하기!! -->
            </tr>
            <tr>
              <td>
                <button id="submit">로그인</button>
              </td>
            </tr>
          </table>
        </form>

        <div class="login_bottom">
          <a href="*">회원가입</a>
          <a href="*">아이디 찾기</a>
          <a href="*">비밀번호 찾기</a>
        </div>
      </div>
    </div>
    <%@include file="./footer.jsp" %>
  </body>
  <script></script>
</html>
