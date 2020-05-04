<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {border-collapse:collapse; margin-top:10px; width:200px;}
	td {border:1px solid gray;}
label {display : block;}


button {
	width: 100px;
}
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	String nameText = request.getParameter("nameText");
	if(nameText==null){
		nameText="";
	}
	String genderText=request.getParameter("nameText");
	if(genderText==null){
		genderText="";
	}
	if(nameText!=""&&genderText!=""){
		String male_selected = "male".equals(genderText) ? "checked" : "";
		String female_selected = "female".equals(genderText) ? "checked" : "";
	}
%>
<body>
	<form>
		<label>이름</label> 
		<input type="text" name="nameText" value=<%=-1%> />
		
		<label>성별</label> 
		<label><input type="radio" name="gender" value="male">남자</label> 
		<label><input type="radio" name="gender" value="female">여자</label>
		<button type="submit" value=Ok>회원 등록</button>
		
	</form>
	<table>
		<tr>
			<td>
				이름
			</td>
			<td>
				없음
			</td>
		</tr>
		<tr>
			<td>
				성별
			</td>
			<td>
				없음
			</td>
		</tr>
	</table>
	
</body>
</html>