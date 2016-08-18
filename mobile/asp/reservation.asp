<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/conn.asp" -->
<!--#include virtual="/include/loginchk.asp" -->
<!doctype asp>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/asp; charset=utf-8" />
<!--#include virtual="m/include/title.asp" -->
<link rel="stylesheet" href="css/framework.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/flyPanels.css">
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/respond.js"></script>
<script src="js/all.js"></script>
<script language="JavaScript">
<!--

    function conf_reservation(c_no, u_no) {

        $.ajax({
            url: "./reservation_ok.asp",
            data: { confno: c_no, uno: u_no },
            dataType: "json",
            async: true,
            error: function (xhr) {
                alert('서버통신 오류입니다');
            },
            success: function (data) {
                if (data.complete == "ok") {
                    alert('정상적으로 예약처리 되었습니다.');
                }
                else {
                    alert('예약과정에서 예기치 않은 오류가 발생하였습니다.');
                }
            }
        });

    }
//-->
</script>
</head>

<% 
    mSQL = "select confno,confdate,conftime,conftitle,confspeaker,confpic,confcv,confproduct "
	mSQL = mSQL & "from ehepa_conference_info as a where substring(confdate,1,4) = '" & year(date()) & "' and confyn='Y' order by confdate asc"

	rsConf = GetSQLExecute(mSQL) 
	if not isnull(rsConf) then
		for i=0 to UBound(rsConf,2)

			confno = rsConf(0,i)
			confdate = rsConf(1,i)
			conftime = rsConf(2,i)
			conftitle = rsConf(3,i)
			confspeaker = rsConf(4,i)
            confpic = rsConf(5,i)
            if len(confpic) > 0 then
                i_src = "/ufolder/conference/" & confpic
            else
                i_src = "/img/speaker/no-speaker.jpg"
            end if

            confcv = rsConf(6,i)
            confproduct = rsConf(7,i)
                                                       
%>
    <div id="speaker_p<%=i %>" class="speaker mfp-hide">
	    <div id="speakerWrapper"">
		    <div class="title">
			    <h1>연자정보</h1>
		    </div>
		    <div class="line"></div>
		    <div class="pop-speaker">
			    <img src="<%=i_src %>" alt="연자사진">
			    <!--  <img src="img/speaker/no-speaker.jpg" alt="연자사진 없을시"> -->
			    <%=confcv %>
		    </div>	
	    </div>
    </div>
    <!-- End speaker pop -->

    <!-- Start 예약확인 pop -->
	<div id="reservation-ok_p<%=i %>" class="reservation-ok mfp-hide">
		<div id="reservation-ok-Wrapper">
			<div class="title">
				예약하기
			</div>
			<div class="line"></div>
			<div class="pop-speaker">
				<div class="p-speaker">
					<ul>
						<li>
							<img src="<%=i_src %>" alt="연자사진">
							<div class="text">
								<%=mid(confdate,1,4) %>년 <%=mid(confdate,6,2) %>월 <%=mid(confdate,9,2) %>일 (<%=GetWeekDay(confdate) %>) <%=conftime %><br>
								<span><%=conftitle %></span><br>
								<%=confspeaker %>
							</div>
						</li>
					</ul>
					<p>해당 강의를 예약하시겠습니까?</p>
					<div class="btn">
						<a href="#" onclick="jacascript:conf_reservation('<%=confno %>','<%=Request.Cookies("UNo") %>');" class="green button popup-modal-close" alt="예약">예약</a><a href="#" class="grey button popup-modal-close" alt="취소">취소</a>
					</div>
				</div>
			</div>	
		</div>
	</div>
<% 
        next
    end if
%>
<body data-debug="true">

