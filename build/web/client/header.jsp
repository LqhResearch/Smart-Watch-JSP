<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Watch Store</title>
        <link rel="icon" href="/assets/img/favicon.png">

        <link rel="stylesheet" href="/template/home/css/bootstrap.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <link rel="stylesheet" href="/template/home/css/font-awesome.min.css" />
        <link rel="stylesheet" href="/template/home/css/style.css" />
        <link rel="stylesheet" href="/template/home/css/responsive.css" />
        <link rel="stylesheet" href="/assets/css/style.css" />
    </head>
    <body>
        <div class="hero_area">
            <div class="hero_social">
                <a href="">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
                <a href="">
                    <i class="fa fa-twitter" aria-hidden="true"></i>
                </a>
                <a href="">
                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                </a>
                <a href="">
                    <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
            </div>

            <!-- header section strats -->
            <header class="header_section border-bottom">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="/client/index.jsp">
                            <span>Smart Watch Store</span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="/client/index.jsp">Trang chủ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/client/watch/watch-list.jsp">Đồng hồ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/client/category/list.jsp">Danh mục</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/client/order/list.jsp">Đơn hàng</a>
                                </li>
                            </ul>
                            <div class="user_option-box">
                                <% if (request.getSession().getAttribute("role") != null && request.getSession().getAttribute("role").equals(1)) { %>
                                <a href="/admin/index.jsp">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span>Quản trị</span>
                                </a>
                                <% }%>
                                <a href="/client/login.jsp">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span><%=request.getSession().getAttribute("fullname") == null ? "Đăng nhập" : request.getSession().getAttribute("fullname")%></span>
                                </a>
                                <% if (request.getSession().getAttribute("username") != null) { %>
                                <a href="/client/cart.jsp">
                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                </a>
                                <% }%>
                                <a href="/client/watch/watch-list.jsp">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>