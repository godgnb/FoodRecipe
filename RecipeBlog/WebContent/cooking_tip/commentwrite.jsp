<%@page import="com.recipe.vo.TipBoardCommentVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.recipe.dao.TipBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));

int pageNum = Integer.parseInt(request.getParameter("pageNum"));

String name = request.getParameter("name");

String content = request.getParameter("content");

Timestamp reDate = new Timestamp(System.currentTimeMillis());

TipBoardDao tipBoardDao = TipBoardDao.getInstance();

int reNum = tipBoardDao.nextCommentNum(num);

TipBoardCommentVO tipBoardCommentVO = new TipBoardCommentVO();
tipBoardCommentVO.setNum(num);
tipBoardCommentVO.setName(name);
tipBoardCommentVO.setContent(content);
tipBoardCommentVO.setReDate(reDate);

tipBoardDao.insertComment(tipBoardCommentVO);

%>
