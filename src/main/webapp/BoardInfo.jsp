<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());	// �������� �� ���������� ���� 

	// ������ ���̽� ����
	BoardDAO bdao = new BoardDAO();
	// BoardBeanŸ������ �ϳ��� �Խñ��� ����
	BoardBean bean = bdao.getOneBoard(num);
%>
<h2>�Խñ� ����</h2>
<table width="600" border="1" bgcolor="skyblue">
	<tr height="30">
		<td align="center" width="120"> ��ȣ </td>
		<td align="center" width="180"> <%= bean.getNum() %> </td>
		<td align="center" width="120"> ��ȸ�� </td>
		<td align="center" width="180"> <%= bean.getReadcount() %> </td>
	</tr>
	<tr height="30">
		<td align="center" width="120"> �ۼ��� </td>
		<td align="center" width="180"> <%= bean.getWriter() %> </td>
		<td align="center" width="120"> �ۼ��� </td>
		<td align="center" width="180"> <%= bean.getReg_date() %> </td>
	</tr>
	<tr height="30">
		<td align="center" width="120"> �̸��� </td>
		<td align="center" colspan="3"> <%= bean.getEmail() %> </td>
	</tr>
	<tr height="30">
		<td align="center" width="120"> ���� </td>
		<td align="center" colspan="3"> <%= bean.getSubject() %> </td>
	</tr>
	<tr height="80">
		<td align="center" width="120"> ���� </td>
		<td align="center" colspan="3"> <%= bean.getContents() %> </td>
	</tr>
	<tr height="30">
		<td align="center" colspan="4">
			<input type="button" value="��� ����" 
			onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">
			<input type="button" value="���� �ϱ�" onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'">
			<input type="button" value="���� �ϱ�" onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'">
			<input type="button" value="��� ����" onclick="location.href='BoardList.jsp'">
</table>

</body>
</html>