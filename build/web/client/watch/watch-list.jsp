<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="config.DB" %>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<% String search = request.getParameter("search");%>

<sql:query dataSource = "${db}" var = "watchList">select * from watches <%=search == null ? "" : "where WatchName like '%" + search + "%'"%>;</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <section class="shop_section layout_padding">
        <div class="container">
            <form class="input-group">
                <div class="input-group-prepend">
                    <lable class="input-group-text">Tìm kiếm</lable>
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
                                <img src="${row.Thumbnail}" alt="">
                            </div>
                            <h6>${row.WatchName}</h6>
                            <h6>Giá: <span>${row.Price}</span></h6>
                            <div class="new"><span>Mới</span></div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<jsp:include page="/client/footer.jsp"></jsp:include>
