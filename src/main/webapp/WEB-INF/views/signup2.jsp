<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="./navigation.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<%= BASE_URL %>resources/css/signup2.css" />
    <title>회원 가입</title>
    <!--jquery 3.6 적용-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 주소검색 적용 -->

    <script type="text/javascript">
      $(function () {
        $("#checkAll").click(function () {
          if ($("#checkAll").prop("checked")) {
            $(".test").prop("checked", true);
          } else {
            $(".test").prop("checked", false);
          }
        });

        $(".test").click(function () {
          if ($("input[name='check']:checked").length == 3) {
            $("#checkAll").prop("checked", true);
          } else {
            $("#checkAll").prop("checked", false);
          }
        });
      });

      function movePage(e) {
        alert(1234);
        console.log(e);
        //아이디 확인
        if ($("#Mid").val() == "") {
          $(".result").empty();
          $("#idResult")
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          alert("아이디를 입력해주세요.");
          $("#Mid").focus();

          return false;
        }

        //비밀번호 확인
        if ($("#Mpwd").val() == "") {
          $(".result").empty();
          $("#Mpwd")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          //$("#Mpwd").next().empty();
          alert("비밀번호를 입력해주세요.");
          $("#Mpwd").focus();

          return false;
        }

        if ($("#Mpwd").val() != "" && $("#Mpwd2").val() == "") {
          $(".result").empty();
          $("#Mpwd2")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          //$("#Mpwd").next().empty();
          alert("비밀번호 확인을 입력해주세요.");
          $("#Mpwd2").focus();

          return false;
        }

        if ($("#Mpwd2").val() != "" && $("#Mpwd").val() == "") {
          $(".result").empty();
          $("#Mpwd")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          //$("#Mpwd2").next().empty();
          alert("비밀번호를 입력해주세요.");
          $("#Mpwd").focus();

          return false;
        }

        if ($("#Mpwd").val() != $("#Mpwd2").val()) {
          $(".result").empty();
          $("#Mpwd2")
            .next()
            .text(" 불일치")
            .css("color", "red")
            .css("font-size", "12px");
          //$("#Mpwd").next().empty();
          alert("비밀번호 확인이 일치하지 않습니다.");
          $("#Mpwd2").focus();

          return false;
        }

        if ($("#Mpwd").val() == $("#Mpwd2").val()) {
          $("#Mpwd").next().empty();
          $("#Mpwd2").next().empty();
        }

        //이름 확인
        if ($("#Mname").val() == "") {
          $(".result").empty();
          $("#Mname")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          alert("이름을 입력해주세요.");
          $("#Mname").focus();

          return false;
        }

        //전화번호 확인
        if ($("#Mphone").val() == "") {
          $(".result").empty();
          $("#Mphone")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          alert("전화번호를 입력해주세요.");
          $("#Mphone").focus();

          return false;
        }

        //주소 확인
        if ($("#Madd").val() == "") {
          $(".result").empty();
          $(".findAdd")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          alert("우편번호를 입력해주세요.");
          $("#Madd").focus();

          return false;
        }
        if ($("#Madd2").val() == "") {
          $(".result").empty();
          $("#Madd2")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          alert("주소를 입력해주세요.");
          $("#Madd2").focus();

          return false;
        }
        if ($("#Madd3").val() == "") {
          $(".result").empty();
          $("#Madd3")
            .next()
            .text(" *필수")
            .css("color", "red")
            .css("font-size", "12px");
          alert("상세주소를 입력해주세요.");
          $("#Madd3").focus();

          return false;
        }

        if ($("input[name='check']:checked").length != 3) {
          $(".result").empty();
          alert("모든 항목에 동의해야 합니다.");
          $("#alert")
            .text(" * 모든 항목에 동의해야 합니다")
            .css("color", "red")
            .css("font-size", "12px");

          return false;
        }
      }

      const back = () => {
        window.location.replace("<%= BASE_URL %>user/login");
      };

      async function idCheck() {
        const id = document.querySelector("#Mid").value;
        await axios
          .post("<%= BASE_URL %>user/idCheck", {
            UMAIL: id,
          })
          .then((res) => {
            let text = document.querySelector("#idResult");
            if (res.data) {
              text.style.color = "green";
              text.innerText = " * 사용가능";
              text.style.fontSize = "12px";
            } else {
              text.style.color = "red";
              text.innerText = " * 중복된 아이디입니다.";
              text.style.fontSize = "12px";
            }
          })
          .catch((err) => console.log(err));
      }
    </script>
  </head>
  <body>
    <main>
      <div id="signupstep">
        <ul>
          <li>
            <div id="step1">
              <div id="text">
                <p>STEP 1</p>
                <br />
                <p>약관동의/본인인증</p>
              </div>
            </div>
          </li>

          <li>
            <div id="step2">
              <div id="text">
                <p>STEP 2</p>
                <br />
                <p>회원정보입력</p>
              </div>
            </div>
          </li>

          <li>
            <div id="step3">
              <div id="text">
                <p>STEP 3</p>
                <br />
                <p>가입완료</p>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <!--signupstep-->

      <h2>회원가입</h2>

      <div id="agreeCheck">
        <table>
          <tr>
            <td>내용 확인 및 전체 동의</td>
            <td>
              <input
                type="checkbox"
                class="test"
                name="checkAll"
                id="checkAll"
              />
            </td>
          </tr>

          <tr>
            <td>서비스 이용약관 동의(필수)</td>
            <td><input type="checkbox" class="test" name="check" /></td>
          </tr>

          <tr>
            <td>개인정보 수집 및 이용 동의(필수)</td>
            <td><input type="checkbox" class="test" name="check" /></td>
          </tr>

          <tr>
            <td>만 14세 이상입니다.(필수)</td>
            <td><input type="checkbox" class="test" name="check" /></td>
          </tr>
          <tr>
            <td id="alert"></td>
          </tr>
        </table>
      </div>

      <div id="info">
        <form action="<%= BASE_URL %>user/signupConfirm" method="post">
          <table>
            <tr>
              <td>
                <input
                  type="text"
                  id="Mid"
                  name="Mid"
                  placeholder="아이디 입력 (이메일 형식)"
                />
                <button type="button" class="idCheck" onclick="idCheck()">
                  중복확인</button
                ><span id="idResult"></span>
              </td>
            </tr>

            <tr>
              <td>
                <input
                  type="password"
                  id="Mpwd"
                  name="Mpwd"
                  placeholder="비밀번호"
                /><span class="result"></span>
              </td>
            </tr>

            <tr>
              <td>
                <input
                  type="password"
                  id="Mpwd2"
                  name="Mpwd2"
                  placeholder="비밀번호 확인"
                /><span class="result"></span>
              </td>
            </tr>

            <tr>
              <td>
                <input
                  type="text"
                  id="Mname"
                  name="Mname"
                  placeholder="이름 입력"
                /><span class="result"></span>
              </td>
            </tr>

            <tr>
              <td>
                <input
                  type="text"
                  id="Mphone"
                  name="Mphone"
                  placeholder="전화번호 입력"
                /><span class="result"></span>
              </td>
            </tr>

            <tr>
              <td id="Address">
                <input
                  type="text"
                  id="Madd"
                  name="Madd"
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
                  placeholder="주소"
                /><span class="result"></span><br />
                <input
                  type="text"
                  id="Madd3"
                  name="Madd3"
                  placeholder="상세주소"
                /><span class="result"></span>
              </td>
              <!-- <td><input type="text" id="Madd" name="Madd" placeholder="주소 입력"><span class="result"></span></td>  -->
            </tr>

            <tr>
              <td id="radioBox">
                <input type="radio" name="inputGender" value="w" />여자
                <input type="radio" name="inputGender" value="m" />남자
              </td>
            </tr>

            <tr>
              <td>
                <input type="checkbox" id="agreeCheck1" />SMS 수신에 동의
                합니다. <br />
                <p>
                  ※동의 시 이용약관, 개인정보 수집 및 이용에 동의 됨을
                  알려드립니다.
                </p>
              </td>
            </tr>
          </table>

          <div id="btn">
            <button type="button" onclick="back()">취소</button>
            <button onclick="e => movePage(e)" id="submit" class="chkId">
              회원가입
            </button>
          </div>
        </form>
      </div>
    </main>
    <%@include file="./footer.jsp" %>

    <script>
      //주소 검색
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

      //아이디 중복 확인
    </script>
  </body>
</html>
