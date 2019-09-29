<%@page import="com.recipe.vo.TipBoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.recipe.dao.TipBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.info_writer {
 	font-size: 12px;
    color: #777;
    margin: 0;
    display: inline-block;
}
textarea.form-control {
	resize: none;
}
</style>
</head>
<%
// 페이지번호 pageNum 파라미터값 가져오기
String pageNum = request.getParameter("pageNum");

// 글번호 num 파라미터값 가져오기
int num = Integer.parseInt(request.getParameter("num"));

// DAO 객체 준비
TipBoardDao tipBoardDao = TipBoardDao.getInstance();

// 조회수 1 증가 메소드 호출
tipBoardDao.updateReadCount(num);

// 글번호에 해당하는 레코드 한개 가져오기
TipBoardVO tipBoardVO = tipBoardDao.getboardTip(num);

// 글작성날짜 형식 "July 11, 2019"
SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy");
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


    <!-- ##### Post Details Area Start ##### -->
    <section class="post-news-area section-padding-100-0 mb-70">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Post Details Content Area -->
                <div class="col-12 col-lg-8 col-xl-9">
                    <div class="post-details-content mb-100">
                        <div class="blog-thumbnail mb-50">
                            <img src="../img/bg-img/24.jpg" style="width: 100%;height: 570px;">
                        </div>
                        <div class="blog-content">
                            <h4 class="post-title"><%=tipBoardVO.getSubject() %></h4>
                            <div class="post-meta mb-50">
                                <span class="info_writer"><%=sdf.format(tipBoardVO.getRegDate()) %></span>
                                <span class="info_writer">By <%=tipBoardVO.getId() %></span>
                            </div>
                            <p>
                            	<%=tipBoardVO.getContent() %>
                            </p>
                        </div>
                    </div>

                    <!-- Comment Area Start -->
                    <div class="comment_area clearfix mb-100">
                        <h4 class="mb-50">Comments</h4>

                        <ol>
                            <!-- Single Comment Area -->
                            <li class="single_comment_area">
                                <!-- Comment Content -->
                                <div class="comment-content d-flex">
                                    
                                    <!-- Comment Meta -->
                                    <div class="comment-meta">
                                        <div class="d-flex">
                                        	<span class="comment-author" id="comment_name"></span>	
                                        	<span class="comment-date" id="comment_date"></span>
<!--                                             <a href="#" class="post-author">Jane Smith</a> -->
<!--                                             <a href="#" class="post-date">July 11, 2018</a> -->
<!--                                             <a href="#" class="reply">Reply</a> -->
                                        </div>
                                        	<p id="comment_content">
<!--                                         <p>Consectetur adipiscing elit. Praesent vel tortor facilisis, volutpat nulla placerat, tinci dunt mi. Nullam vel orci dui. Su spendisse sit amet laoreet neque. Fusce sagittis sus cipit sem a consequat.</p> -->
                                    </div>
                                </div>

                                <ol class="children">
                                    <li class="single_comment_area">
                                        <!-- Comment Content -->
                                        <div class="comment-content d-flex">
                                            
                                            <!-- Comment Meta -->
                                            <div class="comment-meta">
                                                <div class="d-flex">
                                                    <a href="#" class="post-author">Christian Williams</a>
                                                    <a href="#" class="post-date">April 15, 2018</a>
                                                    <a href="#" class="reply">Reply</a>
                                                </div>
                                                <p>Consectetur adipiscing elit. Praesent vel tortor facilisis, Nullam vel orci dui. Su spendisse sit amet laoreet neque.</p>
                                            </div>
                                        </div>
                                    </li>
                                </ol>
                            </li>
                        </ol>
                    </div>

                    <div class="post-a-comment-area mb-30 clearfix">
                        <h4 class="mb-50">Leave a reply</h4>

                        <!-- Reply Form -->
                        <jsp:include page="comment.jsp" />
                        
                    </div>
                </div>

                <!-- Sidebar Widget -->
                <jsp:include page="../include/post_sidebar.jsp" />
                
            </div>
        </div>
    </section>
    <!-- ##### Post Details Area End ##### -->


    <!-- ##### Footer Area Start ##### -->
    	<jsp:include page="../include/footer.jsp" />
    <!-- ##### Footer Area Start ##### -->


    <!-- ##### All Javascript Script ##### -->
		<jsp:include page="../include/common_script.jsp" />

<script>
function checkDelete() {
	var result = confirm('글을 정말 삭제하시겠습니까?');
	if (result == true) {
		location.href = 'delete.jsp?num=<%=tipBoardVO.getNum() %>&pageNum=<%=pageNum %>';
	}
}
</script>

</body>

</html>