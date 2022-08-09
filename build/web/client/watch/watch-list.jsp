<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="config.DB" %>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<sql:query dataSource = "${db}" var = "watchList">select * from watches;</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <section class="shop_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Đồng hồ mới nhất</h2>
            </div>
            <div class="row">
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
    </div>
</section>
<jsp:include page="/client/footer.jsp"></jsp:include>
