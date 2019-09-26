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


</style>
</head>
<%
	// DAO 객체 준비
TipBoardDao tipListDao = TipBoardDao.getInstance();

// tiplist테이블 전체글개수 가져오기 메소드
int count = tipListDao.getboardCount();
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
        	<%
        	if (count > 0) {
 				%>
	        	<div class="row justify-content-center">
                <!-- Post Area -->
	                <div class="col-12 col-lg-8 col-xl-9">
	                    <!-- Single Blog Post -->
	                    <div class="media">
	                        <!-- Media Area -->
	                     	<div class="media-left">
								<a href="">
									<img src="../img/bg-img/9.jpg" alt="" style="width: 200px;height: 130px;">
								</a>
							</div>
	                      	<div class="media-body">
	                      		<h4 class="media-heading" id="media-heading"><a href="#">환절기 감기예방, 목감기에 좋은 은행</a></h4>
				                <p class="info_writer">만개의레시피<span>|</span>2016-08-29 오전 11:39<span>|</span><span class="cate_view">7,448</span><span>|</span><span class="cate_comment">1</span></p>
							</div>
	                    </div>
	                    <!-- Search Area -->
	                    <div class="pagination-area mt-70">
	                        <nav aria-label="Page navigation example">
	                            <ul class="pagination">
	                                <li class="page-item"><a class="page-link" href="#">01</a></li>
	                                <li class="page-item active"><a class="page-link" href="#">02</a></li>
	                                <li class="page-item"><a class="page-link" href="#">03</a></li>
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
 				<%
        	} else {
        		%>
	        	<div class="row justify-content-center">
                <!-- Post Area -->
	                <div class="col-12 col-lg-8 col-xl-9">
	                	<div class="media-body">
                      		<h4 class="media-heading" id="media-heading">게시판에 글이 없습니다</h4>
						</div>
	                    <!-- Search Area -->
	                    <div class="pagination-area mt-70">
	                        <nav aria-label="Page navigation example">
	                            <ul class="pagination">
	                                <li class="page-item"><a class="page-link" href="#">01</a></li>
	                                <li class="page-item active"><a class="page-link" href="#">02</a></li>
	                                <li class="page-item"><a class="page-link" href="#">03</a></li>
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
        		<%
        	}
        	
        	%>
        	
            
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