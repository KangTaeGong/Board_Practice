<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<h2> �Խñ� ����</h2>
<%
	// �ش� �Խñ� ��ȣ�� ���Ͽ� �Խñ��� ����
	int num = Integer.parseInt(request.getParameter("num").trim());

	// �ϳ��� �Խñ��� ���� ������ ����
	BoardDAO bdao = new BoardDAO();
	BoardBean bean = bdao.getOneUpdateBoard(num);
%>
<form action="BoardUpdateProc.jsp" method="post">
	<table width="600" border="1" bgcolor="skyblue">	
		<tr height="30">
			<td width="120" align="center">�ۼ���</td>
			<td width="180" align="center"><%=bean.getWriter() %></td>
			<td width="120" align="center">�ۼ���</td>
			<td width="180" align="center"><%=bean.getReg_date() %></td>
		</tr>
		<tr height="30">
			<td width="120" align="center">����</td>
			<td colspan="3">&nbsp; <input type="text" name="subject" value="<%=bean.getSubject() %>" size="57"></td>
		</tr>
		<tr height="30">
			<td width="120" align="center">�н�����</td>
			<td colspan="3">&nbsp; <input type="password" name="password" size="57"></td>
		</tr>
		<tr height="30">
			<td width="120" align="center">����</td>
			<td colspan="3">&nbsp; <textarea rows="10" cols="60" name="contents" align="left"><%=bean.getContents() %></textarea></td>
		</tr>
		<tr height="40">
			<td colspan="4" align="center">
			<input type="hidden" name="num" value="<%=bean.getNum() %>">
			<input type="submit" value="�� ����"> &nbsp; &nbsp;
			<input type="button" value="��ü �� ����" onclick="location.href='BoardList.jsp'"></td>
		</tr>
	</table>
</form>
</body>
</html>