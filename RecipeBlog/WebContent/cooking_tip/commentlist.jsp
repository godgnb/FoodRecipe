<%@page import="com.recipe.dao.TipBoardDao"%>
<%@page import="com.recipe.vo.TipBoardCommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num")) ;

TipBoardDao tipBoardDao = TipBoardDao.getInstance();

List<TipBoardCommentVO> tipBoardCommentList = tipBoardDao.getComment(num);

%>
<%=tipBoardCommentList %>