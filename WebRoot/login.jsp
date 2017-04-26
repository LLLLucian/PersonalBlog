<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
<body>

	<div class="container">
		<section id="content">
		<form method="post" action="checklogin.jsp">
			<h1>个人博客</h1>
			<div>
				<input type="text" placeholder="用户名" required="" id="username"
					name="username" />
			</div>
			<div>
				<input type="password" placeholder="密码" required="" id="password"
					name="password" />
			</div>
			<div>
				<input type="submit" value="登录" /> <a href="checklogin.jsp"
					style="font-size: 20px;">游客访问</a>
			</div>
		</form>
		</section>
	</div>
</body>
</html>
