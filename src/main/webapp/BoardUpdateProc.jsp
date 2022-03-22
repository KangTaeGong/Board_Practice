<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- 사용자 데이터를 읽어들이는 빈클래스설정 -->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>
<%
	// 데이터 베이스에 연결
	BoardDAO bdao = new BoardDAO();
	// 해당 게시글의 패스워드값을 받아옴
	String pass = bdao.getPass(boardbean.getNum());
	
	// 기존 패스워드값과 update시 작성했던 password값이 같은지 비교
	if(pass.equals(boardbean.getPassword())){
		// 데이터 수정
		bdao.updateBoard(boardbean);
		// 수정이 완료되면 다시 전체 게시글 보기
		response.sendRedirect("BoardList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다.");
		history.go(-1);
	</script>

<%
	}
%>

</body>
</html>