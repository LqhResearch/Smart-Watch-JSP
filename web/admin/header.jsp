<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Watch Store</title>
        <link rel="icon" href="/assets/img/favicon.png">

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="/template/adminlte/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="/template/adminlte/dist/css/adminlte.min.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="/template/adminlte/plugins/select2/css/select2.min.css">
        <link rel="stylesheet" href="/template/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item">
                        <a href="/client/index.jsp" class="nav-link">Trang chủ</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                            <i class="fas fa-expand-arrows-alt"></i>
                        </a>
                    </li>
                </ul>
            </nav>

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <a href="/admin/" class="brand-link">
                    <img width="100%" src="/assets/img/logo.png" alt="Logo">
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="/assets/img/user.png" class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="#" class="d-block"><%=request.getSession().getAttribute("fullname")%></a>
                        </div>
                    </div>

                    <!-- SidebarSearch Form -->
                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="text" placeholder="Tìm kiếm" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item">
                                <a href="/admin/" class="nav-link">
                                    <i class="nav-icon fas fa-chart-bar"></i>
                                    <p>Bảng điều khiển</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/category/list.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-th"></i>
                                    <p>Danh mục</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/watch/list.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-clock"></i>
                                    <p>Đồng hồ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/order/list.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-boxes"></i>
                                    <p>Đơn hàng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/slider/list.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-images"></i>
                                    <p>Slider</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/account/list.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-user-circle"></i>
                                    <p>Tài khoản</p>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </aside>

            <div class="content-wrapper">