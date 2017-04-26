<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,com.blog.Object.*,java.util.List,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'article.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../css/article.css" />

</head>

<body>
	<%@include file="../common/header.jsp"%>
	<%
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		ArticleDao articledao = applicationContext.getBean("ArticleDao",
				ArticleDao.class);
		List<Article> article = articledao.getArticle();
	%>
	<div id="content">
		<div class="left" id="riji">
			<div class="rj_content">
				<h2>
					我的文章
					<%
						if (session.getAttribute("station").equals(1)) {
					%>
					<a href="index/article/add.jsp">添加文章</a>
					<%
						} else {
						}
					%>
				</h2>
				<div class="shiguang">
				<%
					for (int i = 0; i < article.size(); i++) {
				%>				
					<div class="right sg_text">
						<p style="float: left; margin-left: 20px;"><%=article.get(i).getArticleTitle()%></p>
						<p style="float: right; margin-right: 20px;">
						<a href="index/article/detail.jsp?articleid=<%=article.get(i).getArticleId()%>">查看</a>
						<a href="index/comment/add.jsp?articleid=<%=article.get(i).getArticleId()%>">评论</a>
						<%
							if (session.getAttribute("station").equals(1)) {
						%>
						 <a href="index/article/modify.jsp?articleid=<%=article.get(i).getArticleId()%>">修改</a>
						 <a href="index/article/delete.jsp?articleid=<%=article.get(i).getArticleId()%>">删除</a>
						<%
							} else {
							}
						%>
						</p>
					</div>
				<%} %>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<%@include file="../common/right.jsp"%>
		<div class="clear"></div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
