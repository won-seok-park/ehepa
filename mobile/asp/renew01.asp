<!doctype asp>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/asp; charset=utf-8" />
<!--#include virtual="m/include/title.asp" -->
<link rel="stylesheet" href="css/framework.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.placeholder.min.js"></script>
<script src="js/all.js"></script>
<script language="javascript"> 
	<!--
    function emailCheck() {
        var form = document.register;
        var Regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        var UEmail = document.getElementById('UEmail').value;
        var UNo = document.getElementById('UNo').value;

        if (UEmail == "") {
            alert("이메일 주소를 기입해 주십시오.");
            document.getElementById('UEmail').focus();
            return;
        }

        if (Regex.test(UEmail) === false) {
            alert("잘못된 이메일 형식입니다.");
            return;
        }

        $.ajax({
            url: "/api/email_clean_chk.asp",
            data: { UEmail: UEmail, UNo: UNo },
            dataType: "json",
            async: true,
            error: function (xhr) { alert('서버통신 오류입니다'); },
            success: function (data) {
                if (data.complete == "_complete") {
                    form.action = "./renew02.asp";
                    form.submit();
                } else {
                    alert('동일한 이메일주소를 사용하는 사용자가 존재합니다.');
                }
            }
        });
    }
    //-->
</script>
</head>

<body>

<div id="header">
	<img src="img/login-logo.png" alt="eHepa" class="login-logo">
	<img src="img/logo-bms.png" alt="Bristol-Myers Squibb" class="login-BMSlogo">
</div>

<section>
<div id="wrapper">
	<div id="sub-bg">
		<div id="registerWrapper">
			<div class="title">
				<ul>
					<li>Register</li>
				</ul>
			</div>
			<div class="line"></div>
			<div class="wrapper">
				<div class="text">
					안녕하세요, <%=Request.Cookies("t_UNm") %> 선생님.<br>
					간염에 대한 최신 지견 및  포괄적인 환자 교육 컨텐츠를 제공하여, 선생님의 진료에 도움이 되고자
					e-Bara가 e-Hepa Academy로 새롭게 업그레이드 되어 찾아 뵙습니다.
				</div>
				<form name="register" method="post">
                <div class="register">
					e-Hepa Academy에서 사용을 원하시는 이메일 주소를 입력해 주십시오. 
					<input type="text" name="UEmail" id="UEmail" value="<%=Request.Cookies("t_UEmail") %>" style="width:100%;" placeholder="이메일주소를 입력해 주십시오.">
                    <input type="hidden" name="UNo" id="UNo" value="<%=Request.Cookies("t_UNo") %>" />
                    <input type="hidden" name="UNm" id="UNm" value="<%=Request.Cookies("t_UNm") %>" />
				</div>
                </form>
			</div>
			<div class="btn">
				<a href="javascript:emailCheck();" class="green button">확인</a><a href="./login.asp" class="grey button">취소</a>
				<!--<a href="#" class="grey button m10" style="width:100%;">기존 이메일찾기</a>//-->
			</div>
			<div class="m30"></div>
		</div>
	</div>
</div><!-- /#wrapper -->
</section>

<!--#include virtual="m/include/footer.asp" -->

</body>
</html>

