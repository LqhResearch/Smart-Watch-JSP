<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<%
    String sql = "";
    if (request.getParameter("action") != null) {
        if (request.getParameter("action").equals("add")) {
            String name = request.getParameter("name");
            sql = "insert into categories values (null, '" + name + "')";
        }

        if (request.getParameter("action").equals("edit")) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            sql = "update categories set CategoryName = '" + name + "' where CategoryID = " + id;
        }

        if (request.getParameter("action").equals("delete")) {
            String id = request.getParameter("id");
            sql = "delete from categories where CategoryID = " + id;
        }

        response.sendRedirect("/admin/category/list.jsp");
    }
%>

<%    if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql%></sql:update>
<% }%>

<% if (request.getParameter("edit-id") != null) {%>
<sql:query dataSource = "${db}" var = "editData">select * from categories where CategoryID = <%=request.getParameter("edit-id")%></sql:query>
<% }%>

<jsp:include page="/admin/header.jsp"></jsp:include>
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Danh mục</li>
            </ol>
        </div>
    </section>

    <!--Modal: Add-->
    <div class="modal fade" id="modal-add">
        <form class="modal-dialog" method="POST">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Thêm danh mục</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên danh mục</label>
                        <input type="text" class="form-control" name="name">
                    </div>
                    <input type="hidden" name="action" value="add">
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-ban"></i> Huỷ</button>
                    <button class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
                </div>
            </div>
        </form>
    </div>

    <!--Modal: Edit-->
    <div class="modal fade" id="modal-edit">
        <form class="modal-dialog" method="POST">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h5 class="modal-title">Cập nhật danh mục</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã danh mục</label>
                        <input type="text" class="form-control" name="id" readonly value="${editData.getRows()[0].CategoryID}">
                </div>
                <div class="form-group">
                    <label>Tên danh mục</label>
                    <input type="text" class="form-control" name="name" value="${editData.getRows()[0].CategoryName}">
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
        <div class="card">
            <div class="card-body">
                <div class="btn btn-primary" data-toggle="modal" data-target="#modal-add"><i class="fas fa-plus"></i> Thêm</div>
                <div class="btn btn-warning" hidden data-toggle="modal" data-target="#modal-edit"><i class="fas fa-marker"></i> Cập nhật</div>
            </div>
        </div>

        <sql:query dataSource = "${db}" var = "list">select * from categories;</sql:query>

            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-success">
                                <th>Mã danh mục</th>
                                <th>Tên danh mục</th>
                                <th width="112">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "row" items = "${list.rows}">
                            <tr>
                                <td>${row.CategoryID}</td>                                
                                <td>${row.CategoryName}</td>
                                <td>
                                    <a href="?edit-id=${row.CategoryID}" class="btn btn-warning"><i class="fas fa-marker"></i></a>
                                    <a onclick="removeRow(${row.CategoryID})" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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