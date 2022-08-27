<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<%
    HashMap<String, String> formData = new HashMap<String, String>();
    String localPath = Helper.PRODUCT_UPLOAD;

    if (request.getContentType() != null && request.getContentType().indexOf("multipart/form-data") >= 0) {
        ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory(5120000, new File("c:\\temp")));

        try {
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    String fileName = fi.getName();
                    File file = new File(localPath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    fi.write(file);
                    formData.put("fileName", "/assets/product/" + fileName);
                } else {
                    formData.put(fi.getFieldName(), fi.getString("UTF-8"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
%>

<%
    String sql = "";
    if (formData.get("action") != null) {
        if (formData.get("action").equals("add")) {
            sql = "insert into watches values (null, '" + formData.get("name") + "', '" + formData.get("fileName") + "', '" + formData.get("description") + "', " + formData.get("price") + ", '" + formData.get("trademark") + "', " + formData.get("category") + ")";
        }

        if (formData.get("action").equals("edit")) {
            sql = "update watches set WatchName = '" + formData.get("name") + "', Description = '" + formData.get("description") + "', Thumbnail = '" + formData.get("fileName") + "', Price = '" + formData.get("price") + "', Trademark = '" + formData.get("trademark") + "', CategoryID = '" + formData.get("category") + "' where WatchID = " + formData.get("id");
        }
        response.sendRedirect("/admin/watch/list.jsp");
    }

    if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
        String id = request.getParameter("id");
        sql = "delete from watches where WatchID = " + id;
        response.sendRedirect("/admin/watch/list.jsp");
    }
%>

<%    if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql%></sql:update>
<% }%>

<% if (request.getParameter("edit-id") != null) {%>
<sql:query dataSource = "${db}" var = "editData">select * from watches where WatchID = <%=request.getParameter("edit-id")%></sql:query>
<% }%>

<sql:query dataSource = "${db}" var = "cateList">select * from categories;</sql:query>

<jsp:include page="/admin/header.jsp"></jsp:include>
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Đồng hồ</li>
            </ol>
        </div>
    </section>

    <!--Modal: Add-->
    <div class="modal fade" id="modal-add">
        <form class="modal-dialog" method="POST" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Thêm đồng hồ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên đồng hồ</label>
                        <input type="text" class="form-control" name="name">
                    </div>
                    <div class="form-group">
                        <label>Mô tả</label>
                        <input type="text" class="form-control" name="description">
                    </div>
                    <div class="form-group">
                        <label>Hình ảnh</label>
                        <input type="file" class="form-control" name="thumbnail">
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <input type="text" class="form-control" name="price">
                    </div>
                    <div class="form-group">
                        <label>Thương hiệu</label>
                        <input type="text" class="form-control" name="trademark">
                    </div>

                    <div class="form-group">
                        <label>Danh mục</label>
                        <select class="form-control select2" name="category">
                        <c:forEach var = "row" items = "${cateList.rows}">
                            <option value="${row.CategoryID}">${row.CategoryName}</option>
                        </c:forEach>
                    </select>
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
    <form class="modal-dialog" method="POST" enctype="multipart/form-data">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title">Cập nhật đồng hồ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Mã slider</label>
                    <input type="text" class="form-control" name="id" value="${editData.getRows()[0].WatchID}" readonly>
                </div>
                <div class="form-group">
                    <label>Tên slider</label>
                    <input type="text" class="form-control" name="name" value="${editData.getRows()[0].WatchName}">
                </div>
                <div class="form-group">
                    <label>Mô tả</label>
                    <input type="text" class="form-control" name="description" value="${editData.getRows()[0].Description}">
                </div>
                <div class="form-group">
                    <label>Hình ảnh</label>
                    <input type="file" class="form-control" name="thumbnail">
                </div>
                <div class="form-group">
                    <label>Giá</label>
                    <input type="text" class="form-control" name="price" value="${editData.getRows()[0].Price}">
                </div>
                <div class="form-group">
                    <label>Thương hiệu</label>
                    <input type="text" class="form-control" name="trademark" value="${editData.getRows()[0].Trademark}">
                </div>
                <div class="form-group">
                    <label>Danh mục</label>
                    <select class="form-control select2" name="category">
                        <c:forEach var = "row" items = "${cateList.rows}">
                            <option value="${row.CategoryID}" ${row.CategoryID == editData.getRows()[0].CategoryID ? "selected" : ""}>${row.CategoryName}</option>
                        </c:forEach>
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
        <div class="card">
            <div class="card-body">
                <div class="btn btn-primary" data-toggle="modal" data-target="#modal-add"><i class="fas fa-plus"></i> Thêm</div>
                <div class="btn btn-warning" hidden data-toggle="modal" data-target="#modal-edit"><i class="fas fa-marker"></i> Cập nhật</div>
            </div>
        </div>

        <sql:query dataSource = "${db}" var = "list">select * from watches, categories where watches.CategoryID = categories.CategoryID order by WatchID desc</sql:query>

            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-success">
                                <th>Mã đồng hồ</th>
                                <th>Tên đồng hồ</th>
                                <th>Hình ảnh</th>
                                <th>Giá</th>
                                <th>Thương hiệu</th>
                                <th>Danh mục</th>
                                <th width="112">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "row" items = "${list.rows}">
                            <tr>
                                <td>${row.WatchID}</td>
                                <td>${row.WatchName}</td>
                                <td><a href="${row.Thumbnail}" target="_blank"><img height="50" src='${row.Thumbnail}' alt="" /></a></td>
                                <td>${Helper.Currency(row.Price)}</td>
                                <td>${row.Trademark}</td>
                                <td>${row.CategoryName}</td>
                                <td>
                                    <a href="?edit-id=${row.WatchID}" class="btn btn-warning"><i class="fas fa-marker"></i></a>
                                    <a onclick="removeRow(${row.WatchID})" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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