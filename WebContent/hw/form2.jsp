<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form2</title>
<style type="text/css">
	select,input,button {display:block; margin:10px; height: 25px;}
	button {width : 100px;}
</style>
</head>
<body>
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
			<select name="numberTextCmd">
              <option value="one" <%= one_selected%> >one</option>
              <option value="two" <%= two_selected%> >two</option>
              <option value="three" <%= three_selected%> >three</option>
         	</select>
         	<input type="text" name="numberText" value=<%= numberText%> />
         	<button type="submit" value = Ok>Ok</button>
	</form>
</body>
</html>