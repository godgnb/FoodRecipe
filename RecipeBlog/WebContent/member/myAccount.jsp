<%@page import="com.recipe.vo.MemberVO"%>
<%@page import="com.recipe.dao.MemberDao"%>
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
		.comment_area1 {
	 	 	border-bottom: 1px solid #eaeaea;
	 	 }
	 	 .contact-form-area .form-control{
			color: black;
	 	 }
	 	 .col-8 {
	 	 	margin-left: 100px;
	 	 }
	 	 .bueno-btn {
	 	 	margin-right: 70px;
	 	 }
	 	 .form_title {
		 	 font-size: 25px;
		 	 margin: 0 0 30px 95px;
	 	 }
	</style>
	
</head>
<%
// 세션값 id 가져오기
String id = (String) session.getAttribute("id");

// DAO 객체 준비
MemberDao memberDao = MemberDao.getInstance();

// 회원정보 가져오는 메소드 호출
MemberVO memberVO = memberDao.getMember(id);
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
    <div class="bueno-search-area section-padding-100-0 pb-70 bg-img" style="background-image: url(../img/core-img/pattern.png);"></div>
    <!-- ##### Search Area End ##### -->
    
    
    <!-- ##### Post Details Area Start ##### -->
    <section class="post-news-area section-padding-100-0 mb-70">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Post Details Content Area -->
                <div class="col-12 col-lg-8 col-xl-9">
                    <div class="post-details-content">
                        <div class="blog-content">
                            <h4 class="post-title" style="font-size: 40px">My Account</h4>
                        </div>
                    </div>

                    <!-- Comment Area Start -->
                    <div class="comment_area1 clearfix mb-50">
                    
                    </div>

                    <div class="post-a-comment-area mb-30 clearfix">
                        <h4 class="form_title">Detail Information</h4>

                        <!-- Register Form -->
                        <div class="contact-form-area">
                            <form name="frm"  method="get" id="join">
                                <div class="row" >
                                    <div class="col-8">
                                        <input type="text" class="form-control" id="id" name="id" value="<%=memberVO.getId() %>" readonly>
                                        <input type="text" class="form-control" id="name" name="name" value="<%=memberVO.getName() %>" readonly>
                                        <input type="tel" class="form-control" id="phone" name="phone" value="<%=memberVO.getPhone() %>" readonly>
                                        <input type="text" class="form-control" id="email" name="email" value="<%=memberVO.getEmail() %>" readonly>
                                        
                                        <input class="btn bueno-btn mt-30 mr-15" type="button" value="정보수정" id="edit" onclick="location.href='edit.jsp?id=<%=memberVO.getId() %>';">
                                        <input class="btn bueno-btn mt-30 mr-15" type="button" value="정보삭제" id="delete" >
                                        <input class="btn bueno-btn mt-30 mr-15" type="button" value="메인으로" onclick="location='../index.jsp'">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
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
$('#delete').on('click', function () {
	var check = confirm("회원정보를 삭제하시겠습니까?");
	if (check == true) {
		location.href='delete.jsp?id=<%=memberVO.getId() %>';
	}
});
</script>
</body>

</html>