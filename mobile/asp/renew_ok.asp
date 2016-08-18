<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/conn.asp" -->

<%
dim rsValue
dim mSQL

	uno = Replace(Request("uno"),"'","''")
    uemail = Replace(Request("uemail"),"'","''")
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

	if len(uno) > 0 then	
        msql = "update ehepa_member_info set "
        msql = msql & "uemail='" & uemail & "',"
        msql = msql & "unm='" & unm & "',"
        msql = msql & "upwd='" & upwd & "',"
        msql = msql & "umbl='" & umbl & "',"
        msql = msql & "uhosp='" & uhosp & "',"
        msql = msql & "uaddr='" & uaddr & "',"
        msql = msql & "uaddr2='" & uaddr2 & "',"
        msql = msql & "Uzip='" & Uzip & "',"
        msql = msql & "ugroup='" & ugroup & "',"
        msql = msql & "upnob='" & uupno & "',"
        msql = msql & "uyn='" & uyn & "',"
        msql = msql & "uchkyn='" & uchkyn & "',"
        msql = msql & "uindd=getdate() "
        msql = msql & "where uno='" & uno & "'"
        mBOOL = SetSQLExecute(mSQL)
    
        Session("UNo") = uno
		Response.Cookies("UNo") = Session("UNo")
		
        Session("UNm") = unm
		Response.Cookies("UNm") = Session("UNm")

		Session("UEmail") = uemail
		Response.Cookies("UEmail") = Session("UEmail")
		
		Session("UGroup") = ugroup
		Response.Cookies("UGroup") = Session("UGroup")
    
	    GoUrl = "./index.asp"
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
<% 
    end if
%>