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
                <h2>?????ng h??? m???i nh???t</h2>
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
                            <h6>Gi??: <span>${Helper.Currency(row.Price)}</span></h6>
                            <div class="new"><span>M???i</span></div>
                        </a>
                        <div class="btn-box">
                            <a href="/client/cart.jsp?action=add&id=${row.WatchID}" class="btn1">Th??m v??o gi???</a>
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
                        <h2>?????ng h??? th??ng minh OPPO</h2>
                    </div>
                    <p>S??? h???u di???n m???o ?????c ????o v???i s??? k???t h???p c???a chi???c v??ng tay th??ng minh v?? ?????ng h??? th??ng minh ???? t???o n??n v??? hi???n ?????i nh??ng kh??ng k??m ph???n n??ng ?????ng, tr??? trung cho chi???c ?????ng h??? th??ng minh Oppo.</p>
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
                        <h2>Li??n h???</h2>
                    </div>
                    <form action="#">
                        <div>
                            <input type="text" placeholder="H??? t??n" />
                        </div>
                        <div>
                            <input type="email" placeholder="Email" />
                        </div>
                        <div>
                            <input type="text" placeholder="S??? ??i???n tho???i" />
                        </div>
                        <div>
                            <input type="text" class="message-box" placeholder="G??p ??" />
                        </div>
                        <div class="d-flex"><button>G???i</button></div>
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