<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<%
    HashMap<String, String> formData = new HashMap<String, String>();
    String localPath = Helper.SLIDER_UPLOAD;

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
                    formData.put("fileName", "/assets/slider/" + fileName);
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
            sql = "insert into sliders values (null, '" + formData.get("name") + "', '" + formData.get("description") + "', '" + formData.get("fileName") + "', " + formData.get("active") + ")";
        }

        if (formData.get("action").equals("edit")) {
            sql = "update sliders set SliderName = '" + formData.get("name") + "', Description = '" + formData.get("description") + "', Thumbnail = '" + formData.get("fileName") + "', Status = '" + formData.get("active") + "' where SliderID = " + formData.get("id");
        }
        response.sendRedirect("/admin/slider/list.jsp");
    }

    if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
        String id = request.getParameter("id");
        sql = "delete from sliders where SliderID = " + id;
        response.sendRedirect("/admin/slider/list.jsp");
    }
%>

<%    if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql%></sql:update>
<% }%>

<% if (request.getParameter("edit-id") != null) {%>
<sql:query dataSource = "${db}" var = "editData">select * from sliders where SliderID = <%=request.getParameter("edit-id")%></sql:query>
<% }%>

<jsp:include page="/admin/header.jsp"></jsp:include>
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Slider</li>
            </ol>
        </div>
    </section>

    <!--Modal: Add-->
    <div class="modal fade" id="modal-add">
        <form class="modal-dialog" method="POST" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Thêm slider</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên slider</label>
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
                        <label>Trạng thái</label>
                        <select class="form-control select2" name="active">
                            <option value="1">Kích hoạt</option>
                            <option value="0">Ẩn</option>
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
                    <h5 class="modal-title">Cập nhật slider</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã slider</label>
                        <input type="text" class="form-control" name="id" value="${editData.getRows()[0].SliderID}" readonly>
                </div>
                <div class="form-group">
                    <label>Tên slider</label>
                    <input type="text" class="form-control" name="name" value="${editData.getRows()[0].SliderName}">
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
                    <label>Trạng thái</label>
                    <select class="form-control select2" name="active">
                        <option value="1" ${editData.getRows()[0].Status == "1" ? "selected" : ""}>Kích hoạt</option>
                        <option value="0" ${editData.getRows()[0].Status == "0" ? "selected" : ""}>Ẩn</option>
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

        <sql:query dataSource = "${db}" var = "list">select * from sliders;</sql:query>

            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-success">
                                <th>Mã slider</th>
                                <th>Tên slider</th>
                                <th>Mô tả</th>
                                <th>Hình ảnh</th>
                                <th>Trạng thái</th>
                                <th width="112">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "row" items = "${list.rows}">
                            <tr>
                                <td>${row.SliderID}</td>                                
                                <td>${row.SliderName}</td>
                                <td>${row.Description}</td>
                                <td><a href="${row.Thumbnail}" target="_blank"><img height="50" src="${row.Thumbnail}" alt="" /></a></td>
                                <td>${Helper.Status(row.Status == "1", "Hoạt động", "Ẩn")}</td>
                                <td>
                                    <a href="?edit-id=${row.SliderID}" class="btn btn-warning"><i class="fas fa-marker"></i></a>
                                    <a onclick="removeRow(${row.SliderID})" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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