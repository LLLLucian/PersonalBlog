<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,com.blog.Object.*,java.util.List,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'addcheck.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<%
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"/applicationContext.xml");
		RecommendDao recommenddao = applicationContext.getBean("RecommendDao", RecommendDao.class);
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String intro = request.getParameter("intro");
		System.out.print(title+location+intro);
		recommenddao.addRecommend(title, intro, location);
		response.sendRedirect("../recommend.jsp");
	%>    
  
    This is my addrecommendcheckup page. <br>
  </body>
</html>
