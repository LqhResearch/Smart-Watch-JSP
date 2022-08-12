<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

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
                    <a href="/admin/category/list.jsp" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
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
                    <a href="/admin/watch/list.jsp" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
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
                    <a href="/admin/order/list.jsp" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
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
                    <a href="/admin/slider/list.jsp" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
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

<sql:query dataSource = "${db}" var = "canvas1">select CategoryName, COUNT(WatchID) as count from categories left join watches on categories.CategoryID = watches.CategoryID GROUP BY CategoryName;</sql:query>
<sql:query dataSource = "${db}" var = "canvas2">select months.MonthName, COUNT(OrderID) as count from months left join orders on months.MonthName = MONTH(orders.CreatedAt) WHERE YEAR(NOW()) group by months.MonthName</sql:query>
<sql:query dataSource = "${db}" var = "canvas3">select months.MonthName, IFNULL(SUM(TotalMoney), 0) as money from months left join orders on months.MonthName = MONTH(orders.CreatedAt) WHERE YEAR(NOW()) group by months.MonthName</sql:query>

    <script>
        var labels = [], datas = [];
    <c:forEach var = "row" items = "${canvas1.rows}">
        labels.push(`${row.CategoryName}`);
        datas.push(`${row.count}`);
    </c:forEach>

        stat($("#canvas1"), labels, datas);

        labels = [], datas = [];
    <c:forEach var = "row" items = "${canvas2.rows}">
        labels.push(`Tháng ${row.MonthName}`);
        datas.push(`${row.count}`);
    </c:forEach>

        stat($("#canvas2"), labels, datas);

        labels = [], datas = [];
    <c:forEach var = "row" items = "${canvas3.rows}">
        labels.push(`Tháng ${row.MonthName}`);
        datas.push(`${row.money}`);
    </c:forEach>

        stat($("#canvas3"), labels, datas);
</script>