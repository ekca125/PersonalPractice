<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form1</title>
<style type="text/css">
</style>
</head>
<%
	String numberText=request.getParameter("numberText");
	int numberInt = (numberText == null) ? 0 : Integer.parseInt(numberText)+1;
	numberText=Integer.toString(numberInt);
%>
<body>
	<form action="form1.jsp">
		<input type="text" name="numberText" value=<%= numberText%> />
		<button type="submit">++</button>
	</form>
</body>
</html>