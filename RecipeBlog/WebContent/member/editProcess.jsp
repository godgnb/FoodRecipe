<%@page import="com.recipe.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- post 파라미터값 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- MemberVO 자바빈 객체 생성 --%>
<jsp:useBean id="memberVO" class="com.recipe.vo.MemberVO" />

<%-- 자바빈 객체에 파라미터값 찾아서 저장 --%>
<jsp:setProperty property="*" name="memberVO" />

<%
// DAO 객체 준비
MemberDao memberDao = MemberDao.getInstance();
// 패스워드 일치 메소드 호출
int check = memberDao.userCheck(memberVO.getId(), memberVO.getPasswd());
if (check != 1) {
	%>
	<script>
		alert('패스워드가 일치하지 않습니다');
		history.back();
	</script>
	<%
	return;
}
// 회원정보 수정하기 메소드 호출
//memberDao.updateMember(memberVO);
%>
<script>
	alert('회원정보를 수정하였습니다');
	location.href='myAccount.jsp';
</script>