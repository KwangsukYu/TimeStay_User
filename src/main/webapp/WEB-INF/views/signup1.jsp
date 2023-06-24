<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="./navigation.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 가입</title>
    <link rel="stylesheet" href="<%= BASE_URL %>resources/css/signup1.css"/>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!--jquery 3.6 적용-->
	
	<script type="text/javascript">
		$(function(){
			$("#checkALL").click(function(){
				if ($("#checkALL").prop("checked"))
					{
						$(".test").prop("checked", true);
					}
				else
					{
						$(".test").prop("checked", false);
					}
			});
			
			$(".test").click(function()
				{
					if($("input[name='check']:checked").length == 2)
						{
							$("#checkALL").prop("checked", true);
						}
					else
						{
							$("#checkALL").prop("checked", false);
						}
				});
		});
		
		function movePage()
		{
			if ($("input[name='check']:checked").length == 2)
				{
					location.href = '<%= BASE_URL %>user/signup_info';
				}
			else
				{
					alert("모든 항목에 동의해야 합니다.");
				}
		};
	</script>
</head>
<body>
    </header>
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

        <div id="terms">
            <table>
                <tr>
                    <td>회원가입 약관</td>
                </tr>

                <tr>
                    <td><textarea readonly="readonly">제1조 (목 적) &#10;본 약관은 로쏘(주)가 운영하는 성심당몰(이하 “회사”라 한다.)이 인터넷상에서 제공하는 모든 서비스(이하 "서비스"라 하며, 접속 가능한 유무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다.)를 이용함에 있어 회원과 회사간의 권리, 의무 및 책임사항 및 절차를 규정함을 목적으로 합니다.</textarea>
                    </td>
                </tr>

                <tr>
                    <td id="textcheck">구매 이용 약관에 동의합니다.<input type="checkbox" class="test" name="check"></td>
                </tr>

                <tr>
                    <td>개인정보처리방침안내</td>
                </tr>

                <tr>
                    <td>
	                    <textarea readonly="readonly">성심당몰은(이하 ‘당사’) 회원의 개인정보를 매우 중요시 하며, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보보호법을 준수하고 있습니다. &#10;당사는 개인정보취급방침을 통하여 회원이 제공한 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. &#10;1. 개인정보의 수집 및 이용 목적 &#10;① 당사는 회원에게 다양한 서비스를 제공하기 위해 아래와 같은 개인정보를 수집하고 있습니다. 단, 회원의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)와 주민등록번호는 법령상 근거 없이 불필요하게 수집하지 않습니다.</textarea>
                    </td>
                </tr>

                <tr>
                    <td id="textcheck">개인정보 수집/이용약관에 동의합니다.<input type="checkbox" class="test" name="check"></td>
                </tr>

                <tr>
                    <td id="textcheck">위의 모든 이용약관에 동의합니다.<input type="checkbox" class="test" name="checkALL" id="checkALL"></td>
                </tr>
            </table>

            <!-- <button onclick="location.href='<%=request.getContextPath()%>/Member/signup2.do'">확인</button>  -->
            <button onclick="movePage()">확인</button>
        </div>


    </main>
    <%@include file="./footer.jsp" %>
    <script>
    
    </script>
    
</body>
</html>