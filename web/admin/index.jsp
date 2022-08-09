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
                        <h5 class="mb-0">Số lượng viên chức của từng bộ môn</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas1"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info">
                        <h5 class="mb-0">Số lượng viên chức của từng chức vụ</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas2"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>

<sql:query dataSource = "${db}" var = "canvas1">select CategoryName, COUNT(watches.WatchID) as count from categories left join watches on categories.CategoryID = watches.WatchID GROUP BY CategoryName;</sql:query>

    <script>
        var a = JSON.parse(`${canvas1.getRows()}`)
        console.log(a);
//    var labels = [], datas = [];
//    res.chart.forEach(e => {
//        labels.push(e.department_name);
//        datas.push(e.count);
//    });
//
//    const config = {
//        type: 'pie',
//        data: {
//            labels: labels,
//            datasets: [{
//                    data: datas,
//                    backgroundColor: [
//                        'rgba(255, 99, 132)',
//                        'rgba(255, 159, 64)',
//                        'rgba(255, 205, 86)',
//                        'rgba(75, 192, 192)',
//                        'rgba(54, 162, 235)',
//                        'rgba(153, 102, 255)',
//                        'rgba(201, 203, 207)'
//                    ],
//                    borderWidth: 1
//                }]
//        }
//    };
//
//    new Chart($('#canvas1'), config);
</script>