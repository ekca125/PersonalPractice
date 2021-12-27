<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mid2</title>
<style type="text/css">
input, button {
	margin: 10px;
	height: 25px;
}

button {
	display: block;
	width: 100px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%
		String numberText = request.getParameter("number");
		if (numberText == null) {
			numberText = "one";
		}
		String one_selected = "one".equals(numberText) ? "checked" : "";
		String two_selected = "two".equals(numberText) ? "checked" : "";
		String three_selected = "three".equals(numberText) ? "checked" : "";
	%>
	<form>
		<div id="radioDiv">
		<label><input type="radio" name="number" value="one"
			<%=one_selected%>>one</label> 
			
			<label><input type="radio"
			name="number" value="two" <%=two_selected%>>two</label> 
			
			<label><input
			type="radio" name="number" value="three" <%=three_selected%>>three</label>
		</div>
		
		<input type="text" name="numberText" value=<%=numberText%> />
		<button type="submit" value=Ok>Ok</button>
	</form>
</body>
</html>