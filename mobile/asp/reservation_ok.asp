<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/conn.asp" -->

<%
dim mBool
dim mSQL

	uno = Request("uno")
    confno = Request("confno")
	
    msql = "select attno from ehepa_conference_attendance where confno='" & confno & "' and uno='" & uno & "'"
    rsCheck = getsqlexecute(msql)

    if not isnull(rsCheck) then

    else
        mdate = date
        upoint = 500

        msql = "insert into ehepa_conference_attendance(uno,confno,ustatus,attdd) values('" & uno & "','" & confno & "','N',getdate())!@!"
        mSQL = mSQL & "insert into ehepa_point_info(uno,pgroup,pkey,upoint,umemo,pdd) values('" & uno & "','Conference','" & confno & "','" & upoint & "','e-Conference 예약',getdate())!@!"
        mSQL = mSQL & "update ehepa_member_info set upoint=isnull(upoint,0)+" & upoint & " where uno='" & uno & "'"

        mBool = setsqlbatchexecute(mSQL)

    end if    
%>
 {"complete": "ok"}