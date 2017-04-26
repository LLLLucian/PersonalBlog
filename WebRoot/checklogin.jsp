<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");	
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checklogin.jsp' starting page</title>
    
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
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			boolean flag = userdao.getPasswordByUser(username, password);
			//博主名设置
			session.setAttribute("blog", userdao.getUserById(1).getUsername());
			if (flag) {
			//station=1为用户
			session.setAttribute("station", 1);
			session.setAttribute("id", username);
		
			response.sendRedirect("index/recommend.jsp");
			System.out.print("正确登录");
			} else {
			if (username != null) {
				//密码错误
				response.sendRedirect("login.jsp");
				System.out.print("密码错误");
			}
			//游客登录
			else{
				//station=2为访客
				session.setAttribute("station", 2);
				
				//生成随机游客名
				int temp = (int) (Math.random()*100000);
				session.setAttribute("id", "游客"+temp);
				response.sendRedirect("index/recommend.jsp");
				System.out.print("游客登录");
			}

		}
	%>
  </body>
</html>
