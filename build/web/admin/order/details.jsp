<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@ page import = "config.DB" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<% String orderID = request.getParameter("id");%>

<jsp:include page="/admin/header.jsp"></jsp:include>
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item"><a href="/admin/order/list.jsp">Đơn hàng</a></li>
                <li class="breadcrumb-item active">Chi tiết đơn hàng - <%=orderID%></li>
        </ol>
    </div>
</section>

<section class="content">
    <sql:query dataSource = "${db}" var = "list">select * from users, orders, order_details,  watches where users.Username = orders.Username AND orders.OrderID = order_details.OrderID AND order_details.WatchID = watches.WatchID AND orders.OrderID = '<%=orderID%>'</sql:query>

        <div class="card">
            <div class="card-body">
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
                        <th>Tên đồng hồ</th>
                        <th>Hình ảnh</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var = "row" items = "${list.rows}">
                        <tr>
                            <td><c:out value = "${row.WatchName}"/></td>
                            <td><a href="${row.Thumbnail}" target="_blank"><img height="50" src="${row.Thumbnail}" alt="" /></a></td>
                            <td><c:out value = "${row.Price}"/></td>
                            <td><c:out value = "${row.Quantity}"/></td>
                            <td><c:out value = "${row.Price * row.Quantity}"/></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4"><b>Tổng tiền: </b></td>                                
                        <td>${list.getRows()[0].TotalMoney}</td>
                    </tr>
                </tbody>
            </table>
            <button class="btn btn-primary mt-4" onclick="printPage(this)"><i class="fas fa-print"></i> In hoá đơn</button>
        </div>
    </div>
</div>
</section>
<jsp:include page="/admin/footer.jsp"></jsp:include>

<script>
    function printPage(_this) {
        _this.style.display = 'none';
        window.print();
    }
</script>