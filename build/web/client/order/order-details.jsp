<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<% String orderID = request.getParameter("id");%>

<sql:query dataSource = "${db}" var = "list">select * from users, orders, order_details,  watches where users.Username = orders.Username AND orders.OrderID = order_details.OrderID AND order_details.WatchID = watches.WatchID AND orders.OrderID = '<%=orderID%>'</sql:query>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link rel="stylesheet" href="/template/home/css/bootstrap.css" />
        </head>
        <body>
            <h2 class="text-center text-primary">HOÁ ĐƠN - <%=orderID%></h2>
        <br>

        <h4 class="text-primary"><b>I. THÔNG TIN CÁ NHÂN</b></h4>
        <p><b>Họ tên: </b>${list.getRows()[0].Fullname}</p>
        <p><b>Số điện thoại: </b>${list.getRows()[0].Phone}</p>
        <p><b>Email: </b>${list.getRows()[0].Email}</p>
        <br>

        <h4 class="text-primary"><b>II. CHI TIẾT ĐƠN HÀNG</b></h4>
        <table class="table table-bordered">
            <thead>
                <tr class="bg-success">
                    <th>STT</th>
                    <th>Tên đồng hồ</th>
                    <th>Hình ảnh</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;%>
                <c:forEach var = "row" items = "${list.rows}">
                    <tr>
                        <td><%=i++%></td>
                        <td>${row.WatchName}</td>
                        <td><a href="${row.Thumbnail}" target="_blank"><img height="50" src="${row.Thumbnail}" alt="" /></a></td>
                        <td>${Helper.Currency(row.Price)}</td>
                        <td>${row.Quantity}</td>
                        <td>${Helper.Currency(row.Price * row.Quantity)}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5"><b>Tổng tiền: </b></td>                                
                    <td>${Helper.Currency(list.getRows()[0].TotalMoney)}</td>
                </tr>
            </tbody>
        </table>

        <h4 class="text-primary"><b>III. TRẠNG THÁI ĐƠN HÀNG: ${Helper.Status(list.getRows()[0].Payment == 1, "Đã thanh toán", "Chưa thanh toán")}</b></h4>

        <script src="/template/home/js/jquery-3.4.1.min.js"></script>
        <script src="/template/home/js/bootstrap.js"></script>
        <script>
            window.print();
        </script>
    </body>
</html>