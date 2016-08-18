<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/conn.asp" -->

<%
dim rsValue
dim mBool
dim mSQL

	categoryid = Trim(Request("categoryid"))
	acano = Trim(Request("acano"))
  acaurl = Trim(Request("acaurl"))
  vodid   = Trim(Request("vodid"))
	
    '####포인트
    'mdate = date
    'upoint = 400
    'mSQL = "select pno from ehepa_point_info where uno='" & Request.Cookies("UNo") & "' and pgroup='Academia' and pkey='" & acano & "'"
    'rsCheck = getsqlexecute(mSQL)
    '
    'if isnull(rsCheck) then
    '    mSQL = "insert into ehepa_point_info(uno,pgroup,pkey,upoint,umemo,pdd) values('" & Request.Cookies("UNo") & "','Academia','" & acano & "','" & upoint & "','게시물확인',getdate())!@!"
    '    mSQL = mSQL & "update ehepa_member_info set upoint=isnull(upoint,0)+" & upoint & " where uno='" & Request.Cookies("UNo") & "'"
    '
    '    mBool = setsqlbatchexecute(mSQL)
    'end if
            
	'Response.Redirect acaurl
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=0.9, user-scalable=1.0">
<title>e-Hepa Academy</title>
</head>
<body style="text-align:center;vertical-align: middle;">
<iframe width="100%" src="http://play.wecandeo.com/video/v/?key=<%=vodid%>" frameborder="0" allowfullscreen></iframe>	
	
</body>