<div class="flypanels-container">

		<div class="offcanvas flypanels-right">
			<div class="panelcontent" data-panel="treemenu">
				<!--#include virtual="m/include/nav.asp" -->
			</div>
		</div>

		<div class="flypanels-main">
			<div id="header" class="flypanels-topbar">
				<a id="pop-register-modify" href="./"><img src="img/login-logo.png" alt="eHepa" class="login-logo"></a>
				<a class="flypanels-button-right" data-panel="treemenu" href="#"><i class="fa fa-bars"></i></a>
			</div>
			<div class="flypanels-content">


				<section>
				<div id="wrapper">
					<div id="sub-bg">
						<div class="titleWrapper">
							<div class="title">
								<ul>
									<li><h1>예약하기</h1></li>
									<li>향후 진행 예정인 e-Conference를 미리 예약하실 수 있습니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>

						<div class="contents">
							<div class="reseWrapper">
								<div class="c-title">
									강의일정 리스트
								</div>
								
                                <div class="c-speaker">
									<ul>
										<% 
                                        standard_date = date()

                                        'mSQL = "select confno,confdate,conftime,conftitle,confspeaker,confpic,confcv,confproduct "
	                                    'mSQL = mSQL & "from ehepa_conference_info as a where confdate like '" & search_date & "%' and confyn='Y' order by confdate asc"

	                                    'rsConf = GetSQLExecute(mSQL) 
	                                    if not isnull(rsConf) then
		                                    for i=0 to UBound(rsConf,2)

			                                    confno = rsConf(0,i)
			                                    confdate = rsConf(1,i)
			                                    conftime = rsConf(2,i)
			                                    conftitle = rsConf(3,i)
			                                    confspeaker = rsConf(4,i)
                                                confpic = rsConf(5,i)
                                                if len(confpic) > 0 then
                                                    i_src = "/ufolder/conference/" & confpic
                                                else
                                                    i_src = "/img/speaker/no-speaker.jpg"
                                                end if

                                                confcv = rsConf(6,i)
                                                confproduct = rsConf(7,i)

                                        %>
                                        <li>
											<div class="inner">
												<img src="<%=i_src %>" alt=""  width="108">
												<div class="text">
													<%=mid(confdate,1,4) %>년 <%=mid(confdate,6,2) %>월 <%=mid(confdate,9,2) %>일 (<%=GetWeekDay(confdate) %>) <%=conftime %><br>
									                <span><%=conftitle %></span><br>
									                <%=confspeaker %>
												</div>
											</div>
											<div class="btn">
                                                <%if cdate(confdate) < standard_date then %>
                                                <div class="button-desable">예약하기</div><%else %>
                                                    <%if cdate(confdate) = standard_date then %><a href="./participation.asp" class="green button">예약하기</a><%else %><a id="pop-reservation" href="#reservation-ok_p<%=i %>" class="green button">예약하기</a><%end if %>
                                                <%end if %>                   
                                                <%if len(trim(confcv)) > 0 then%><a id="pop-speaker" href="#speaker_p<%=i %>" class="grey button">연자정보 / CV </a><%else %><div class="button-desable">연자정보 / CV </div><%end if %>
											</div>
										</li>
										<% 
                                            next
                                        end if
                                        %>
									</ul>
								</div>
							</div>
						</div> 

					</div>
				</div><!-- /#wrapper -->
				</section>


				<!--#include virtual="m/include/footer.asp" -->

			</div><!-- /.flypanels-content -->

		</div><!-- /.flypanels-main -->

</div><!-- /.flypanels-container -->

<script src="js/kitUtils.js"></script>
<script src="js/jquery.flypanels.js"></script>
<script src="js/fastclick.min.js"></script>
<script>
	$(document).ready(function(){
		$('.flypanels-container').flyPanels({
			treeMenu: {
				init: true
			},
		});
		FastClick.attach(document.body);
	});
</script>
<% 
Function GetWeekDay(mDate)
dim mDay

	mDay = DatePart("w",mDate)
	
	select case mDay & ""
	case "1"
		GetWeekDay = "<font color=red>일</font>"
	case "2"
		GetWeekDay = "월"
	case "3"
		GetWeekDay = "화"
	case "4"
		GetWeekDay = "수"
	case "5"
		GetWeekDay = "목"
	case "6"
		GetWeekDay = "금"
	case "7"
		GetWeekDay = "<font color=blue>토</font>"
	end select
End Function

Function GetLastDay(nYYYY,nMM)	'존재하는 일자 계산(일자보정) : 최종
dim yy
dim mm
dim dd
		
	yy		= Cint(nYYYY) 
   	mm		= Cint(nMM) 

   	select case mm
   	case 2
   		if (yy mod 4) = 0 then
			dd = 29
		else
			dd = 28
		end if
	case 4, 6, 9, 11
		dd = 30
	case else
		dd = 31
	end select
			
	GetLastDay = dd
		
End  Function

function LastDay(nYYYY,nMM)
dim i
dim sDate
dim tDate
			
	sDate = CStr(nYYYY) & "-" & CStr(nMM) & "-27"
	for i=1 to 10
		tDate = CDate(sDate) + i
		if Day(tDate)=1 Then
			LastDay = Day(tDate - 1)
			exit For
		end If
	next
end function
%>

</body>
</html>


