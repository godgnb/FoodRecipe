<%@page import="java.util.List"%>
<%@page import="com.recipe.vo.TipBoardVO"%>
<%@page import="com.recipe.dao.TipBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Bueno</title>

    <!-- Favicon -->
    <link rel="icon" href="../img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../css/style.css">

<style>
.media {
    border-bottom: 1px solid #ebebeb;
    padding: 0 0 22px 0;
}
.media-left {
    padding-right: 25px;
    display: table-cell;
}
.media-body{
	padding: 30px 0 30px;
	display: table-cell;
    vertical-align: middle;
}
.info_writer {
    font-size: 12px;
    color: #777;
    margin: 0;
    display: inline-block;
}
.info_writer span {
	padding: 0 5px 0 5px;
}
.page-link-move {
    width: 50px;
    height: 33px;
    line-height: 33px;
    font-size: 15px;
    color: #7a7a7a;
    text-transform: uppercase;
    text-align: center;
    display: inline-block;
    border-radius: 0;
    padding: 0;
    margin-right: 5px;
    border: none;
}

</style>
</head>
<%
//파라미터값 search pageNum 가져오기
String search = request.getParameter("search");
String strPageNum = request.getParameter("pageNum");
if (strPageNum == null) {
	strPageNum = "1";
}
// 페이지 번호
int pageNum = Integer.parseInt(strPageNum);

// DAO 객체 준비
TipBoardDao tipBoardDao = TipBoardDao.getInstance();

// 한페이지에 보여줄 글 개수
int pageSize = 3;

// 시작행번호 구하기
int startRow = (pageNum - 1) * pageSize + 1;

// tipboard테이블 전체글개수 가져오기 메소드
int count = tipBoardDao.getboardCount();

// 글목록 가져오기 메소드 호출
List<TipBoardVO> tipboardlist = tipBoardDao.getBoards(startRow, pageSize);

