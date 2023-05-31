<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="./navigation.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../resources/css/mypageManage.css" />
    <title>Title2</title>
  </head>
  <body>
    <div class="member_menu">
      <p>마이 페이지</p>
      <ul>
        <li>
          <a
            href="<%=request.getContextPath()%>/MyPage/member_Modify.do?Mid=${Mid}"
            style="font-weight: bold"
            >회원정보 수정</a
          >
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/MyPage/member_Point.do"
            >나의 마일리지</a
          >
        </li>

        <li>
          <a href="<%=request.getContextPath()%>/Shopping/ShoppingCart.do"
            >장바구니</a
          >
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/Shopping/ShoppingOrderView.do"
            >주문/배송조회</a
          >
        </li>

        <c:if test="${ Mgrade == 'A'}">
          <li>관리자 메뉴</li>
          <li>
            <a
              href="<%=request.getContextPath()%>/MyPage/MPMemberManage.do"
              style="font-weight: bold"
              >회원 관리</a
            >
          </li>
          <li>
            <a href="<%=request.getContextPath()%>/MyPage/MPProductManage.do"
              >상품 관리</a
            >
          </li>
        </c:if>

        <li>
          <a
            href="<%=request.getContextPath()%>/MyPage/member_Delete.do?Mid=${Mid}"
            >회원 탈퇴</a
          >
        </li>
      </ul>
    </div>
    <div class="member_modify">
      <h4>회원정보 수정</h4>

      <form action="member_Modify.do" method="post">
        <div id="member_info">
          <table>
            <tr>
              <td>아이디</td>
              <td><input type="hidden" name="Mid" value="${Mid}" />${umail}</td>
            </tr>
            <tr>
              <td>현재 비밀번호</td>
              <td>
                <input
                  name="Mpwd"
                  id="Mpwd"
                  type="password"
                  placeholder="현재 비밀번호를 입력하세요"
                /><span class="result"></span>
              </td>
            </tr>
            <tr>
              <td>신규 비밀번호</td>
              <td>
                <input
                  name="NewMpwd"
                  id="NewMpwd"
                  type="password"
                  placeholder="신규 비밀번호"
                /><span class="result"></span><br />
                <input
                  name="NewMPwd2"
                  id="NewMpwd2"
                  type="password"
                  placeholder="비밀번호 확인"
                /><span class="result"></span>
              </td>
            </tr>
            <tr>
              <td>이름</td>
              <td>
                <input type="hidden" name="Mname" value="${Mname}" />${Mname}
              </td>
            </tr>
            <tr>
              <td>연락처</td>
              <td>
                <input
                  id="Mphone"
                  name="Mphone"
                  type="text"
                  value="${Mphone}"
                  placeholder="연락처"
                /><span class="result"></span>
              </td>
            </tr>
            <tr>
              <td>이메일</td>
              <td>
                <input
                  id="Memail"
                  name="Memail"
                  type="text"
                  value="${Memail}"
                  placeholder="이메일 주소"
                />
                <select name="email_domain">
                  <option value="self">직접입력</option>
                  <option value="naver">@naver.com</option>
                  <option value="kakao">@kakao.com</option>
                  <option value="gmail">@gmail.com</option>
                  <option value="yahoo">@yahoo.com</option></select
                ><span class="result"></span>
              </td>
            </tr>
            <tr>
              <td>주소</td>
              <td>
                <input
                  type="text"
                  id="Madd"
                  name="Madd"
                  value="${Madd}"
                  placeholder="우편번호"
                />
                <input
                  type="button"
                  class="findAdd"
                  onclick="Postcode()"
                  value="우편번호 찾기"
                /><span class="result"></span><br />
                <input
                  type="text"
                  id="Madd2"
                  name="Madd2"
                  value="${Madd2}"
                  placeholder="주소"
                  style="width: 300px"
                /><span class="result"></span><br />
                <input
                  type="text"
                  id="Madd3"
                  name="Madd3"
                  value="${Madd3}"
                  placeholder="상세주소"
                  style="width: 300px"
                />
                <span class="result"></span>
              </td>
            </tr>
          </table>
          <div class="bottom_btn">
            <button id="submit" onclick="return fnSubmit();">수 정</button>
            <button
              id="cancel"
              type="button"
              onclick="location.href='member_Modify.do?Mid=${Mid}'"
            >
              취 소
            </button>
          </div>
        </div>
      </form>
    </div>
    <%@include file="./footer.jsp" %>
  </body>

  <script>
    function Postcode() {
      new daum.Postcode({
        oncomplete: function (data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ""; // 주소 변수
          var extraAddr = ""; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === "R") {
            // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
          } else {
            // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById("Madd").value = data.zonecode;
          document.getElementById("Madd2").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("Madd3").focus();
        },
      }).open();
    }
  </script>
</html>
