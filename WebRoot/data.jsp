<%@ page import="cn.edu.zjut.util.CustomerUtil" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String info = request.getParameter("info");
	String answer = CustomerUtil.getResult(info);
	out.print(answer);
%>