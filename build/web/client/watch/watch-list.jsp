<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<% String search = request.getParameter("search");%>

<sql:query dataSource = "${db}" var = "watchList">select * from watches <%=search == null ? "" : "where WatchName like '%" + search + "%'"%>;</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <section class="shop_section layout_padding">
        <div class="container">
            <form class="input-group mb-5">
                <div class="input-group-prepend">
                    <lable class="input-group-text bg-primary text-white">Tìm kiếm</lable>
                </div>
                <input class="form-control" type="text" name="search" value="<%=search == null ? "" : search%>">
            <div class="input-group-append">
                <button class="btn btn-primary">
                    <i class="fa fa-search fa-fw"></i>
                </button>
            </div>
        </form>

        <div class="row">
            <c:forEach var = "row" items = "${watchList.rows}">
                <div class="col-md-3">
                    <div class="box">
                        <a href="#">
                            <div class="img-box">
                                <img src="${row.Thumbnail}" alt="${row.WatchName}">
                            </div>
                            <h6>${row.WatchName}</h6>
                            <h6>Giá: <span>${Helper.Currency(row.Price)}</span></h6>
                        </a>
                        <div class="btn-box">
                            <a href="/client/cart.jsp?action=add&id=${row.WatchID}" class="btn1">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<jsp:include page="/client/footer.jsp"></jsp:include>
