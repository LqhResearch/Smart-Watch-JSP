<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@ page import = "config.DB" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<%
    String sql = "", sql1 = "";
    request.setCharacterEncoding("UTF-8");
    if (request.getParameter("action") != null) {
        if (request.getParameter("action").equals("payment")) {
            String orderID = request.getParameter("id");
            sql = "update orders set Payment = 1 where OrderID = '" + orderID + "'";
        }

        if (request.getParameter("action").equals("delete")) {
            String orderID = request.getParameter("id");
            sql = "delete from order_details where OrderID = '" + orderID + "'";
            sql1 = "delete from orders where OrderID = '" + orderID + "'";
        }
        response.sendRedirect("/admin/order/list.jsp");
    }
%>

<%    if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql%></sql:update>
<% }%>

<%    if (!sql1.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql1%></sql:update>
<% }%>

<% if (request.getParameter("edit-id") != null) {%>
<sql:query dataSource = "${db}" var = "editData">select * from categories where CategoryID = <%=request.getParameter("edit-id")%></sql:query>
<% }%>

<jsp:include page="/admin/header.jsp"></jsp:include>
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Đơn hàng</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <div class="btn btn-primary" data-toggle="modal" data-target="#modal-add"><i class="fas fa-plus"></i> Thêm</div>
                    <div class="btn btn-warning" hidden data-toggle="modal" data-target="#modal-edit"><i class="fas fa-marker"></i> Cập nhật</div>
                </div>
            </div>

        <sql:query dataSource = "${db}" var = "list">select * from orders order by CreatedAt desc;</sql:query>

            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-success">
                                <th>Mã đơn hàng</th>
                                <th>Tài khoản</th>
                                <th>Tổng đơn hàng</th>
                                <th>Ngày mua</th>
                                <th>Trạng thái</th>
                                <th width="116">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "row" items = "${list.rows}">
                            <tr>
                                <td><c:out value = "${row.OrderID}"/></td>                                
                                <td><c:out value = "${row.Username}"/></td>
                                <td><c:out value = "${row.TotalMoney}"/></td>
                                <td><c:out value = "${row.CreatedAt}"/></td>
                                <td>${row.Payment == "0" ? "<span class='badge badge-danger'>Chưa thanh toán</span>" : "<span class='badge badge-success'>Đã thanh toán</span>"}</td>
                                <td>
                                    <c:if test="${row.Payment == 0}">
                                        <a href="?action=payment&id=${row.OrderID}" class="btn btn-primary"><i class="fas fa-money-check-alt"></i></a>
                                        </c:if>
                                    <a onclick="removeRow(`${row.OrderID}`)" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/admin/footer.jsp"></jsp:include>