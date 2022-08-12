<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import="config.Helper" %>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${Helper.HOST}:${Helper.PORT}/${Helper.DBNAME}"
                   user = "${Helper.USERNAME}"  password = "${Helper.PASSWORD}"/>

<% request.setCharacterEncoding("UTF-8");%>