<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<%
    String sql = "";
    String username = request.getSession().getAttribute("username").toString();
    if (request.getParameter("action") != null) {
        if (request.getParameter("action").equals("add")) {
            String watchID = request.getParameter("id");
            sql = "insert into carts values (null, '" + username + "', " + watchID + ", 1)";
        }
        if (request.getParameter("action").equals("update")) {
            String cartID = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            sql = "update carts set Quantity = " + quantity + " where CartID = " + cartID;
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
        <div class="heading_container heading_center">
            <h2>Giỏ hàng của tôi</h2>
        </div>

        <table class="table mt-5">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên đồng hồ</th>
                    <th>Hình ảnh</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th>Xoá</th>
                </tr>
            </thead>
            <tbody>
            <% int i = 1;%>
            <c:forEach var = "row" items = "${list.rows}">
                <tr>
                    <td><%=i++%></td>
                    <td>${row.WatchName}</td>
                    <td><a href="${row.Thumbnail}" target="_blank"><img height="50" src="${row.Thumbnail}" alt="${row.WatchName}" /></a></td>
                    <td>${Helper.Currency(row.Price)}</td>
                    <td>
                        <form action="?action=update" method="GET">
                            <div class="input-group input-group-sm">
                                <input name="action" type="hidden" value="update" />
                                <input name="id" type="hidden" value="${row.CartID}" />
                                <input min="1" style="width: 20px;" type="number" class="form-control" value="${row.Quantity}" name="quantity">
                                <div class="input-group-append">
                                    <button class="btn btn-primary"><i class="fa fa-save"></i></button>
                                </div>
                            </div>
                        </form>
                    </td>
                    <td>${Helper.Currency(row.Price * row.Quantity)}</td>
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

