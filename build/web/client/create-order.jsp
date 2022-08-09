<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "config.DB" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<%
    // Get username
    String username = request.getSession().getAttribute("username").toString();

    // Create orderID by random integer
    Random rd = new Random();
    String orderID = "SW";
    for (int i = 0; i < 10; i++) {
        orderID += String.valueOf(rd.nextInt(10));
    }
%>

<sql:query dataSource = "${db}" var = "totalMoney">select IFNULL(SUM(Price * Quantity), 0) as money from carts, watches where carts.WatchID = watches.WatchID and Username = '${username}'</sql:query>
<sql:query dataSource = "${db}" var = "cartList">select * from carts where Username = '${username}';</sql:query>

    <!--Create new order-->
<sql:update dataSource = "${db}" var = "nonQuery">
    insert into orders (OrderID, TotalMoney, Username) values ('<%=orderID%>', ${totalMoney.getRows()[0].money}, '${username}')
</sql:update>

<!--Create order details-->
<c:forEach var = "row" items = "${cartList.rows}">
    <sql:update dataSource = "${db}" var = "nonQuery">
        insert into order_details values (null, '<%=orderID%>', ${row.WatchID}, ${row.Quantity})
    </sql:update>
</c:forEach>

<!--Delete carts-->
<sql:update dataSource = "${db}" var = "nonQuery">
    delete from carts where Username = '<%=username%>'
</sql:update>

<% response.sendRedirect("/client/cart.jsp");%>