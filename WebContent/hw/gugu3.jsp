<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugu3</title>
<style>
	table {border-collapse:collapse;}
	td {border:1px solid gray; padding:5px;}
</style>
</head>
<body>
<%
	String [][] guguArray=new String[8][9];
	for(int i=0;i<8;i++){
		for(int j=0;j<9;j++){
			guguArray[i][j]=new String();
		}		
	}
	
	for(int i=2;i<=9;i++){
		for(int j=1;j<=9;j++){
			guguArray[i-2][j-1]=Integer.toString(i)+" X "+Integer.toString(j)+" = "+Integer.toString(i*j);
		}		
	}
	
	String [] guguArrayFrame=new String[8];
	for(int i=0;i<8;i++){
		guguArrayFrame[i]="";
		for(int j=0;j<9;j++){
			if(j>0){			
				guguArrayFrame[i]+="<br>"+guguArray[i][j];
			}
			else{
				guguArrayFrame[i]+=guguArray[i][j];
			}
		}		
	}
%>

<table>
	<% 
		int frameNum=0;
		for(int row=0;row<2;row++){
			out.print("<tr>");	
			for(int collum=0;collum<4;collum++){
				out.print("<td>"+guguArrayFrame[frameNum]+"</td>");
				frameNum++;
			}
			out.print("</tr>");	
			
		}	
	%>
</table>
</body>
</html>
