<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- ����� �����͸� �о���̴� ��Ŭ�������� -->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>
<%
	// ������ ���̽��� ����
	BoardDAO bdao = new BoardDAO();
	// �ش� �Խñ��� �н����尪�� �޾ƿ�
	String pass = bdao.getPass(boardbean.getNum());
	
	// ���� �н����尪�� update�� �ۼ��ߴ� password���� ������ ��
	if(pass.equals(boardbean.getPassword())){
		// ������ ����
		bdao.updateBoard(boardbean);
		// ������ �Ϸ�Ǹ� �ٽ� ��ü �Խñ� ����
		response.sendRedirect("BoardList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("�н����尡 ��ġ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>

<%
	}
%>

</body>
</html>