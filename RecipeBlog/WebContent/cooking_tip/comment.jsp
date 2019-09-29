<%@page import="com.recipe.dao.TipBoardDao"%>
<%@page import="com.recipe.vo.TipBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
// 페이지번호 pageNum 파라미터값 가져오기
String pageNum = request.getParameter("pageNum");

// 글번호 num 파라미터값 가져오기
int num = Integer.parseInt(request.getParameter("num"));

//DAO 객체 준비
TipBoardDao tipBoardDao = TipBoardDao.getInstance();

//글번호에 해당하는 레코드 한개 가져오기
TipBoardVO tipBoardVO = tipBoardDao.getboardTip(num);

%>
<body>

<div class="contact-form-area">
    <form action="#" method="post">
        <div class="row">
            <div class="col-12 col-lg-6">
                <input type="text" class="form-control" id="name" placeholder="Name*">
            </div>
            <div class="col-12">
                <textarea name="comment" class="form-control" id="comment" cols="30" rows="10" placeholder="Comment"></textarea>
            </div>
            <div class="col-12">
                <input class="btn bueno-btn mt-30" type="button" value="글수정" onclick="location.href='update.jsp?num=<%=tipBoardVO.getNum() %>&pageNum=<%=pageNum %>';">
                <input class="btn bueno-btn mt-30" type="button" value="글삭제" onclick="checkDelete();">
                <input class="btn bueno-btn mt-30" type="button" value="목록보기" onclick="location.href='tip_board.jsp?pageNum=<%=pageNum %>';">
                <input class="btn bueno-btn mt-30" type="button" value="답글쓰기" id="rewrite">
            </div>
        </div>
    </form>
</div>
</body>
</html>