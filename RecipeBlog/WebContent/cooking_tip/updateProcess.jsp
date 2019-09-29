<%@page import="com.recipe.dao.TipBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- post 파라미터값 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- BoardVO 자바빈 객체 생성 --%>
<jsp:useBean id="tipboardVO" class="com.recipe.vo.TipBoardVO" />

<%-- 자바빈 객체에 파라미터값 찾아서 저장 --%>
<jsp:setProperty property="*" name="tipboardVO" />

<%-- pageNum 파라미터 가져오기 --%>
<% String pageNum = request.getParameter("pageNum"); %>

<%
// DAO 객체 준비
TipBoardDao tipBoardDao = TipBoardDao.getInstance();
// 패스워드 일치 메소드 호출
boolean isPasswdEqual = tipBoardDao.isPasswdEqual(tipboardVO.getNum(), tipboardVO.getPasswd());
if (!isPasswdEqual) {
	%>
	<script>
		alert('패스워드가 일치하지 않습니다');
		history.back();
	</script>
	<%
	return;
}
// 게시글 수정하기 메소드 호출
tipBoardDao.UpdateBoard(tipboardVO);
%>
<script>
	alert('글을 수정하였습니다');
	location.href='content.jsp?num=<%=tipboardVO.getNum() %>&pageNum=<%=pageNum %>';
</script>