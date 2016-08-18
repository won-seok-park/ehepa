<!doctype asp>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/asp; charset=utf-8" />
<!--#include virtual="m/include/title.asp" -->
<link rel="stylesheet" href="css/framework.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/all.js"></script>
<style>
asp,body {
	margin:0;padding:0;height:100%; position: relative; font-size: 13px; color:#333;
	background: #000000 url("img/loginBg.jpg") no-repeat center center; 
	background-size: cover;
	margin: 0px;
	padding: 0px;
}
</style>

<%
    if len(Request.Cookies("UNo")) > 0 then
		Response.Redirect "/m/index.asp"
	end if

    erroryn = request("erroryn")

    if erroryn = "Y" then
%>
<script language="JavaScript">

    alert("이메일 또는 비밀번호를 확인해 주십시오.");

</script>
<%
    elseif erroryn = "N" then
%>
<script language="JavaScript">

    alert("인증된 사용자가 아닙니다.");

</script>
<%
    end if
%>

<script language="JavaScript">
<!--

    function SiteLogin() {

        var form = document.login;

        var Regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        var UEmail = form.UEmail.value;
        var UPWD = form.UPWD.value;

        if (UEmail == "") {
            alert("이메일 주소를 기입해 주십시오.");
            form.UEmail.focus();
            return;
        }

        if (Regex.test(UEmail) === false) {
            alert("잘못된 형식의 이메일 주소입니다.");
            form.UEmail.focus();
            return;
        }

        if (UPWD == "") {
            alert("비밀번호를 확인 해 주세요!.");
            document.login.UPWD.focus();
            return;
        }

        if (UPWD.length < 4 || UPWD.length > 12) {
            alert("사용할 비밀번호는 4~12자리입니다!!!");
            form.UPWD.focus();
            return;
        }

        if (form.saveinfo.checked) {
            SetCookieExpire("ON_ID", form.UEmail.value, 365);
            SetCookieExpire("ON_PWD", form.UPWD.value, 365);
        }
        else {
            DeleteCookie("ON_ID");
            DeleteCookie("ON_PWD");
        }

        form.action = "./loginok.asp";
        form.submit();
    }

    function KeyEnter() {
        if (event.keyCode == 13) {
            SiteLogin();
        }
    }

    function SetFocus() {
        var form = document.login;

        form.UEmail.value = GetCookie("ON_ID");
        if (form.UEmail.value != "") {
            form.saveinfo.checked = true;

            form.UPWD.value = GetCookie("ON_PWD");
            /*
            if (form.UPWD.value == "") {
            form.UPWD.focus();
            }            
            } else {
            form.UEmail.focus();*/
        }
    }

    function SetCookieExpire(name, value, days) {
        var expire = new Date();
        expire.setTime(expire.getTime() + (1000 * 60 * 60 * 24 * days));

        document.cookie = name + "=" + value + "; path=/; domain=www.ehepa.co.kr; expires=" + expire.toGMTString();
    }

    function DeleteCookie(name) {

        if (GetCookie(name)) {
            var expire = new Date();
            expire.setTime(expire.getTime() - 1);

            document.cookie = name + "=; path=/; www.ehepa.co.kr; expires=" + expire.toGMTString();
        }
    }

    function GetCookie(name) {
        var arg = name + "=";
        var alen = arg.length;
        var clen = document.cookie.length;
        var i = 0;

        while (i < clen) {
            var j = i + alen;
            if (document.cookie.substring(i, j) == arg)
                return getCookieVal(j);

            i = document.cookie.indexOf(" ", i) + 1;
            if (i == 0) break;
        }

        return "";
    }

    function getCookieVal(offset) {
        var endstr = document.cookie.indexOf(";", offset);
        if (endstr == -1)
            endstr = document.cookie.length;

        return document.cookie.substring(offset, endstr);
    }

//-->
</script>

</head>

<body  onload="javascript:SetFocus();">
<div id="loginwrapper">
<div id="loginHeader">
	<img src="img/login-logo.png" alt="eHepa" class="login-logo">
	<img src="img/logo-bms.png" alt="Bristol-Myers Squibb" class="login-BMSlogo">
</div>
<div id="loginContentsWrapper">
	<div class="loginContents">
		<form name="login" method="post">
        <div class="title"><img src="img/login-text.png" alt="Welcome to e-Hepa Academy"></div>
			<ul>
				<li><input type="text" name="UEmail" maxlength="40" style="width:100%;" placeholder="Email"></li>
				<li><input type="password" name="UPWD" maxlength="30" style="width:100%;" placeholder="Password"></li>
				<li><label><input type="checkbox" type="checkbox" name="saveinfo"> Save Email/Password</label></li>
				<li class="login-button"><a href="javascript:SiteLogin();" class="grey loginbutton" style="width:100%;">Log In</a></li>
			</ul>
        </form>
	</div>
	<div class="loginRegister">
		<ul>
			<li><a href="register01.asp" class="grey loginbutton" style="width:100%;">Register</a></li>
			<li><a href="id-search.asp" class="grey loginbutton" style="width:100%;">Find Email/Password</a></li>
		</ul>
	</div>
</div>
<div id="loginFooter">
	&copy; <%=Year(date()) %> BMS e-Hepa Academy  All rights reserved.
</div>

</div><!-- /#wrapper -->


</body>
</html>

