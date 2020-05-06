<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jsp_hw.jdbc1.*, jsp_hw.exam2.*"%>
<%
List<Book> bookList = BookDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
div.container {
	width: 600px;
	margin: 50px auto;
}

thead th {
	background-color: #eee;
}

table {
	border-collapse: collapse;
	width: 100%;
}

td, th {
	padding: 4px;
	border: 1px solid lightgray;
}

td:nth-child(4) {
	text-align: center;
}
div.searchTab {
	display: inline-block;
}

</style>
</head>
<body>
	<div class="container">

		<h1>책목록</h1>
	
		<form action="bookList2.jsp">
			<span>저자</span>
			<input type="text" name="bookText" placeholder="검색조건" />
			<button type="submit" value = searchGo>조회</button>
		</form>
		<p></p>

		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>id</th>
					<th>제목</th>
					<th>저자</th>
					<th>카테고리</th>
					<th>가격</th>
					<th>출판사</th>
				</tr>
			</thead>
			<tbody>
				<% for (Book bookData : bookList) { %>
				<tr>
					<td><%= bookData.getId() %></td>
					<td><%= bookData.getTitle() %></td>
					<td><%= bookData.getAuthor() %></td>
					<td><%= bookData.getCategoryName() %></td>
					<td><%= bookData.getPrice() %></td>
					<td><%= bookData.getPublisher() %></td>
				</tr>
				<% } %>
			</tbody>
		</table>

	</div>
</body>
</html>
