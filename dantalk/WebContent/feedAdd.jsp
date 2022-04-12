<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="jdbc.*"%>
<%@page import="util.FileUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");


String uid = null;
String ucon = null;
String ufname = null;
byte[] ufile = null;

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
List items = sfu.parseRequest(request);
Iterator iter = items.iterator();

while(iter.hasNext()){
	FileItem item = (FileItem) iter.next();
	String name = item.getFieldName();
	if(item.isFormField()){
		String value = item.getString("utf-8");
		if(name.equals("uid")) uid = value;
		else if(name.equals("ucon")) ucon = value;
	}else{
		if(name.equals("uimage")){
			ufname = item.getName();
			ufile = item.get();
			String root = application.getRealPath(java.io.File.separator);
			FileUtil.saveImage(root, ufname, ufile);
		}
	}
	
}

FeedDAO dao = new FeedDAO();
if(dao.insert(uid, ucon, ufname)){
	response.sendRedirect("main.jsp");
}

%>