<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'right.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/main.css" />

</head>

<body>
	<div class="right" id="c_right">
		<div class="s_about">
			<h2>博主简介</h2>
			<p>博主名：<%=session.getAttribute("blog").toString() %></p>
			<p>
			<div class="clear"></div>
			</p>
		</div>
		<div class="s_about">
			<h2>访客信息</h2>
			<p>访客名：<%=session.getAttribute("id") %></p>
			<p>
				<a href="leave.jsp" style="text-decoration: underline;">退出登录</a>
			</p>
			<p>
			<div class="clear"></div>
			</p>
		</div>

	</div>
</body>
</html>
