<%@page import="com.recipe.dao.TipListDao"%>
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
</head>
<style>
.list-form {
	position: relative;
	z-index: 2;
	height: 40px;
	background-color: $white-color;
	font-size: 12px;
	margin-bottom: 15px;
	border: 1px solid #dadfe5;
	border-bottom: 2px solid #dadfe5;
	border-radius: 0;
	padding: 15px 30px;
	font-weight: 500;
	color: black;

} 
#tiplist {
	position: relative;
	margin-left: 50px;
	
}
#frm {
	position: relative;
	width: 100%;
}
</style>
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
        		<h2>나만의 꿀팁 전하기</h2>
        	</div>
            <div class="row justify-content-center">
                <!-- Post Area -->
                <div class="col-12 col-lg-8 col-xl-9">
                    <!-- Single Blog Post -->
                    <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
                        <!-- Blog Thumbnail -->
                        <form action="" method="post" id="frm" name="frm">
	                        	<table id="tiplist">
		                            <tr>
		                            	<th width="60">작성자</th>
		                            	<td>
		                            		<input type="text" class="list-form" id="id" name="id">
		                            	</td>
		                            </tr>
		                             <tr>
		                            	<th>패스워드</th>
		                            	<td>
		                            		<input type="text" class="list-form" id="passwd" name="passwd">
		                            	</td>
		                            </tr>
		                            <tr>
		                            	<th>제목</th>
		                            	<td>
		                            		<input type="text" class="list-form" id="subject" name="subject">
		                            	</td>
		                            </tr>
		                            <tr>
		                            	<th>내용</th>
		                            	<td>
		                            		<textarea class="list-form-textarea" id="content" name="content" rows="13" cols="40"></textarea>
		                            	</td>
		                            </tr>
	                       		</table>
	                    </form>    
                    </div>
                </div>

                <!-- Sidebar Area -->
                <jsp:include page="../include/post_sidebar.jsp" />
                
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="pagination-area mt-70">
                        <div class="listwirte">
                   			<input class="btn bueno-btn mt-30 mr-15" type="submit" value="글쓰기" >
                   			<input class="btn bueno-btn mt-30 mr-15" type="reset" value="다시쓰기" >
                   			<input class="btn bueno-btn mt-30 mr-15" type="button" value="목록보기" onclick="location.href='tip_list.jsp';">
                        </div>
                    </div>
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
			
</body>

</html>