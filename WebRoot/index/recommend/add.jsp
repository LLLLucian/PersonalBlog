<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,com.blog.Object.*,java.util.List,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'recommend.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../../css/recommend.css" />
<link rel="stylesheet" type="text/css" href="../../css/addrecommend.css" />

</head>

<body>
	<%@include file="../../common/header.jsp"%>
	<div id="content">
		<div class="left" id="c_left">
			<div class="content_text">
				<div class="wz">
					<form action="index/recommend/addcheck.jsp" method="post" class="basic-grey">
						<h1>
							添加推荐<a href="index/recommend.jsp">返回</a>
						</h1>
						<label> <span>标题名：</span> <input id="name" type="text"
							name="title" placeholder="标题名" /> </label> <label> <span>推荐链接：</span>
							<input id="email" type="text" name="location" placeholder="推荐链接" />
						</label> <label> <span>推荐简介：</span> <textarea id="message" type="text"
								name="intro" placeholder="推荐简介"></textarea> </label> <label> <span>&nbsp;</span>
							<input type="submit" class="button" value="提交" /> </label>
					</form>
				</div>
			</div>
		</div>
		<%@include file="../../common/right.jsp"%><div
			class="clear"></div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>
