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
<link rel="stylesheet" type="text/css" href="../css/user.css" />
</head>

<body>
	<%@include file="../common/header.jsp"%>
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
				<h2>
					博主信息
					<%
						if (session.getAttribute("station").equals(1)) {
					%>
					<a href="index/user/modify.jsp">更改信息</a>
					<%
						} else {
						}
					%>
				</h2>
				<ul>
					<li>姓名：<%=userdao.getUser(session.getAttribute("blog").toString()).getUsername() %></li>
					<li>年龄：<%=userdao.getUser(session.getAttribute("blog").toString()).getAge() %></li>
					<li>性别：<%=userdao.getUser(session.getAttribute("blog").toString()).getSex() %></li>
					<li>QQ：<%=userdao.getUser(session.getAttribute("blog").toString()).getQQ() %></li>
					<li>联系电话：<%=userdao.getUser(session.getAttribute("blog").toString()).getPhone() %></li>
				</ul>
			</div>
		</div>
		<%@include file="../common/right.jsp"%><div
			class="clear"></div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
