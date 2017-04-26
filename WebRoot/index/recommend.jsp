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
<link rel="stylesheet" type="text/css" href="../css/recommend.css" />

</head>

<body>
	<%@include file="../common/header.jsp"%>
	<%
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		RecommendDao dao = applicationContext.getBean("RecommendDao",
				RecommendDao.class);
		List<Recommend> recommend = dao.getRecommend();
	%>
	<div id="content">
		<!--left-->
		<div class="left" id="c_left">
			<div class="s_tuijian">
				<h2>
					博主推荐
					<%
						if (session.getAttribute("station").equals(1)) {
					%>
					<a href="index/recommend/add.jsp">添加推荐</a>
					<%
						} else {
						}
					%>
				</h2>
			</div>
			<%
				for (int i = 0; i < recommend.size(); i++) {
			%>
			<div class="content_text">
				<div class="wz">
					<h3><%=recommend.get(i).getRecommendTitle()%></h3>
					<dl>
						<dd>
							<p class="dd_text_1"><%=recommend.get(i).getRecommendIntro()%></p>
							<p class="dd_text_2">
								<span class="left yd"> 
									<a href="<%=recommend.get(i).getRecommendLocation()%>" title="阅读全文">阅读全文</a>
								</span> 
								<%
 								if (session.getAttribute("station").equals(1)) {
 								%> 
 								<a href="index/recommend/delete.jsp?recommendid=<%=recommend.get(i).getRecommendId()%>" style="font-size: 15px; text-decoration: underline;">删除</a>
								<%
									} else {
										}
								%>
							
							<div class="clear"></div>
							</p>
						</dd>
						<div class="clear"></div>
					</dl>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<%@include file="../common/right.jsp"%><div
			class="clear"></div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
