<%@page import="java.net.URLDecoder"%>
<%@ page language="java"
	import="java.util.*,com.blog.Dao.*,com.blog.Object.*,java.net.*,java.util.List,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.jspsmart.upload.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'addcheck.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
    	ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		PhotoDao photodao = applicationContext.getBean("PhotoDao",
				PhotoDao.class);		    
	    String name = null;
	    String location = null;
   		String url="upload\\";
		//新建一个SmartUpload对象
		SmartUpload myUpload=new SmartUpload();
		//上传初始化
		myUpload.initialize(pageContext);
		//设置允许上传的文件
		myUpload.setAllowedFilesList("jpg,gif");
		//上传文件
		myUpload.upload();
		File myfile=myUpload.getFiles().getFile(0);
		/**
		 * 这个方法用于判断用户是否选择了文件，也即对应的表单项是否有值。
		 * 选择了文件时，它返回false。未选文件时，它返回true。 
		 */
		 System.out.println(myfile);
		 System.out.println(myfile.isMissing());
		if(!myfile.isMissing())
		{
			String ext=myfile.getFileExt(); //取得上传文件的扩展名 
			int y,m,d,h,mi,s;     
			Calendar cal=Calendar.getInstance();     
			y=cal.get(Calendar.YEAR);     
			m=cal.get(Calendar.MONTH)+1;     
			d=cal.get(Calendar.DATE);     
			h=cal.get(Calendar.HOUR_OF_DAY);     
			mi=cal.get(Calendar.MINUTE);     
			s=cal.get(Calendar.SECOND);
			String year=String.valueOf(y);
			String month=String.valueOf(m);
			String date=String.valueOf(d);
			String hour=String.valueOf(h);
			String minute=String.valueOf(mi);
			String second=String.valueOf(s);
			String time=year+month+date+hour+minute+second;
			String Path=application.getRealPath("/")+url;
			
			//照片名字
			name = request.getParameter("name");
			System.out.println("photoname:"+name);
			//name=URLDecoder.decode(name,"utf-8");
			name=new String(name.getBytes("iso-8859-1"),"utf-8");
			System.out.println("photonam2:"+name);
			//照片路径
			location ="images/" + time + "."+ ext;
			//System.out.println("location:" + location);
			 Path = request.getRealPath("/images");
			//存储路径
			// = "E:/MyEclipse Workplace/Practice/WebRoot/images/";
			//System.out.println("Path:"+Path);
			
			String imgFile=Path+"\\"+time+"."+ext;
			System.out.println(imgFile);
			myfile.saveAs(imgFile,myUpload.SAVE_PHYSICAL);
			System.out.println("上传成功");
		}
		else
		{
			System.out.println("上传失败");
		}
		
		//添加到数据库
		photodao.addPhoto(name, location);
		response.sendRedirect("../photo.jsp");
    %>
    This is my addcheck page. <br>
  </body>
</html>
