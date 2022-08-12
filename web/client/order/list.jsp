<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<% Object username = request.getSession().getAttribute("username");%>

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
                    <td>${Helper.Currency(row.TotalMoney)}</td>
                    <td>${Helper.Span(row.Payment == 1, "Đã thanh toán", "Chưa thanh toán")}</td>
                    <td>${Helper.Date(row.CreatedAt)}</td>
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