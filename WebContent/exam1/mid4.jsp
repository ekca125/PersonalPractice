<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mid4</title>
<style type="text/css">
table {
	border-collapse: collapse;
	margin-top: 10px;
	width: 200px;
}

td {
	width : 200px;
	border: 1px solid gray;
}

label {
	display: block;
}

button {
	width: 100px;
}
div.error { margin: 10px; padding: 10px 20px; background-color: #fdd; border: 1px solid #faa; }
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	String nameText = request.getParameter("nameText");
	String genderText=request.getParameter("genderText");
	String errorText="";
	
	if(nameText==null&&genderText==null){
		nameText="";
		genderText="";
	}
	else if(nameText==null||nameText==""){
		errorText="회원등록 실패: 이름을 입력하세요";		
	}
	else if(genderText==null||genderText==""){
		errorText="회원등록 실패: 성별을 입력하세요";		
	}
	
	String male_selected = "male".equals(genderText) ? "checked" : "";
	String female_selected = "female".equals(genderText) ? "checked" : "";

	
%>
<body>
	<h3>회원 등록</h3>

	<form>
		<label>이름</label> 
		<input type="text" name="nameText" value=<%=nameText%>>
		<p></p>
		<label>성별</label> 
		<label><input type="radio" name="genderText" value="남자" <%= male_selected%>>남자</label> 
		<label><input type="radio" name="genderText" value="여자" <%= female_selected%>>여자</label>
		<p></p>
		<button type="submit" value=Ok>회원 등록</button>
	</form>
	<%if(errorText!=""){ %>
	<div class="error"><p><%= errorText%></p></div>
		<%} %>
	
	<table>
		<tr>
			<td>
				이름
			</td>
			<td>
				<%= nameText%>			
			</td>
		</tr>
		<tr>
			<td>
				성별
			</td>
			<td>
				<%= genderText%>
			</td>
		</tr>
	</table>
	
</body>
</html>