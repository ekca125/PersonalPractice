<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mid1.jsp 구현</title>
<style type="text/css">
	table {border-collapse:collapse; margin-top:10px; width:200px;}
	input {width:200px;}
	tr {border:1px solid gray;}
</style>
</head>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String numberText=request.getParameter("numberText");
	if(numberText==null){
		numberText="0";
	}
	int numberInt=Integer.parseInt(numberText);
%>
<body>
	<form action="mid1.jsp">
		<input type="text" name="numberText" value=<%= numberText%> />
		<button type="submit">단</button>
	</form>
	<table>
		<%for(int i=1;i<=9;i++){ %>
			<tr>
				<td><%= numberText + " x " + Integer.toString(i) + "= " + Integer.toString(i*numberInt) %><td>
			<tr>
		<%} %>

	</table>
</body>
</html>