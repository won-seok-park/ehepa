<!--#include virtual="/include/injection.asp" -->
<!--#include virtual="/include/loginchk_m.asp" -->
<!--#include virtual="/include/conn.asp" -->
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
<script language="javascript"> 
<!--
    function GoPage(go) {
        var form = document.Search;

        form.GoPage.value = go;
        form.action = "./mycybercall.asp";
        form.submit();
    }

    function SearchWord() {
        var form = document.Search;
        form.action = "./mycybercall.asp";
        form.submit();
    }

    function GoCyberCallView(no, path, chk) {
        var form = document.Search;

        form.cybpubno.value = no;
        form.cybconfile.value = path;
        form.ureadyn.value = chk;
        form.action = "./mycybercall_chk.asp";
        form.submit();
    }
//-->
</script>
</head>

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
									<li><h1>CyberCall 목록</h1></li>
									<li>내 담당자가 보낸 CyberCall 목록을 확인하실 수 있습니다. </li> 
								</ul>
							</div>
							<div class="line"></div>
						</div>
                        <% 
                            UNo = Request.Cookies("UNo")

                            pagetype = Request("pagetype")
                            pageword = Request("pageword")

                            queryword = " c.uno='" & uno & "' and c.cybpubno=b.cybpubno and b.cybconno=a.cybconno and a.cybconyn='Y'"
                            if len(pageword) > 0 then
                                select case pagetype
                                case ""
                                    queryword = queryword & " and cybcontitle + '/' + cybconmm like '%" & PageWord & "%' "
                                case "1"
                                    queryword = queryword & " and cybcontitle like '%" & PageWord & "%' "
                                case "2"
                                    queryword = queryword & " and cybconmm '%" & PageWord & "%' "
                                end select
                            end if
                        %>
						<div class="contents">
							<div class="listWrapper">
								<div class="search">
									<form name="Search" method="post">
                                      <input type="hidden" name="cybpubno" value="">
                                      <input type="hidden" name="cybconfile" value="">
                                      <input type="hidden" name="ureadyn" value="">
                                      <input type="hidden" name="GoPage" value="">
                                      <select name="PageType">
							            <option value="">전체</option>
							            <option value="1">제목</option>
                                        <option value="2">내용</option>
						              </select>
									  <input type="text" name="PageWord" value="<%=PageWord%>" class="" style="width:38%">
                                      <a href="javascript:SearchWord();" class="grey button2" style="width:28%">검색</a>
                                    </form>
								</div>
								
								<div class="list">
									<ul>
										<% 
                                        OrderStr = "order by b.cybpubdd desc"

	                                    GoPage = Request("GoPage")
	                                    if len(GoPage) = 0 or GoPage = "0" then
		                                    GoPage = 1
	                                    end if

	                                    PageSize = 10
                                        mPageSize = PageSize '페이지에 나열되는 레코드 수
	
	                                    mSQL = "select count(a.cybconno) from ehepa_cybercall_content as a,ehepa_cybercall_publish as b,ehepa_cybercall_log as c where " & queryword
	                                    rsValue = GetSQLExecute(mSQL)
	
	                                    mTotalRecord = rsValue(0,0)	'전체 레코드수
	                                    mTotalPage = mTotalRecord \ mPageSize
	
	                                    if mTotalRecord mod mPageSize > 0 then
		                                    mTotalPage = mTotalPage + 1
	                                    end if

	                                    mTopRecordNum = mTotalRecord - (GoPage - 1) * mPageSize

	                                    mSQL = "select top " & mPageSize & " a.cybconno,cybcontitle,cybconpic,cybconmm,cybcontype,cybconfile,cybpubdd,ureadyn,ureaddd,"
                                        mSQL = mSQL & "(select unm from ehepa_member_info where uno=b.pno),c.cybpubno "
	                                    mSQL = mSQL & "from ehepa_cybercall_content as a,ehepa_cybercall_publish as b,ehepa_cybercall_log as c where a.cybconno Not IN ("
	                                    mSQL = mSQL & "select top " & ((GoPage - 1) * mPageSize) & " a.cybconno from ehepa_cybercall_content as a,ehepa_cybercall_publish as b,ehepa_cybercall_log as c where " & queryword & OrderStr & ") "
	                                    mSQL = mSQL & "and " & queryword & OrderStr

	                                    rsValue = GetSQLExecute(mSQL) 
	                                    if not isnull(rsValue) then
		                                    for i=0 to UBound(rsValue,2)

			                                    cybconno = rsValue(0,i)
			                                    cybcontitle = rsValue(1,i)
			                                    cybconpic = rsValue(2,i)
			                                    cybconmm = rsValue(3,i)
			                                    cybcontype = rsValue(4,i)
                                                cybconfile = rsValue(5,i)
                                                cybpubdd = replace(rsValue(6,i),"-",".")
                                                ureadyn = rsValue(7,i)
                                                ureaddd = replace(mid(rsValue(8,i),1,10),"-",".")
                                                psrnm = rsValue(9,i)
                                                cybpubno = rsValue(10,i)

		                                        idxNo = mTotalRecord - (GoPage-1) * mPageSize - i
                                        %>
                                        <li>
											<%if len(cybconpic) > 0 then %><img src="/ufolder/cybercall/<%=cybconpic %>" /><%end if %>
											<ul>
												<li class="color"><%=cybcontitle %> <%if ureadyn = "Y" then %>[읽음]<%else %>[읽지 않음]<%end if %></li>
												<!--<li class="title"><%=cybconmm %></li>//-->
												<li>담당자 : <%=psrnm %></li>
                                                <li>수신일 : <%=ureaddd %></li>
												<li class="btn"><a class="pop-patient-1 grey button" href="/mycybercall_chk.asp?cybpubno=<%=cybpubno %>&cybconfile=<%=cybconfile %>&ureadyn=<%=ureadyn %>" style="width:100%">내용보기</a></li>
											</ul>
										</li>
										<% 
                                            next
                                        else
                                        %>
                                        <li>
											<img src="data/old-lecture/01/lecture.jpg" alt="">
											<ul>
												<li class="color">전달된 사이콜이 존재하지 않습니다.</li>
											</ul>
										</li>
                                        <%
                                        end if
                                        %>
									</ul>
								</div>

								<!-- table pagination -->
					            <nav role="navigation">
						            <ul class="cd-pagination">
							            <%if mTotalPage > 1 then%>
                                        <%
		                                        mBlockSize = 10
		                                        mBlockPage = int((GoPage-1)/mBlockSize)*mBlockSize+1

		                                        if mBlockPage = 1 then
                                        %>
			                                        <li><a href="#0"><i class="fa fa-angle-left"></i></a></li>
                                        <%
		                                        else
                                        %> 
                                                    <li><a href="javascript:GoPage('<%=mBlockPage-mBlockSize%>');"><i class="fa fa-angle-left"></i></a></li>
                                        <%
		                                        end if

		                                        i=1
		                                        do until i > mBlockSize or mBlockPage > mTotalPage

			                                        if cint(GoPage) = cint(mBlockPage) then
                                        %> 
                                                    <li><a class="current" href="#0"><%=mBlockPage%></a></li>
                                        <%
			                                        else
                                        %> 
                                                    <li><a href="javascript:GoPage('<%=mBlockPage%>');"><%=mBlockPage%></a></li>
                                        <%
			                                        end if
			                                        mBlockPage = mBlockPage + 1
			                                        i = i + 1
		                                        loop
				
		                                        if mBlockPage > mTotalPage Then
                                        %>
			                                        <li><a href="#0"><i class="fa fa-angle-right"></i></a></li>
                                        <%
		                                        else
                                        %> 
		                                            <li><a href="javascript:GoPage('<%=mBlockPage%>');""><i class="fa fa-angle-right"></i></a></li>
                                        <%
		                                        end if
                                        %>
                                        <%else %>
                                        <li><a href="#0"><i class="fa fa-angle-left"></i></a></li>
							            <li><a class="current" href="#0">1</a></li>
							            <li><a href="#0"><i class="fa fa-angle-right"></i></a></li>
                                        <%end if %>
						            </ul>
					            </nav>
					            <!-- / table pagination -->
							</div>
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
</html>

