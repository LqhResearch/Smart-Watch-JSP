<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<sql:query dataSource = "${db}" var = "sliderList" >select * from sliders where Status = 1;</sql:query>

<jsp:include page="/client/header.jsp"></jsp:include>
    <!-- Slider section -->
    <section class="slider_section">
        <div id="sliderCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
            <c:forEach var = "row" items = "${sliderList.rows}">
                <div class="carousel-item">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="detail-box">
                                    <h1>${row.SliderName}</h1>
                                    <p>${row.Description}</p>
                                    <div class="btn-box">
                                        <a href="#" class="btn1">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="img-box">
                                    <img src="${row.Thumbnail}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <a class="carousel-control-prev" href="#sliderCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#sliderCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>
<!-- end slider section -->
</div>

<sql:query dataSource = "${db}" var = "watchList">select * from watches order by WatchID desc limit 8;</sql:query>

    <section class="shop_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Đồng hồ mới nhất</h2>
            </div>
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
                            <div class="new"><span>Mới</span></div>
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
<!-- end shop section -->

<!-- about section -->
<section class="about_section layout_padding">
    <div class="container  ">
        <div class="row">
            <div class="col-md-6 col-lg-5 ">
                <div class="img-box">
                    <img src="/template/home/images/about-img.png" alt="">
                </div>
            </div>
            <div class="col-md-6 col-lg-7">
                <div class="detail-box">
                    <div class="heading_container">
                        <h2>Đồng hồ thông minh OPPO</h2>
                    </div>
                    <p>Sở hữu diện mạo độc đáo với sự kết hợp của chiếc vòng tay thông minh và đồng hồ thông minh đã tạo nên vẻ hiện đại nhưng không kém phần năng động, trẻ trung cho chiếc đồng hồ thông minh Oppo.</p>
                    <a href="">Xem ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end about section -->

<!-- contact section -->
<section class="contact_section layout_padding">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="form_container">
                    <div class="heading_container">
                        <h2>Liên hệ</h2>
                    </div>
                    <form action="#">
                        <div>
                            <input type="text" placeholder="Họ tên" />
                        </div>
                        <div>
                            <input type="email" placeholder="Email" />
                        </div>
                        <div>
                            <input type="text" placeholder="Số điện thoại" />
                        </div>
                        <div>
                            <input type="text" class="message-box" placeholder="Góp ý" />
                        </div>
                        <div class="d-flex"><button>Gửi</button></div>
                    </form>
                </div>
            </div>
            <div class="col-md-6">
                <div class="img-box">
                    <img src="/template/home/images/contact-img.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/client/footer.jsp"></jsp:include>
<script>
    $(".carousel-item:first").addClass("active");
</script>