<%@ page language="java" 	import="java.util.*,com.blog.Dao.*,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>My JSP 'checkmodify.jsp' starting page</title>
    
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
		UserDao userdao = applicationContext.getBean("UserDao",
				UserDao.class);
				System.out.print(userdao.getUser(session.getAttribute("blog").toString()).getId());
		userdao.ModifyUser(userdao.getUser(session.getAttribute("blog").toString()).getId(),
		 request.getParameter("username"), request.getParameter("password"),
		 Integer.parseInt(request.getParameter("age")), request.getParameter("sex"),
		 request.getParameter("qq"), request.getParameter("phone"));
		 //重置博主缓存
		 session.setAttribute("blog", userdao.getUserById(1).getUsername());
		 session.setAttribute("id", request.getParameter("username"));
		 response.sendRedirect("../user.jsp");
	%>
  
    This is my modifycheck page. <br>
  </body>
</html>
