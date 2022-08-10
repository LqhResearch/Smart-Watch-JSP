<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="config.DB" %>

<style>
    .bg-yellow {
        background-color: #f0d43a !important;
        color: #fff;
    }
</style>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<sql:query dataSource = "${db}" var = "watchList">select * from categories;</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <section class="shop_section layout_padding">
        <div class="container">
            <div class="row">
            <c:forEach var = "row" items = "${watchList.rows}">
                <div class="col-md-3">
                    <div class="box bg-yellow">
                        <a href="/client/category/watch-list.jsp?id=${row.CategoryID}">
                            <img class="img-thumbnail" src="/assets/img/category-watch.jpg" />
                            <div class="text-center py-2"><b>${row.CategoryName}</b></div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<jsp:include page="/client/footer.jsp"></jsp:include>
