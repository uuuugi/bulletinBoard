<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bulletinBoard.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a, a:link, a:visited{
text-decoration:none;
color:black;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int pageNum=1;
	if(request.getParameter("pageNum")!=null)
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	
	bulletinBoardDAO dao = new bulletinBoardDAO();
	ArrayList<String> postList	= new ArrayList <String> ( dao.getPostList() );
%>
	<table id="postList">
	<% 
	int i= pageNum*10-10;
	for(; i<pageNum*10; i++){
		if(i==postList.size())
			break;
	%>
	<tr>
		<td> 
		<form method="post" action="text.jsp" id='<%=postList.get(i) %>'> <!-- postName별로 form 생성 form id는 postName으로 지정하여 유니크값 으로 생성 -->
		<input type="hidden" name="Name" value=<%=postList.get(i) %>> <!-- postName의 value를 저장할 부분을 생성하나 사이트상에 표시하지는 않음 -->
		</form>
		<a href="#" onclick="document.getElementById('<%=postList.get(i) %>').submit();"><%=postList.get(i) %> </a></td> <!-- 클릭시 page 이동하여 text 출력 -->
	<% } %>
	</table>
	<hr>
	<table id="pageNum">
	<tr>
	<% 
	int j=pageNum;
	if(j<5)
		j=1;
	else
		j-=4;
	for(; j<pageNum+10; j++){ 
		if(j-2>=postList.size()/10)
			break;
	%>
		<td> 
		<form method="post" action="bulletinBoardList.jsp" id='<%=j %>'> <!-- postName별로 form 생성 form id는 postName으로 지정하여 유니크값 으로 생성 -->
		<input type="hidden" name="pageNum" value=<%=j %>> <!-- postName의 value를 저장할 부분을 생성하나 사이트상에 표시하지는 않음 -->
		</form>
		<a href="#" onclick="document.getElementById('<%=j %>').submit();"><%=j %> </a></td> <!-- 클릭시 page 이동하여 text 출력 -->
	<% } %>
	</tr>
	</table>
</body>
</html>