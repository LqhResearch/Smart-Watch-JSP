<%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="config.DB" %>
<%@ page import="com.google.gson.Gson" %>

<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}"
                   user = "${DB.USERNAME}"  password = "${DB.PASSWORD}"/>

<jsp:include page="header.jsp"></jsp:include>
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Thống kê</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
            <sql:query dataSource = "${db}" var = "count">select count(*) as count from categories</sql:query>
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>${count.getRows()[0].count}</h3>
                        <p>Danh mục</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-th"></i>
                    </div>
                    <a href="#" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <sql:query dataSource = "${db}" var = "count">select count(*) as count from watches</sql:query>
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>${count.getRows()[0].count}</h3>
                        <p>Đồng hồ</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <a href="#" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <sql:query dataSource = "${db}" var = "count">select count(*) as count from orders</sql:query>
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>${count.getRows()[0].count}</h3>
                        <p>Đơn hàng</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-boxes"></i>
                    </div>
                    <a href="#" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <sql:query dataSource = "${db}" var = "count">select count(*) as count from sliders</sql:query>
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>${count.getRows()[0].count}</h3>
                        <p>Slider</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-images"></i>
                    </div>
                    <a href="#" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info">
                        <h5 class="mb-0">Số lượng đồng hồ theo từng danh mục</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas1"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info">
                        <h5 class="mb-0">Số lượng đơn hàng theo từng tháng</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas2"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info">
                        <h5 class="mb-0">Tổng doanh thu theo từng tháng</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas3"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>

<sql:query dataSource = "${db}" var = "canvas1">select CategoryName, COUNT(watches.WatchID) as count from categories left join watches on categories.CategoryID = watches.WatchID GROUP BY CategoryName;</sql:query>
<sql:query dataSource = "${db}" var = "canvas2">select month.Value, COUNT(OrderID) as count from month left join orders on month.Value = MONTH(orders.CreatedAt) WHERE YEAR(NOW()) group by month.Value</sql:query>
<sql:query dataSource = "${db}" var = "canvas3">select month.Value, IFNULL(SUM(TotalMoney), 0) as money from month left join orders on month.Value = MONTH(orders.CreatedAt) WHERE YEAR(NOW()) group by month.Value</sql:query>

    <script>
        var labels = [], datas = [];
    <c:forEach var = "row" items = "${canvas1.rows}">
        labels.push(`${row.CategoryName}`);
        datas.push(`${row.count}`);
    </c:forEach>

        const config = {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                        data: datas,
                        backgroundColor: [
                            'rgba(255, 99, 132)',
                            'rgba(255, 159, 64)',
                            'rgba(255, 205, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(54, 162, 235)',
                            'rgba(153, 102, 255)',
                            'rgba(201, 203, 207)'
                        ],
                        borderWidth: 1
                    }]
            }
        };

        new Chart($('#canvas1'), config);

        labels = [], datas = [];
    <c:forEach var = "row" items = "${canvas2.rows}">
        labels.push(`Tháng ${row.Value}`);
        datas.push(`${row.count}`);
    </c:forEach>

        const config1 = {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                        data: datas,
                        backgroundColor: [
                            'rgba(255, 99, 132)',
                            'rgba(255, 159, 64)',
                            'rgba(255, 205, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(54, 162, 235)',
                            'rgba(153, 102, 255)',
                            'rgba(201, 203, 207)',
                            'rgba(255, 99, 132, 0.6)',
                            'rgba(255, 159, 64, 0.6)',
                            'rgba(255, 205, 86, 0.6)',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(54, 162, 235, 0.6)',
                            'rgba(153, 102, 255, 0.6)',
                            'rgba(201, 203, 207, 0.6)'
                        ],
                        borderWidth: 1
                    }]
            }
        };

        new Chart($('#canvas2'), config1);
        
        labels = [], datas = [];
    <c:forEach var = "row" items = "${canvas3.rows}">
        labels.push(`Tháng ${row.Value}`);
        datas.push(`${row.money}`);
    </c:forEach>

        const config2 = {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                        data: datas,
                        backgroundColor: [
                            'rgba(255, 99, 132)',
                            'rgba(255, 159, 64)',
                            'rgba(255, 205, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(54, 162, 235)',
                            'rgba(153, 102, 255)',
                            'rgba(201, 203, 207)',
                            'rgba(255, 99, 132, 0.6)',
                            'rgba(255, 159, 64, 0.6)',
                            'rgba(255, 205, 86, 0.6)',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(54, 162, 235, 0.6)',
                            'rgba(153, 102, 255, 0.6)',
                            'rgba(201, 203, 207, 0.6)'
                        ],
                        borderWidth: 1
                    }]
            }
        };

        new Chart($('#canvas3'), config2);
</script>