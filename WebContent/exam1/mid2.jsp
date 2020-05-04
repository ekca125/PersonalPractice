<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mid2.jsp 구현</title>
<style type="text/css">
select, input, button {
	display: block;
	margin: 10px;
	height: 25px;
}

button {
	width: 100px;
}
</style>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
	String numberText=request.getParameter("numberTextCmd");
	if(numberText==null){
		numberText="one";	
	}
	String one_selected="one".equals(numberText)?"selected":"";
	String two_selected="two".equals(numberText)?"selected":"";
	String three_selected="three".equals(numberText)?"selected":"";
%>
	<form>
		<label><input type="radio" name="number" value="one">one</label>
		<label><input type="radio" name="number" value="two">two</label>
		<label><input type="radio" name="number" value="three">three</label>

		<input type="text" name="numberText" value=<%= numberText%> />
		<button type="submit" value=Ok>Ok</button>
	</form>
</body>
</html>