<%@ page language="java"
	import="java.util.*,java.lang.Integer.*,com.blog.Dao.*,com.blog.Object.*,java.util.List,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'delete.jsp' starting page</title>
    
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
    	ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		MessageDao messagedao = applicationContext.getBean("MessageDao",
				MessageDao.class);
				
   		int messageid = Integer.parseInt(request.getParameter("messageid"));
   		//System.out.print(Integer.parseInt(recommendid));
		messagedao.deleteMessage(messageid);
   		response.sendRedirect("../message.jsp");
    %>
    
    This is my medelete page. <br>
  </body>
</html>
