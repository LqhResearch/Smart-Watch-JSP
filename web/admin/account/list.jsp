<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>
<%
    String sql = "";
    if (request.getParameter("action") != null) {
        if (request.getParameter("action").equals("edit")) {
            String id = request.getParameter("id");
            String status = request.getParameter("status");
            String role = request.getParameter("role");
            sql = "update users set Status = " + status + ", Role = " + role + " where Username = '" + id + "'";
        }
        response.sendRedirect("/admin/account/list.jsp");
    }
%>

<%    if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql%></sql:update>
<% }%>

<% if (request.getParameter("edit-id") != null) {%>
<sql:query dataSource = "${db}" var = "editData">select * from users where Username = '<%=request.getParameter("edit-id")%>'</sql:query>
<% }%>

<jsp:include page="/admin/header.jsp"></jsp:include>
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Tài khoản</li>
            </ol>
        </div>
    </section>

    <!--Modal: Edit-->
    <div class="modal fade" id="modal-edit">
        <form class="modal-dialog" method="POST">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h5 class="modal-title">Cập nhật tài khoản</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên đăng nhập</label>
                        <input type="text" class="form-control" name="id" readonly value="${editData.getRows()[0].Username}">
                </div>
                <div class="form-group">
                    <label>Trạng thái</label>
                    <select class="form-control select2" name="status">
                        <option value="1" ${editData.getRows()[0].Status == "1" ? "selected" : ""}>Hoạt động</option>
                        <option value="0" ${editData.getRows()[0].Status == "0" ? "selected" : ""}>Khoá</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Loại tài khoản</label>
                    <select class="form-control select2" name="role">
                        <option value="1" ${editData.getRows()[0].Role == "1" ? "selected" : ""}>Quản trị viên</option>
                        <option value="2" ${editData.getRows()[0].Role == "2" ? "selected" : ""}>Thành viên</option>
                    </select>
                </div>
                <input type="hidden" name="action" value="edit">
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-ban"></i> Huỷ</button>
                <button class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
            </div>
        </div>
    </form>
</div>

<section class="content">
    <div class="container-fluid">
        <div class="btn btn-warning" hidden data-toggle="modal" data-target="#modal-edit"><i class="fas fa-marker"></i> Cập nhật</div>

        <sql:query dataSource = "${db}" var = "list">select * from users;</sql:query>

            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-success">
                                <th>Tên đăng nhập</th>
                                <th>Họ tên</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Trạng thái</th>
                                <th>Loại tài khoản</th>
                                <th width="112">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "row" items = "${list.rows}">
                            <tr>
                                <td>${row.Username}</td>                                
                                <td>${row.Fullname}</td>
                                <td>${Helper.Phone(row.Phone)}</td>
                                <td>${row.Email}</td>
                                <td>${Helper.Status(row.Status == 1, "Hoạt động", "Khoá")}</td>
                                <td>${Helper.Span(row.Role == 1, "Quản trị viên", "Thành viên")}</td>
                                <td>
                                    <a href="?edit-id=${row.Username}" class="btn btn-warning"><i class="fas fa-marker"></i></a>
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