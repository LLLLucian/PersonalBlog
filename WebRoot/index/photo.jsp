<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,com.blog.Object.*,java.util.List,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'photo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../css/photo.css" />

</head>

<body>
	<%@include file="../common/header.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("/applicationContext.xml");
		PhotoDao dao = applicationContext.getBean("PhotoDao",PhotoDao.class);
		List<Photo> photo = dao.getPhoto();
	%>
	<script type="text/javascript">
	    function validForm(fm){
	       fm.action = fm.action + "?name=" + encodeURIComponent(fm['name'].value);
	       return true;
	    }
	</script>
	
	<div id="content">
		<div class="left" id="guestbook">
			<div class="weizi"></div>
			<div class="g_content">
				<h2>
					我的相册
					<%
						if (session.getAttribute("station").equals(1)) {
					%>
						<form action="index/photo/upload.jsp" method="post" name="form1"  enctype="multipart/form-data" onsubmit="return validForm(this)">
							<input type="file" name="file"/>
							<lable>照片名：</lable>
							<input type="text" name="name"/>
							<input type="submit" name="Submit" value="上传"/> 
						</form>
					<%
						} else {
						}
					%>		
				</h2>
				<ul>
				<%
					for(int i = 0; i< photo.size(); i++){
				 %>
					<li class="ph"><img src="<%=basePath+photo.get(i).getPhotoLocation()%>" width="210"
						height="210" alt="" />
						
						<p>
							<%=photo.get(i).getPhotoName()%>
					<%
						if (session.getAttribute("station").equals(1)) {
					%>
						<a href="index/photo/delete.jsp?photoid=<%=photo.get(i).getPhotoId()%>">删除</a>
					<%
						} else {
						}
					%>	
					
						</p>
					</li>
				<%} %>
				</ul>
			</div>
		</div>
		<%@include file="../common/right.jsp"%><div
			class="clear"></div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
