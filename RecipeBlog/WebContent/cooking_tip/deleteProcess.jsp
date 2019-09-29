<%@page import="com.recipe.dao.TipBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터값 한글 처리
request.setCharacterEncoding("utf-8");

// 파라미터값 가져오기
String pageNum = request.getParameter("pageNum");
int num = Integer.parseInt(request.getParameter("num"));
String passwd = request.getParameter("passwd");

// DAO 객체 준비
TipBoardDao tipBoardDao = TipBoardDao.getInstance();

// 패스워드 일치 메소드 호출
boolean isPasswdEqual = tipBoardDao.isPasswdEqual(num, passwd);

if (!isPasswdEqual) {
	%>
	<script>
		alert('패스워드가 일치하지 않습니다');
		history.back();
	</script>
	<%
	return;
}
// 게시글 삭제하기 메소드 호출
tipBoardDao.deleteBoard(num);
%>
<script>
	alert('글을 삭제하였습니다');
	location.href = 'tip_board.jsp?pageNum=<%=pageNum %>'
</script>