<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mid2.jsp 구현</title>
<style type="text/css">
input, button {
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
		
		String one_selected2="one".equals(numberText)?"selected":"";
		String two_selected2="two".equals(numberText)?"selected":"";
		String three_selected2="three".equals(numberText)?"selected":"";
	%>
	<form>
		<label><input type="radio" name="number" value="one"
			<%=one_selected%>>one</label> 
			
			<label><input type="radio"
			name="number" value="two" <%=two_selected%>>two</label> 
			
			<label><input
			type="radio" name="number" value="three" <%=three_selected%>>three</label>
	
		<select name="numberText2">
              <option value="one" <%= one_selected2%> >one</option>
              <option value="two" <%= two_selected2%> >two</option>
              <option value="three" <%= three_selected2%> >three</option>
         	</select>
	
		<input type="text" name="numberText" value=<%=numberText%> />
		<button type="submit" value=Ok>Ok</button>
	</form>
</body>
</html>