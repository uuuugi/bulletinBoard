<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bulletinBoard.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	bulletinBoardVO vo = new bulletinBoardVO();
	bulletinBoardDAO dao = new bulletinBoardDAO();

	vo.setId("id1");
	
	for(int i=0; i<153; i++)
	{
		vo.setName("name"+i);
		vo.setText("text"+i);
		dao.insertPost(vo);
	}
		
%>
</body>
</html>