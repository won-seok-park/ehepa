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
<script type="text/javascript">
   $(document).ready(function() {
		$(".tabContent").not(":first").hide(); 
		$("ul.tabs li:first").addClass("active").show();  	
		$("ul.tabs li").click(function() {
			$("ul.tabs li.active").removeClass("active"); 
			$(this).addClass("active"); 
			$(".tabContent").hide();		
			$($('a',this).attr("href")).fadeIn('slow'); 		
			return false;
		});
	});
</script>
</head>

<body data-debug="true">
<%
dim mSQL
dim mBOOL
dim rsValue

    categoryid = "06"
    'select case categoryid
    'case "01"
    '    categorynm = "약품정보"
    'case "02"
    '    categorynm = "최신저널"
    'case "03"
    '    categorynm = "학회간행물"
    'case "04"
    '    categorynm = "환자교육자료"
    'case "05"
    '    categorynm = "치료지침"
    'case "06"
    '    categorynm = "주요학회일정"
    'end select
%>
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
									<li><h1>주요학회일정</h1></li>
									<li>국내외에서 진행하는 간염 관련 학회 스케줄을 확인하실 수 있습니다.</li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>
                        <% 
                        s_month = Request("s_month")
                        s_year = Request("s_year")

                        '#### 달이 변경되도록 하는 모듈
                        if len(s_month) = 0 then
                            standard_date = date()
                        else
                            standard_date = cdate(s_year & "-" & s_month & "-01")
                        end if

                        this_month = month(standard_date)
                        this_year = year(standard_date)

                        if len(s_month) = 0 then
                            s_month = this_month
                            s_year = this_year
                        end if

           
                        next_month = month(dateadd("m",1,standard_date))
                        next_year = year(dateadd("m",1,standard_date))

                        prev_month = month(dateadd("m",-1,standard_date))
                        prev_year = year(dateadd("m",-1,standard_date))

                        if cint(s_month) < 10 then
                            search_date = s_year & "-0" & s_month
                        else
                            search_date = s_year & "-" & s_month
                        end if
                        %>
						<div class="contents">
							<div class="scheduleWrapper">
								<div class="s-calendar">
									<a class="btn_left" href="./schedule.asp?s_year=<%=prev_year %>&s_month=<%=prev_month %>"><i class="fa fa-chevron-left"></i></a>
									<a class="btn_right" href="./schedule.asp?s_year=<%=next_year %>&s_month=<%=next_month %>"><i class="fa fa-chevron-right"></i></a>
									
                                    <% 
                                    dim nWidth,nHeight			'테이블의 크기	
                                    dim nTopHeight				'요일 출력박스 높이

                                    dim nStartWeek,nLastDay		'시작요일/종료일
                                    dim dFirstDate,dLastDate	'시작일/종료일
                                    dim ssYear,ssMonth,ssDay		'처리할 날짜

                                    dim sNextYear,sNextMonth	'다음 년/월
                                    dim sPreYear,sPreMonth		'이전 년/월

                                    dim sWorkDate				'처리할 날짜(완성된)
                                    dim nRecCount,i,j,nTmp
                                    dim sDaySchedule(31)		'한달치 스케줄 저장 배열

                                    dim sWeekText(2)			'종류별 요일 배열
                                    dim sWeekCaption(7)			'뿌려줄 요일 문자
                                    dim nWeekIndex				'요일의 Index
                                    dim nStep					'For Loop Step
                                    dim DisplayDay				'화면에 보일 날짜

                                    dim nWeekLine				'한달에 몇주가 필요한지
                                    dim sDayColor				'날짜색상 (평일/토/일)


	                                    nWidth = 250
	                                    nHeight = 100
	                                    nWeekIndex = 2	'0=한글 / 1=한자 / 2=영문 (바꾸어 보세요)
                                       '******************************************************************************* 표시 변수 선언 끝

	                                    sWeekText(0) = "일월화수목금토"
	                                    sWeekText(1) = "日月火水木金土"
	                                    sWeekText(2) = "SUNMONTUEWEDTHUFRISAT"
    	
	                                    nStep = 0
	                                    if nWeekIndex = 0 Or nWeekIndex = 1 then nTmp = 1 else nTmp=3
	                                    for i=1 to (6 * nTmp)+1 Step nTmp
		                                    sWeekCaption(nStep) = Mid(sWeekText(nWeekIndex),i,nTmp)
		                                    nStep = nStep +1
	                                    next
                                       '******************************************************************************* 요일처리 끝
    	
	                                    ssYear = s_year
	                                    ssMonth = s_month
    	
	                                    sWorkDate = ssYear & "-" & ssMonth & "-" & ssDay
	                                    dFirstDate = CDate(ssYear & "-" & ssMonth & "-01")
    	
	                                    nStartWeek = WeekDay(dFirstDate)
	                                    nLastDay = LastDay(ssYear,ssMonth)
    	
	                                    dLastDate = CDate(ssYear & "-" & ssMonth & "-" & CStr(nLastDay))
                                       '******************************************************************************* 이것저것 처리 끝

	                                    nTmp = nStartWeek + nLastDay - 1
	                                    if nTmp > 35 then nWeekLine = 6 else nWeekLine = 5		'필요한 월별 라인수 계산
	                                    'Response.Write nWeekLine & "줄이 필요 " & nTmp & " <br>"
                                       '******************************************************************************* 몇주가 필요한지 처리 끝
    		
	                                    for i=1 to 31
		                                    sDaySchedule(i) = ""
	                                    next
    		
	                                    mYear = Year(Date) + 1
    	
    		
	                                    if len(ssMonth) = 1 then mViewMon = "0"
    	
	                                    sSearchDate = ssYear & "-" & mViewMon & ssMonth
    	
                                    %> 
                                    
                                    <table class="s-calendar_table">
									<caption><%=s_year %> <h1><%=s_month %></h1></caption>
										<thead>
											<tr>
												<td>Sun</td>
												<td>Mon</td>
												<td>Tue</td>
												<td>Wed</td>
												<td>Thu</td>
												<td>Fri</td>
												<td>Sat</td>
											</tr>
										</thead>
										
                                        
                                        <tbody>
								            <%		
		                                    nTmp = 0
		                                    for i = 1 to nWeekLine
			                                    Response.Write "<tr>"
			                                    for j=1 to 7
				                                    sDayColor = "#ffffff"
				                                    sWriteColor = "#808080"
    				
				                                    nTmp = nTmp + 1
				                                    DisplayDay = nTmp - nStartWeek + 1
    				
			                                        Response.Write "<td>"

                                                    '상단 우측 정리
				                                    if nTmp => nStartWeek and DisplayDay <= nLastDay then

                                                        ViewDay = ""
				                                        ViewMon = ""
    					
				                                        if len(ssMonth) = 1 then ViewMon = "0"
				                                        if len(DisplayDay) = 1 then ViewDay = "0" 
    				    
				                                        CalendarDate = ssYear & "-" & ViewMon & ssMonth & "-" & ViewDay & DisplayDay
    				    
				                                        mSQL = "select acatitle,acatype,acafile1 from ehepa_academia_info where categoryid='" & categoryid & "' and acasdate = '" & CalendarDate & "'and acayn='Y'"
					                                    reCheck = GetSQLExecute(mSQL)
					                                    if not isnull(reCheck) then
					                                        if reCheck(1,0) = "A" then
                                                      %>
                                                      <span><i class="color01 fa fa-circle"></i></span><%=DisplayDay %>
                                                      <%
                                                            else
                                                      %>
                                                      <span><i class="color02 fa fa-circle"></i></span><%=DisplayDay %>
                                                      <%
                                                            end if
				                                        else
					                                        Response.Write  DisplayDay 
					                                    end if

				                                    end if

				                                    Response.Write "</td>"
					
			                                    next 
                                                Response.Write "</tr>"
		                                    next 
                                        %> 

							            </tbody>
                                        
									</table>
									<div class="c_comment">
										<i class="color01 fa fa-circle"></i> 국내학회일정 <i class="color02 fa fa-circle"></i> 해외학회일정
									</div>
								</div><!-- End s-calendar -->


								<div class="s-listWrapper">
									<div class="s-calendar-Tabs">
										<ul class="tabs">
											<li><a href="#tab1">국내</a></li>
											<li><a href="#tab2">해외</a></li>
										</ul>
									</div>
									<div class="s-list">
										<div class="tabContainer">
											<div id="tab1" class="tabContent">
												<ul>
													<% 
                                                    mSQL = "select acano,acatitle,acaauthor,acasource,acapic,acasdate,acaedate,acatype,acafile1,acafile2 "
	                                                mSQL = mSQL & "from ehepa_academia_info AS A where categoryid='" & categoryid & "' and (acasdate like '%" & search_date & "%' and acaedate like '%" & search_date & "%') and acatype='A' and acayn='Y'"


	                                                rsValue = GetSQLExecute(mSQL) 
	                                                if not isnull(rsValue) then
		                                                for i=0 to UBound(rsValue,2)

			                                                acano = rsValue(0,i)
			                                                acatitle = rsValue(1,i)
			                                                acaauthor = rsValue(2,i)
			                                                acasource = rsValue(3,i)
			                                                acapic = rsValue(4,i)
                                                            acasdate = rsValue(5,i)
                                                            acaedate = rsValue(6,i)
                                                            acatype = rsValue(7,i)
                                                            acafile1 = rsValue(8,i)
                                                            acafile2 = rsValue(9,i)
                                                    %>
                                                    <li>
										                학회명 : <a href="#"><%=acatitle %></a><br>
										                일시 :  <%=acasdate %>(<%=GetWeekDay(acasdate) %>)<%if len(acaedate) > 0 then %> ~ <%=acaedate %>(<%=GetWeekDay(acaedate) %>)<%end if %><br>
										                장소 : <%=acasource %> <%if len(acafile1) > 0 then %><a href="<%=acafile1 %>" target="_new">[바로가기]</a><%end if %>
									                </li>
									                <% 
                                                        next
                                                    else
                                                    %>
									                <li>
										                국내학회일정 정보가 존재하지 않습니다.
									                </li>
                                                    <% 
                                                    end if
                                                    %>
												</ul>
											</div>
											<div id="tab2" class="tabContent">
												<ul>
													<% 
                                                    mSQL = "select acano,acatitle,acaauthor,acasource,acapic,acasdate,acaedate,acatype,acafile1,acafile2 "
	                                                mSQL = mSQL & "from ehepa_academia_info AS A where categoryid='" & categoryid & "' and (acasdate like '%" & search_date & "%' and acaedate like '%" & search_date & "%') and acatype='B' and acayn='Y'"


	                                                rsValue = GetSQLExecute(mSQL) 
	                                                if not isnull(rsValue) then
		                                                for i=0 to UBound(rsValue,2)

			                                                acano = rsValue(0,i)
			                                                acatitle = rsValue(1,i)
			                                                acaauthor = rsValue(2,i)
			                                                acasource = rsValue(3,i)
			                                                acapic = rsValue(4,i)
                                                            acasdate = rsValue(5,i)
                                                            acaedate = rsValue(6,i)
                                                            acatype = rsValue(7,i)
                                                            acafile1 = rsValue(8,i)
                                                            acafile2 = rsValue(9,i)
                                                    %>
                                                    <li>
										                학회명 : <a href="#"><%=acatitle %></a><br>
										                일시 :  <%=acasdate %>(<%=GetWeekDay(acasdate) %>)<%if len(acaedate) > 0 then %> ~ <%=acaedate %>(<%=GetWeekDay(acaedate) %>)<%end if %><br>
										                장소 : <%=acasource %> <%if len(acafile1) > 0 then %><a href="<%=acafile1 %>" target="_new">[바로가기]</a><%end if %>
									                </li>
									                <% 
                                                        next
                                                    else
                                                    %>
									                <li>
										                해외학회일정 정보가 존재하지 않습니다.
									                </li>
                                                    <% 
                                                    end if
                                                    %>
												</ul>
											</div>
										</div>
									</div>	<!-- End s-list -->
								</div><!-- End s-listWrapper -->

							</div><!-- End scheduleWrapper -->
						</div> 

					</div><!-- /#sub-bg -->
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
</body>

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

</html>

