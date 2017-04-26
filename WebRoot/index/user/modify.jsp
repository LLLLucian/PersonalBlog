<%@ page language="java" 	import="java.util.*,com.blog.Dao.*,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'user.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../../css/user.css" />
<link rel="stylesheet" type="text/css" href="../../css/modifyuser.css" />
</head>

<body>
	<%@include file="../../common/header.jsp"%>
	<%
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		UserDao userdao = applicationContext.getBean("UserDao",
				UserDao.class);
	%>
	<div id="content">
		<div class="left" id="guestbook">
			<div class="weizi"></div>
			<div class="g_content">
				<h2>博主信息</h2>
				<form action="index/user/modifycheck.jsp" method="post" class="mes">		
		           	<ul>
		           		<li>用户名：<input class="user" type="text" name="username" value="<%=userdao.getUser(session.getAttribute("blog").toString()).getUsername() %>" /></li>
		           		<li>密码：<input class="user" type="text" name="password" placeholder="请输入密码"/></li>
		           		<li>年龄：<input class="user" type="text" name="age" value="<%=userdao.getUser(session.getAttribute("blog").toString()).getAge() %>"/></li>
		           		<li>性别：<input class="user" type="text" name="sex" value="<%=userdao.getUser(session.getAttribute("blog").toString()).getSex() %>"/></li>
		           		<li>QQ：<input class="user" type="text" name="qq" value="<%=userdao.getUser(session.getAttribute("blog").toString()).getQQ() %>"/></li>
		           		<li>联系电话：<input class="user" type="text" name="phone" value="<%=userdao.getUser(session.getAttribute("blog").toString()).getPhone() %>"/></li>
		           		<input class="sub_input" type="submit" value="修改" />
		           		<input class="sub_input" type="button" value="返回" onclick="window.location.href='index/user.jsp'" />
		           	</ul>
		        </form>
			</div>
		</div>
		<%@include file="../../common/right.jsp"%><div
			class="clear"></div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>
