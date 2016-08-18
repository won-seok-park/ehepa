<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include virtual="m/include/title.asp" -->
<link rel="stylesheet" href="css/framework.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.placeholder.min.js"></script>
<script src="js/all.js"></script>
<script language="JavaScript">
<!--
    function emailCheck() {
        var form = document.register;
        var Regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        var UEmail = document.getElementById('UEmail0').value;

        if (UEmail == "") {
            alert("이메일 주소를 기입해 주십시오.");
            //document.getElementById('pop-register2').setAttribute('href','#registerpop1');
            document.getElementById('UEmail0').focus();
            return;
        }

        if (Regex.test(UEmail) === false) {
            alert("잘못된 이메일 형식입니다.");
            //document.getElementById('pop-register2').setAttribute('href', '#registerpop1');
            return;
        }

        $.ajax({
            url: "/api/email_register_chk.asp",
            data: { UEmail: UEmail },
            dataType: "json",
            async: true,
            error: function (xhr) { alert('서버통신 오류입니다'); },
            success: function (data) {
                if (data.complete == "_complete") {
                    form.action = "./register02.asp";
                    form.submit();
                } else {
                    alert('동일한 이메일주소를 사용하는 사용자가 존재합니다.');
                }
            }
        });
    }

    function emailDouble() {

        var Regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        var UEmail = document.getElementById('UEmail0').value;

        if (UEmail == "") {
            alert("이메일 주소를 기입해 주십시오.");
            //document.getElementById('pop-register2').setAttribute('href', '#registerpop1');
            document.getElementById('UEmail0').focus();
            return;
        }

        if (Regex.test(UEmail) === false) {
            alert("잘못된 이메일 형식입니다.");
            document.getElementById('pop-register2').setAttribute('href', '#registerpop1');
            return;
        }

        $.ajax({
            url: "/api/email_register_chk.asp",
            data: { UEmail: UEmail },
            dataType: "json",
            async: true,
            error: function (xhr) { alert('서버통신 오류입니다'); },
            success: function (data) {

                if (data.complete == "_complete") {
                    alert('사용가능한 이메일 주소입니다. 확인을 누루시고 회원가입을 진행 해 주세요. ');

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
				<form name="register" method="post">
                <div class="text">
					안녕하세요, 선생님.<br>
					한국BMS제약의 e-Hepa Academy에 참여해 주셔서 감사합니다.
					B형, C형 간염 관련 양질의 최신 정보를 전달 드릴 수 있도록 지속적으로 노력하겠습니다.
				</div>
				<div class="register">
					ID로 사용 할 이메일 주소를 입력해 주십시오.
					<input type="text" name="UEmail0" id="UEmail0" style="width:100%;" placeholder="이메일 주소를 기입해 주십시오.">
					<a href="javascript:emailDouble();" class="grey button3">이메일 중복 확인</a>
				</div>
                </form>
			</div>
			<div class="btn">
				<a href="javascript:emailCheck();" class="green button">확인</a><a href="./login.asp" class="grey button">취소</a>
			</div>
			<div class="m30"></div>
		</div>
	</div>
</div>
</div><!-- /#wrapper -->
</section>

<!--#include virtual="m/include/footer.asp" -->

</body>
</html>

