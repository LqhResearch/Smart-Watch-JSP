<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<% String categoryID = request.getParameter("id");%>

<sql:query dataSource = "${db}" var = "watchList">select * from watches where CategoryID = <%=categoryID%>;</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <section class="shop_section layout_padding">
        <div class="container">
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
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<jsp:include page="/client/footer.jsp"></jsp:include>
