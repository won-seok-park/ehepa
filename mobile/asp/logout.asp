<%
	Session("UNo") = ""
	Response.Cookies("UNo") = ""
	Session("UNm") = ""
	Response.Cookies("UNm") = ""
    Session("UEmail") = ""
	Response.Cookies("UEmail") = ""
    Session("UGroup") = ""
	Response.Cookies("UGroup") = ""
	Session.Abandon 
%>
<body onload="go();">
	<form name="nextstep" method="post"></form>

	<script language="javascript">
	<!--
	function go() {
		document.location.href="/m/login.asp";
	}
	//-->
	</script>
</body>
