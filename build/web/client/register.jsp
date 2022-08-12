<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/config.jsp"></jsp:directive.include>

<%
    String sql = "";
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        if (password1.equals(password2)) {
            sql = "insert into users values ('" + username + "', md5('" + password1 + "'), '" + fullname + "', '" + phone + "', '" + email + "', 1, 2)";
        }
    }
%>
<%=sql%>
<%    if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "nonQuery"><%=sql%></sql:update>
<%
        response.sendRedirect("/client/index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng ký</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" href="/assets/img/favicon.png">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="/template/login/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="/template/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="/template/login/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="/template/login/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="/template/login/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="/template/login/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="/template/login/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" href="/template/login/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="/template/login/css/util.css">
        <link rel="stylesheet" href="/template/login/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100" style="background-image: url('/template/login/images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <form class="login100-form validate-form" method="POST">
                        <span class="login100-form-title p-b-49">Đăng ký</span>

                        <div class="wrap-input100 validate-input m-b-23" data-validate = "Tên đăng nhập không được trống">
                            <span class="label-input100">Tên đăng nhập</span>
                            <input class="input100" type="text" name="username">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23" data-validate="Mật khẩu không được trống">
                            <span class="label-input100">Mật khẩu</span>
                            <input class="input100" type="password" name="password1">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23" data-validate="Mật khẩu không được trống">
                            <span class="label-input100">Nhập lại mật khẩu</span>
                            <input class="input100" type="password" name="password2">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23">
                            <span class="label-input100">Họ tên</span>
                            <input class="input100" type="text" name="fullname">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23">
                            <span class="label-input100">Số điện thoại</span>
                            <input class="input100" type="text" name="phone">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23">
                            <span class="label-input100">Email</span>
                            <input class="input100" type="text" name="email">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>

                        <div class="container-login100-form-btn p-t-17">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" name="submit">
                                    Đăng ký
                                </button>
                            </div>
                        </div>

                        <div class="flex-col-c p-t-17">
                            <span class="txt1 p-b-17">Hoặc đăng nhập để sử dụng</span>
                            <a href="login.jsp" class="txt2">Đăng nhập ngay</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--===============================================================================================-->
        <script src="/template/login/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="/template/login/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="/template/login/vendor/bootstrap/js/popper.js"></script>
        <script src="/template/login/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="/template/login/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="/template/login/vendor/daterangepicker/moment.min.js"></script>
        <script src="/template/login/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="/template/login/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="/template/login/js/main.js"></script>
    </body>
</html>