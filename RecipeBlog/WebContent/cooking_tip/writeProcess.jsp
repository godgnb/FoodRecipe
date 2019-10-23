<%@page import="com.recipe.dao.TipBoardAttachDao"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="com.recipe.vo.TipBoardAttachVO"%>
<%@page import="com.recipe.vo.TipBoardVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.recipe.dao.TipBoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// COS 라이브러리를 이용해서 파일업로드

// 업로드할 경로
String realPath = application.getRealPath("/upload");
System.out.println("realpath: " + realPath);

// 최대 업로드 파일크기
int maxSize = 1024 * 1024 * 10;

MultipartRequest multi = new MultipartRequest(
		request, realPath, maxSize, "utf-8",
		new DefaultFileRenamePolicy());
%>    

<%
// 게시판 글 등록

// 자바빈 TipBoardVO 객체 생성
TipBoardVO tipboardVO = new TipBoardVO();

// 파라미터 찾아서 자바빈에 저장
tipboardVO.setId(multi.getParameter("id"));
tipboardVO.setPasswd(multi.getParameter("passwd"));
tipboardVO.setSubject(multi.getParameter("subject"));
tipboardVO.setContent(multi.getParameter("content"));

tipboardVO.setRegDate(new Timestamp(System.currentTimeMillis()));
tipboardVO.setIp(request.getRemoteAddr());

// BoardDao 객체 준비
TipBoardDao tipListDao = TipBoardDao.getInstance();

//게시글 번호 생성하는 메소드 호출
int num = tipListDao.NextTipNum();

tipboardVO.setNum(num);
tipboardVO.setReadcount(0);
tipboardVO.setCommcount(0);

// 게시글 한개 등록하는 메소드 호출 insertboardTip(tipboardVO)
tipListDao.insertboardTip(tipboardVO);
%>

<%
// 첨부파일 등록

// 업로드한 원본 파일이름
String originalFileName = multi.getOriginalFileName("imgfile");
System.out.println("originalFileName: " + originalFileName);

// 실제로 업로드된 파일이름
String realFileName = multi.getFilesystemName("imgfile");
System.out.println("realFileName: " + realFileName);

// 파일업로드 확인
if (realFileName != null) { // 업로드 함
	// 자바빈 TipBoardAttachVO 객체 생성
	TipBoardAttachVO tipBoardAttachVO = new TipBoardAttachVO();
	
	UUID uuid = UUID.randomUUID();
	tipBoardAttachVO.setUuid(uuid.toString());
	tipBoardAttachVO.setFilename(realFileName);
	tipBoardAttachVO.setBno(num);
	
	// 이미지 파일 여부 확인
	File file = new File(realPath, realFileName);
	String contentType = Files.probeContentType(file.toPath());
	boolean isImage = contentType.startsWith("image");
	if (isImage) {
		tipBoardAttachVO.setFiletype("I"); // Image
	} else {
		tipBoardAttachVO.setFiletype("O"); // Other
	}
	
	// TipBoardAttachDAO 객체 준비
	TipBoardAttachDao tipBoardAttachDao = TipBoardAttachDao.getInstance();
	
	// 첨부파일 한개 등록하는 메소드 호출
	tipBoardAttachDao.insertAttach(tipBoardAttachVO);	
} // if
%>

<%
// 이동 tip_board.jsp
response.sendRedirect("tip_board.jsp");
%>

