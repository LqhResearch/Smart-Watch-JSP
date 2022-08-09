<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="config.DB" %>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<%
    String sql = "";
    String username = request.getSession().getAttribute("username").toString();
    if (request.getParameter("action") != null) {
        if (request.getParameter("action").equals("add")) {
            String watchID = request.getParameter("id");
            sql = "insert into carts values (null, '" + username + "', " + watchID + ", 1)";
        }
        if (request.getParameter("action").equals("delete")) {
            String cartID = request.getParameter("id");
            sql = "delete from carts where CartID = " + cartID;
        }

        response.sendRedirect("/client/cart.jsp");
    }
%>

<% if (sql != "") {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql%></sql:update>
<% }%>

<sql:query dataSource = "${db}" var = "list">select * from carts, watches where carts.WatchID = watches.WatchID and Username = '<%=username%>';</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <section class="container layout_padding">
        <table class="table">
            <thead>
                <tr>
                    <th>Mã đồng hồ</th>
                    <th>Tên đồng hồ</th>
                    <th>Hình ảnh</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th>Xoá</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var = "row" items = "${list.rows}">
                <tr>
                    <td>${row.WatchID}</td>
                    <td>${row.WatchName}</td>
                    <td><img height="50" src="${row.Thumbnail}" alt="" /></td>
                    <td>${row.Price}</td>
                    <td>${row.Quantity}</td>
                    <td>${row.Price * row.Quantity}</td>
                    <td><a href="?action=delete&id=${row.CartID}">Xoá</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <sql:query dataSource = "${db}" var = "countCart">select COUNT(*) as count from carts where Username = '<%=username%>'</sql:query>

    <c:if test="${countCart.getRows()[0].count > 0}">
        <div class="shop_section">
            <div class="btn-box">
                <a href="/client/create-order.jsp" class="btn1">Tạo đơn hàng</a>
            </div>
        </div>
    </c:if>
</section>
<jsp:include page="/client/footer.jsp"></jsp:include>

