<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("EUC-KR");
%>

<!-- �Խñ� �ۼ��� �����͸� �� ���� ����-->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>

<%
	// ������ ���̽� ������ �� Ŭ������ �Ѱ���
	BoardDAO bdao = new BoardDAO();

	// ������ ���� �޼ҵ� ȣ��
	bdao.insertBoard(boardbean);

	// �Խñ� ���� �� ��ü �Խñ� ����
	response.sendRedirect("BoardList.jsp");
%>
</body>
</html>