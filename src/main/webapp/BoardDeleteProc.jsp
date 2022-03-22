<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<%
	String pass = request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 데이터 베이스 연결
	BoardDAO bdao = new BoardDAO();
	String password = bdao.getPass(num);
	
	// 기존 패스워드 값과 delete form에서 작성한 패스워드를 비교
	if(pass.equals(password)){
		// 패스워드가 둘다 같다면
		bdao.deleteBoard(num); 
		
		response.sendRedirect("BoardList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("패스워드가 옳지 않습니다.");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>