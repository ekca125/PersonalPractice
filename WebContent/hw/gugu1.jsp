<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugu1</title>
<style>
	table {border-collapse:collapse;}
	td {border:1px solid gray;}
</style>
</head>
<body>
<table>
<%
	for(int i=0;i<9;i++){
		out.print("<tr>");
		for(int j=0;j<8;j++){
			String text=(j+2)+"X"+(i+1)+"="+Integer.toString((i+1)*(j+2));
			out.print("<td>"+text+"</td>");
		}
		out.print("</tr>");
	}
%>
</table>
</body>
</html>
