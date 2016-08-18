<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/conn.asp" -->

<%
dim rsValue
dim mBool
dim mSQL

	UEmail = Trim(Request("UEmail"))
	UPWD = Trim(Request("UPWD"))
	
	'####회원등급에 따른 페이지 전환
	mSQL = "select UNo,UNm,UEmail,UGroup,isnull(UChkYN,'N') from ehepa_member_info where UEmail='" & UEmail & "' And UPWD='" & UPWD & "' And ugroup='AE' and uyn='Y'"
	rsValue = GetSQLExecute(mSQL)
	
	if not isnull(rsValue) then

		UGroup = rsValue(3,0)
        UChkYN = rsValue(4,0)

        if UGroup = "AA" or UGroup = "AD" then
            UChkYN = "Y"
        end if

        if UChkYN = "Y" then
            Session("UNo") = rsValue(0,0)
		    Response.Cookies("UNo") = Session("UNo")
		
            Session("UNm") = rsValue(1,0)
		    Response.Cookies("UNm") = Session("UNm")

		    Session("UEmail") = rsValue(2,0)
		    Response.Cookies("UEmail") = Session("UEmail")
		
		    Session("UGroup") = rsValue(3,0)
		    Response.Cookies("UGroup") = Session("UGroup")

		    mSQL = "Insert Into ehepa_login_info(uno,lip,ldd) Values('" & Request.Cookies("UNo") & "','" & Request.ServerVariables("REMOTE_ADDR") & "',getdate())"
		    mbool = SetSQLExecute(mSQL)
		
            if UGroup = "AA" then
		        mUrl = "'/index.asp"
            else 
                mUrl = "./index.asp"

                'if UGroup = "AE" then
                    '####포인트
                    mdate = date
                    upoint = 300
                    mSQL = "select pno from ehepa_point_info where uno='" & Request.Cookies("UNo") & "' and pgroup='Login' and pkey='" & mdate & "'"
                    rsCheck = getsqlexecute(mSQL)

                    if isnull(rsCheck) then
                        mSQL = "insert into ehepa_point_info(uno,pgroup,pkey,upoint,umemo,pdd) values('" & Request.Cookies("UNo") & "','Login','" & mdate & "','" & upoint & "','로그인',getdate())!@!"
                        mSQL = mSQL & "update ehepa_member_info set upoint=isnull(upoint,0)+" & upoint & " where uno='" & Request.Cookies("UNo") & "'"

                        mBool = setsqlbatchexecute(mSQL)
                    end if
                'end if
            end if

        else
            Session("t_UNo") = rsValue(0,0)
		    Response.Cookies("t_UNo") = Session("t_UNo")

            Session("t_UNm") = rsValue(1,0)
		    Response.Cookies("t_UNm") = Session("t_UNm")

		    Session("t_UEmail") = rsValue(2,0)
		    Response.Cookies("t_UEmail") = Session("t_UEmail")

            if UGroup = "AD" then
		        mUrl = "./index.asp"
            else 
                mUrl = "./renew01.asp" 
            end if
            
        end if
	else
		mUrl = "./login.asp?ErrorYN=Y" 
	end if

	Response.Redirect mUrl

%>