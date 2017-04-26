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
<link rel="stylesheet" type="text/css" href="../../css/comment.css" />

</head>

<body>
	<%@include file="../../common/header.jsp"%>
	<%
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		ArticleDao articledao = applicationContext.getBean("ArticleDao",
				ArticleDao.class);
		CommentDao commentdao = applicationContext.getBean("CommentDao",
				CommentDao.class);		
		int articleid = Integer.parseInt(request.getParameter("articleid"));
		List<Comment> comment = commentdao.getComment(articleid);
	%>

	<div id="content">
		<div class="left" id="riji">
			<div class="rj_content">
				<div class="shiguang">
					<div id="title">
						<h1><%=articledao.getArticleById(articleid).getArticleTitle()%></h1>
					</div>
					<textarea name="detail" id="detail" readonly="readonly"><%=articledao.getArticleById(articleid).getArticleDetail()%></textarea>
					<div id="comment">
						<span>评论区
							<a href="index/comment/add.jsp?articleid=<%=articleid%>">评论</a>
						</span>
						<%for (int i = 0; i < comment.size(); i++) { %>
		                <div class="right sg">
		                       	<p style="float: left; margin-left: 20px;"><%=comment.get(i).getCommentDetail()%></p>
		                       	<p style="float: right; margin-right: 20px;"><%=comment.get(i).getCommentUser()%>
		                <%
							if (session.getAttribute("station").equals(1) || session.getAttribute("id").toString().equals(comment.get(i).getCommentUser())) {
						%>       	
		                       	<a href="index/comment/delete.jsp?commentid=<%=comment.get(i).getCommentId()%>">删除</a>
		                <%} else{
		                }
		                %>
		                       </p>
		                </div> 
		                <%} %>
					</div>

					<div class="clear"></div>
				</div>
			</div>
		</div>
		<%@include file="../../common/right.jsp"%>
		<div class="clear"></div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>
