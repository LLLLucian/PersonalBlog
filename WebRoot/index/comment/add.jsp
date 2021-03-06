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
<link rel="stylesheet" type="text/css" href="../../css/message.css" />
<link rel="stylesheet" type="text/css" href="../../css/addmessage.css" />

</head>

<body>
	<%@include file="../../common/header.jsp"%>
	<%
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		CommentDao commentdao = applicationContext.getBean("CommentDao",
				CommentDao.class);
		ArticleDao articledao = applicationContext.getBean("ArticleDao",
				ArticleDao.class);
		int articleid = Integer.parseInt(request.getParameter("articleid"));
		
		//commentdao.deleteComment(commentid);
   		//response.sendRedirect("../article/detail.jsp?articleid="+ articleid);
	%>  
	<div id="content">
		<div id="say">
			<div class="weizi">
				<h2>评论区</h2>
			</div>

          <ul class="say_box">
                     <div class="sy">
                     	<form action="index/comment/addcheck.jsp?articleid=<%=articleid%>" method="post" class="mes">
							<input id="me_input" type="text" name="comment" />
							<input id="sub_input" type="submit" value="评论" />
						</form>
                     </div>
                  <span class="dateview"><%=session.getAttribute("id")%></span>
          </ul>
		</div>
		<div class="clear"></div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>
