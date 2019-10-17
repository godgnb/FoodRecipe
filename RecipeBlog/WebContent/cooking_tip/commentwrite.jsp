<%@page import="java.util.List"%>
<%@page import="com.recipe.vo.TipBoardCommentVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.recipe.dao.TipBoardDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터값 한글처리
request.setCharacterEncoding("utf-8");

// 파라미터값 가져오기
int num = Integer.parseInt(request.getParameter("num"));

int pageNum = Integer.parseInt(request.getParameter("pageNum"));

String name = request.getParameter("name");

String content = request.getParameter("content");

// 현재시간 생성
Timestamp reDate = new Timestamp(System.currentTimeMillis());

// DAO 객체 생성
TipBoardDao tipBoardDao = TipBoardDao.getInstance();

// 댓글번호 생성 메소드 호출
int reNum = tipBoardDao.nextCommentNum();

// VO에 값 입력
TipBoardCommentVO tipBoardCommentVO = new TipBoardCommentVO();
tipBoardCommentVO.setReNum(reNum);
tipBoardCommentVO.setName(name);
tipBoardCommentVO.setContent(content);
tipBoardCommentVO.setReDate(reDate);
tipBoardCommentVO.setNum(num);

// 댓글 1개 입력 메소드 호출
tipBoardDao.insertComment(tipBoardCommentVO);

// 댓글 전체 가져오기 메소드 호출
List<TipBoardCommentVO> tipBoardCommentList = tipBoardDao.getComment(num);
%>
<%=tipBoardCommentList %>