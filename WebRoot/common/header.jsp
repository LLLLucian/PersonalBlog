<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Header.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/main.css" />

</head>

<body>
	<div id="header">
		<h1>个人博客</h1>
		<p>梦想到达的地方，总有一天，脚步也能到达。</p>
	</div>
	<div id="nav">
		<ul>
			<li><a href="../Practice/index/recommend.jsp">首页</a></li>
			<li><a href="../Practice/index/user.jsp">博主信息</a></li>
			<li><a href="../Practice/index/article.jsp">我的文章</a></li>
			<li><a href="../Practice/index/photo.jsp">我的相册</a></li>
			<li><a href="../Practice/index/message.jsp">留言板</a></li>
			<div class="clear"></div>
		</ul>
	</div>
</body>
</html>
