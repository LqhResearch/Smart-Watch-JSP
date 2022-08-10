<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="config.DB" %>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<% String username = request.getSession().getAttribute("username").toString();%>

<sql:query dataSource = "${db}" var = "list">select * from orders where Username = '<%=username%>';</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <section class="container layout_padding">
        <div class="heading_container heading_center">
            <h2>Đơn hàng của tôi</h2>
        </div>

        <table class="table mt-5">
            <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Tổng số tiền</th>
                    <th>Trạng thái</th>
                    <th>Ngày đặt</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var = "row" items = "${list.rows}">
                <tr>
                    <td>${row.OrderID}</td>
                    <td>${row.TotalMoney}</td>
                    <td>${row.Payment}</td>
                    <td>${row.CreatedAt}</td>
                    <td><a href="/client/order/order-details.jsp?id=${row.OrderID}" class="btn btn-primary btn-sm">Xem chi tiết</a></td>
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