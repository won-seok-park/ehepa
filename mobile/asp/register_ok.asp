<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/conn.asp" -->

<%
dim objdb
dim rsValue
dim mSQL

    uemail = Replace(Request("UEmail"),"'","''")
    unm = Replace(Request("unm"),"'","''")
	upwd = Replace(Request("upwd0") ,"'","''")
    umbl = Replace(Request("umbl0") & "-" & Request("umbl1") & "-" & Request("umbl2") ,"'","''")
	uhosp = Replace(Request("uhosp") ,"'","''")
    uaddr = Replace(Request("uaddr") ,"'","''")
    uaddr2 = Replace(Request("uaddr2") ,"'","''")
    Uzip = Replace(Request("Uzip") ,"'","''")
    UUpNo = Replace(Request("UUpNo") ,"'","''")

	ugroup = "AE"
	uyn = "Y"
    uchkyn = "Y"
	
	if len(uemail) > 0 then	
	    msql = "insert into ehepa_member_info(uemail,unm,upwd,umbl,uhosp,uaddr,uaddr2,Uzip,ugroup,upnob,uyn,uchkyn,uindd) values ('"
	    msql = msql & uemail & "','" & unm & "','" & upwd & "','" & umbl & "','" & uhosp & "','" & uaddr & "','" & uaddr2 & "','" & Uzip & "','" & ugroup & "','" & upnob & "','" & uyn & "','" & uchkyn & "',getdate())"
	    mBOOL = SetSQLExecute(mSQL)

        GoUrl = "./logout.asp"
%>

<!doctype html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<body onload="go();">
	<form name="Register" method="post" action="<%=GoUrl%>">
        <!--<input type="hidden" name="UsrGroup" value="<%=UsrGroup%>">//-->
    </form>
	<script language="javascript">
	<!--
	function go() {
		//alert("정상적으로 가입 되었습니다. 가입 승인 안내 페이지로 이동합니다.");
		Register.submit();		
	}
	//-->
	</script>
</body>
<%end if %>