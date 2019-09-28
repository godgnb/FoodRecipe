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
		 	 font-size: 40px;
		 	 margin: 0 0 30px 95px;
	 	 }
	</style>
	
</head>

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
                            <h4 class="post-title" style="font-size: 40px">Login / Register</h4>
                        </div>
                    </div>

                    <!-- Comment Area Start -->
                    <div class="comment_area1 clearfix mb-50">
                    
                    </div>

                    <div class="post-a-comment-area mb-30 clearfix">
                        <h4 class="form_title">Register</h4>

                        <!-- Register Form -->
                        <div class="contact-form-area">
                            <form name="frm" action="registerProcess.jsp" method="get" id="join">
                                <div class="row" >
                                    <div class="col-8">
                                        <input type="text" class="form-control" id="id" name="id" placeholder="Id">
										<span id="com_id"></span>
                                        <input type="password" class="form-control" id="passwd" name="passwd" placeholder="Passward">
                                        <span id="com_passwd"></span>
                                        <input type="password" class="form-control" id="passwd2" name="passwd2" placeholder="Passward Check">
                                        <span id="com_passwd2"></span>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                                        <span id="com_name"></span>
                                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone Number">
                                        <span id="com_phone"></span>
                                        <input type="text" class="form-control" id="email" name="email" placeholder="E-mail">
                                        <span id="com_email"></span><br>
                                        
                                        <input class="btn bueno-btn mt-30" type="button" value="Register" id="register">
                                        <button class="btn bueno-btn mt-30" type="button" onclick="location='login.jsp'">Cancel</button>
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
	$('#id').blur(function () {
		var id = $(this).val();

		$.ajax({
			url: 'registerIdDupCheck.jsp',
			data: {id: id},
			success: function (data) {


			if (data == true) {
				$('#com_id').text('중복된 아이디입니다.').css('color', 'red');
			} else {
				if (id.length < 5 || id.length > 15) {
				$('#com_id').text('5~15글자의 영문 대소문자, 숫자만 사용가능합니다').css('color', 'red');
				} else {
					$('#com_id').text('좋은 아이디입니다.').css('color', 'blue');
				}
				
			}	
						
 			}
		});		
		 
	}); // id
	
	$('#passwd').blur(function () {
		if ($('#passwd').val().length == 0) {
			$('#com_passwd').text('필수입력 사항입니다.').css('color', 'red');
		}
		else if ($('#passwd').val().length < 8 || $('#passwd').val().length > 16) {
			$('#com_passwd').text('8~16글자의 영문 대소문자, 숫자만 사용가능합니다').css('color', 'red');
			$('#passwd').focus();
		} else {
			$('#com_passwd').text('');
			$('#passwd2').focus();
		}
	}); // passwd
	
	$('#passwd2').blur(function () {
		if ($('#passwd2').val().length == 0) {
			$('#com_passwd2').text('필수입력 사항입니다.').css('color', 'red');
		}
		else if ($('#passwd').val() != $('#passwd2').val()) {
			$('#com_passwd2').text('패스워드가 일치하지 않습니다.').css('color', 'red');
		} else {
			$('#com_passwd2').text('패스워드가 일치합니다.').css('color', 'blue');
			$('#name').focus();
		}
	}); // passwd2
	
	$('#name').blur(function () {
		if ($('#name').val().length == 0) {
			$('#com_name').text('필수입력 사항입니다.').css('color', 'red');
		} else {
			$('#com_name').text('');
			$('#phone').focus();
		}
	}); // name
	
	$('#phone').blur(function () {
		if ($('#phone').val().length == 0) {
			$('#com_phone').text('필수입력 사항입니다.').css('color', 'red');
		} else {
			$('#com_phone').text('');
			$('#email').focus();
		}
	}); // phone
	
	$('#email').blur(function () {
		if ($('#email').val().length == 0) {
			$('#com_email').text('필수입력 사항입니다.').css('color', 'red');
		} else {
			$('#com_email').text('');
		}
	}); // phone
	
	$('#register').click(function () {
		if ($('#id').val() == '') {
			$('#id').focus();
		}else if ($('#passwd').val() == '') {
			$('#passwd').focus();
		}else if ($('#passwd').val() != $('#passwd2').val()) {
			$('#passwd2').focus();
			$('#com_passwd2').text('패스워드가 일치하지 않습니다.');
		}else if ($('#name').val() == '') {
			$('#name').focus();
		}else if ($('#phone').val() == '') {
			$('#phone').focus();
		}else if ($('#email').val() == '') {
			$('#email').focus();
		}else {
			$('#join').submit();
		}
	}); // register

</script>
</body>

</html>