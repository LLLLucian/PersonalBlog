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
<link rel="stylesheet" type="text/css" href="../../css/article.css" />
<link rel="stylesheet" type="text/css" href="../../css/addarticle.css" />

</head>

<body>
	<%@include file="../../common/header.jsp"%>

	<%
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		ArticleDao articledao = applicationContext.getBean("ArticleDao",
				ArticleDao.class);
		int articleid = Integer.parseInt(request.getParameter("articleid"));
		
	%>

	<div id="content">
		<div class="left" id="riji">
			<div class="rj_content">
				<div class="shiguang">
				
					<form action="index/article/modifycheck.jsp?articleid=<%=articleid%>" method="post" class="smart-green">
						<h1>修改文章<a href="index/article.jsp">返回</a></h1>	
						<label>
							<span>标题:</span>
							<input id="name" type="text" name="title" value="<%=articledao.getArticleById(articleid).getArticleTitle()%>"/>
						</label>
						<label>
							<span>内容:</span>
							<textarea id="message" name="detail"><%=articledao.getArticleById(articleid).getArticleDetail()%></textarea>
						</label>
						<label>
							<span>&nbsp;</span>
						<input type="submit" class="button" value="保存" />
						</label>
					</form>
				</div>
			</div>
		</div>
		<%@include file="../../common/right.jsp"%>
		<div class="clear"></div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>
