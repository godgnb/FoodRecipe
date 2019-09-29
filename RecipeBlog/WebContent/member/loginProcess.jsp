<%@page import="com.recipe.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

MemberDao memberDao = MemberDao.getInstance();

int check = memberDao.userCheck(id, passwd);

if (check == 1) {
	session.setAttribute("id", id);
	session.setAttribute("passwd", passwd);
	
}
%>
<%=check %>