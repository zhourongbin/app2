<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Help"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	Help help = (Help) request.getAttribute("help");
	Object user = session.getAttribute("user");
	if (user == null) {
		response.getWriter().println("<script>window.top.location.href='" + basePath + "';</script>");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看帮助文档</title>

<link href=" <%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<link href=" <%=basePath%>css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src=" <%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src=" <%=basePath%>js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src=" <%=basePath%>js/select-ui.min.js"></script>
<script type="text/javascript" src=" <%=basePath%>editor/kindeditor.js"></script>

 
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li1><a href="<%=basePath%>mainindex.jsp">首页</a></li1>
				<li1><a href="<%=basePath%>help.jsp">帮助查找</a></li1>
				<li1><a href="<%=basePath%>help/help_doFind.action">帮助列表</a></li1>
				<li1><a style="color:blue;"  href="<%=basePath%>help/help_doView.action?help.helpId=<%=help.getHelpId()%>">帮助详情</a></li1>
				<li1><a href="<%=basePath%>help.jsp">帮助添加</a></li1>
				<li1><a onClick="history.back(-1)">返回</a></li1>
		</ul>
	</div>

	<div class="formbody">
		<div class="formtitle">
			<span>帮助文档内容</span>
		</div>
		<ul class="forminfo">
			<li><label>文 档 标 题</label> <input value="<%=help.getHelpTitle()%>" style="width:320px;" readonly type="text" class="dfinput" /> </li>
			<li><label>文档关键字</label> <input value="<%=help.getHelpKeyWord()%>" style="width:320px;" readonly type="text" class="dfinput" /> </li>
			<li><label>文 档 时 间</label> <input value="<%=help.getHelpDate()%>" style="width:320px;" readonly type="text" class="dfinput" /> </li>
			<li><label>文 档 内 容</label> <textarea class="textinput" readonly style="margin-left:0px;"><%=help.getHelpContext()%></textarea></li>
			
			<div class="ibox"></div>
			
			<li><label>&nbsp;</label> 
			<a href="<%=basePath%>help/help_doEdit.action?help.helpId=<%=help.getHelpId()%>">
			<input name="" type="button" class="btn" value="修改" /></a> 
			<a href="<%=basePath%>help/help_doFind.action" /> <input type="button" name="button" class="btn" value="返回" /> </a></li>
		</ul>
	</div>
</body>
</html>
