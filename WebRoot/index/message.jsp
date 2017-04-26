<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,com.blog.Object.*,java.util.List,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'message.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../css/message.css" />

</head>

<body>
	<%@include file="../common/header.jsp"%>
	<%
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
			"/applicationContext.xml");
			MessageDao dao = applicationContext.getBean("MessageDao", MessageDao.class);
			List<Message> message = dao.getMessage();
	%>
	<div id="content">
		<div id="say">
			<div class="weizi">
				<h2>
					留言板<a href="index/message/add.jsp">我要留言</a>
				</h2>
			</div>
			<%
				for (int i = 0; i < message.size(); i++) {
			%>
			<ul class="say_box">
				<div class="sy">
					<p>
						<%=message.get(i).getMessageDetail()%>
						<%
							if (session.getAttribute("station").equals(1) || session.getAttribute("id").toString().equals(message.get(i).getMessageUser())) {
						%>
							<a href="index/message/delete.jsp?messageid=<%=message.get(i).getMessageId()%>">删除</a>
						<%
							} else {
							}
						%>						

					</p>
				</div>
				<span class="dateview"><%=message.get(i).getMessageUser()%>
				</span>
			</ul>
			<%
				}
			%>
		</div>
		<div class="clear"></div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
