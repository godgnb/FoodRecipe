<%@page import="com.recipe.dao.TipBoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- post 파라미터값 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- 액션태그로 자바빈 객체 생성 --%>
<jsp:useBean id="tipboardVO" class="com.recipe.vo.TipBoardVO" />

<%-- 액션태그로 파라미터 값을 자바빈에 저장 --%>
<jsp:setProperty property="*" name="tipboardVO" />

<%-- 글등록날짜, IP주소 값 저장 --%>
<%
tipboardVO.setRegDate(new Timestamp(System.currentTimeMillis()));
tipboardVO.setIp(request.getRemoteAddr());
%>

<%-- BoardDao 객체 준비 --%>
<%
TipBoardDao tipListDao = TipBoardDao.getInstance();

// 게시글 번호 생성하는 메소드 호출
int num = tipListDao.NextTipNum();

tipboardVO.setNum(num);
tipboardVO.setReadcount(0);
tipboardVO.setCommcount(0);
%>


<%-- 게시글 한개 등록하는 메소드 호출 insertboardTip(tipboardVO) --%>
<% tipListDao.insertboardTip(tipboardVO); %>

<%-- 이동 tip_list.jsp --%>
<% response.sendRedirect("tip_list.jsp"); %>