%>
<body>
    <!-- Preloader -->
    	<jsp:include page="../include/preloader.jsp" />

    <!-- ##### Header Area Start ##### -->
   		<jsp:include page="../include/header.jsp" />
    <!-- ##### Header Area End ##### -->


    <!-- ##### Treading Post Area Start ##### -->
    	<jsp:include page="../include/ranking.jsp" />
    <!-- ##### Treading Post Area End ##### -->


    <!-- ##### Search Area Start ##### -->
    <div class="bueno-search-area section-padding-100-0 pb-70 bg-img" style="background-image: url(../img/core-img/pattern.png);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <select class="form-control" id="recipe">
                                      <option value="">Recipe</option>
                                      <option value="">Recipe 1</option>
                                      <option value="">Recipe 2</option>
                                      <option value="">Recipe 3</option>
                                      <option value="">Recipe 4</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <select class="form-control" id="vegan">
                                      <option value="">Vegan</option>
                                      <option value="">Vegan 1</option>
                                      <option value="">Vegan 2</option>
                                      <option value="">Vegan 3</option>
                                      <option value="">Vegan 4</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <select class="form-control" id="ingredients">
                                      <option value="">Ingredients</option>
                                      <option value="">Ingredients 1</option>
                                      <option value="">Ingredients 2</option>
                                      <option value="">Ingredients 3</option>
                                      <option value="">Ingredients 4</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <button class="btn bueno-btn w-100">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Search Area End ##### -->


    <!-- ##### Catagory Post Area Start ##### -->
    <div class="catagory-post-area section-padding-100">
        <div class="container">
        	<div class="title" style="margin-bottom: 40px; border-bottom: 1px solid #b1a8a8;">
        		<h2><%=count %>개의 행복한 팁이 있습니다</h2>
        	</div>
        	<div class="row justify-content-center">
                <!-- Post Area -->
                <div class="col-12 col-lg-8 col-xl-9">
        	<%
        	if (count > 0) {
        		for (TipBoardVO tipBoardVO : tipboardlist) {
        			%>
        			<!-- Single Blog Post -->
                    <div class="media">
        			<!-- Media Area -->
	                 	<div class="media-left">
	                 	<a href="content.jsp?num=<%=tipBoardVO.getNum() %>&pageNum=<%=pageNum %>">
							<img src="../img/bg-img/9.jpg" alt="" style="width: 200px;height: 130px;">
						</a>
						</div>
	                  	<div class="media-body">
	                  		<h4 class="media-heading" id="media-heading"><a href="content.jsp?num=<%=tipBoardVO.getNum() %>&pageNum=<%=pageNum %>"><%=tipBoardVO.getSubject() %></a></h4>
			                <p class="info_writer"><%=tipBoardVO.getId() %><span>|</span><%=tipBoardVO.getRegDate() %><span>|</span><span class="cate_view"><%=tipBoardVO.getReadcount() %></span><span>|</span><span class="cate_comment"><%=tipBoardVO.getCommcount() %></span></p>
						</div>
					</div>
					<%
        		}
        	} else {
        		%>
	        	<div class="row justify-content-center">
                <!-- Post Area -->
	                <div class="col-12 col-lg-8 col-xl-9">
	                	<div class="media-body">
                      		<h4 class="media-heading" id="media-heading">게시판에 글이 없습니다</h4>
						</div>
					</div>
        		<%
        	}      	
        	%>
        		<!-- Search Area -->
                    <div class="pagination-area mt-70">
                        <nav aria-label="Page navigation example">
                            <%
                            if (count > 0) {
                            	// 총페이지 개수 구하기
                            	//	전체 글 개수 / 한페이지당 글개수 (+1 : 나머지 있을때)
                            	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
                            	
                            	// 페이지블록 수 설정
                            	int pageBlock = 3;
                            	
                            	// 시작페이지번호 startPage 구하기
                            	int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
                            	
                            	// 끝페이지번호 endPage 구하기
                            	int endPage = startPage + pageBlock - 1;
                            	if (endPage > pageCount) {
                            		endPage = pageCount;
                            	}
                            	
                            	// [이전] 출력
                            	%><ul class="pagination"><%
                            	if (startPage > pageBlock) {
                            		%>
                            		<li class="page-item">
                            			<a href="tip_list.jsp?pageNum<%=startPage-pageBlock %>" class="page-link-move">[이전]</a>
                           			</li>
                            		<%
                            	}
                            	
                            	// 페이지블록 페이지 출력
                            	
                            	for (int i = startPage; i <= endPage; i++) {
                           			if (i == pageNum) {
                           				%>
                           				<li class="page-item active">
                           					<a href="tip_list.jsp?pageNum=<%=i %>" class="page-link"><%=i %></a>
                           				</li>
                           				<%
                           			} else {
                           				%>
                                   		<li class="page-item">
                                   			<a href="tip_list.jsp?pageNum=<%=i %>" class="page-link"><%=i %></a>
                               			</li>
                               			<%
                           			}
                            	}
                            	
                            	// [다음] 출력
                            	if (endPage < pageCount) {
                            		%>
                            		<li class="page-item">
                           				<a href="tip_list.jsp?pageNum=<%=startPage+pageBlock %>" class="page-link-move">[다음]</a>
                       				</li>
                            		<%
                            	}
                            }
                            %>
                            </ul>
                        </nav>
                        <div class="listwirte">
                      		<c:if test="${id == null}">
                      			<input class="btn bueno-btn mt-30" type="button" value="글쓰기" onclick="idCheck();">
                      		</c:if>
                      		<c:if test="${id != null}">
                      			<input class="btn bueno-btn mt-30" type="button" value="글쓰기" onclick="location.href='write.jsp';">
                      		</c:if>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Area -->
                <jsp:include page="../include/post_sidebar.jsp" />
                
            </div>
            </div>
        </div>
    </div>
    <!-- ##### Catagory Post Area End ##### -->


    <!-- ##### Footer Area Start ##### -->
    	<jsp:include page="../include/footer.jsp" />
    <!-- ##### Footer Area Start ##### -->


    <!-- ##### All Javascript Script ##### -->
		<jsp:include page="../include/common_script.jsp" />
		
<script>
	function idCheck() {
		var check = confirm('로그인이 필요한 작업입니다. \n로그인하시겠습니까?');
		if (check) {
			location.href='../member/login.jsp';
		}
	}
</script>		
</body>

</html>