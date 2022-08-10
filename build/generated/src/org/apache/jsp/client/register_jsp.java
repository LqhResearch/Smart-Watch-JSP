package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import config.DB;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_update_var_dataSource;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_sql_update_var_dataSource = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_sql_update_var_dataSource.release();
    _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      if (_jspx_meth_sql_setDataSource_0(_jspx_page_context))
        return;
      out.write('\n');
      out.write('\n');

    String sql = "";
    request.setCharacterEncoding("UTF-8");
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        if (password1 == password2) {
            sql = "insert into users values ('" + username + "', md5('" + password1 + "'), '" + fullname + "', '" + phone + "', '" + email + "', 1, 2)";
        }
    }

      out.write('\n');
      out.print(sql);
      out.write('\n');
    if (!sql.isEmpty()) {
      out.write('\n');
      //  sql:update
      org.apache.taglibs.standard.tag.rt.sql.UpdateTag _jspx_th_sql_update_0 = (org.apache.taglibs.standard.tag.rt.sql.UpdateTag) _jspx_tagPool_sql_update_var_dataSource.get(org.apache.taglibs.standard.tag.rt.sql.UpdateTag.class);
      _jspx_th_sql_update_0.setPageContext(_jspx_page_context);
      _jspx_th_sql_update_0.setParent(null);
      _jspx_th_sql_update_0.setDataSource((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${db}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
      _jspx_th_sql_update_0.setVar("nonQuery");
      int[] _jspx_push_body_count_sql_update_0 = new int[] { 0 };
      try {
        int _jspx_eval_sql_update_0 = _jspx_th_sql_update_0.doStartTag();
        if (_jspx_eval_sql_update_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          if (_jspx_eval_sql_update_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
            out = _jspx_page_context.pushBody();
            _jspx_push_body_count_sql_update_0[0]++;
            _jspx_th_sql_update_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
            _jspx_th_sql_update_0.doInitBody();
          }
          do {
            out.print(sql);
            int evalDoAfterBody = _jspx_th_sql_update_0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
          if (_jspx_eval_sql_update_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
            out = _jspx_page_context.popBody();
            _jspx_push_body_count_sql_update_0[0]--;
        }
        if (_jspx_th_sql_update_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
      } catch (Throwable _jspx_exception) {
        while (_jspx_push_body_count_sql_update_0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_sql_update_0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_sql_update_0.doFinally();
        _jspx_tagPool_sql_update_var_dataSource.reuse(_jspx_th_sql_update_0);
      }
      out.write('\n');

        response.sendRedirect("/client/index.jsp");
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>Đăng ký</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <!--===============================================================================================-->\t\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"/template/login/images/icons/favicon.ico\"/>\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/fonts/iconic/css/material-design-iconic-font.min.css\">\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/vendor/animate/animate.css\">\n");
      out.write("        <!--===============================================================================================-->\t\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/vendor/css-hamburgers/hamburgers.min.css\">\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/vendor/animsition/css/animsition.min.css\">\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/vendor/select2/select2.min.css\">\n");
      out.write("        <!--===============================================================================================-->\t\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/vendor/daterangepicker/daterangepicker.css\">\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/css/util.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"/template/login/css/main.css\">\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"limiter\">\n");
      out.write("            <div class=\"container-login100\" style=\"background-image: url('/template/login/images/bg-01.jpg');\">\n");
      out.write("                <div class=\"wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54\">\n");
      out.write("                    <form class=\"login100-form validate-form\" method=\"POST\">\n");
      out.write("                        <span class=\"login100-form-title p-b-49\">Đăng ký</span>\n");
      out.write("\n");
      out.write("                        <div class=\"wrap-input100 validate-input m-b-23\" data-validate = \"Tên đăng nhập không được trống\">\n");
      out.write("                            <span class=\"label-input100\">Tên đăng nhập</span>\n");
      out.write("                            <input class=\"input100\" type=\"text\" name=\"username\">\n");
      out.write("                            <span class=\"focus-input100\" data-symbol=\"&#xf206;\"></span>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"wrap-input100 validate-input m-b-23\" data-validate=\"Mật khẩu không được trống\">\n");
      out.write("                            <span class=\"label-input100\">Mật khẩu</span>\n");
      out.write("                            <input class=\"input100\" type=\"password\" name=\"password1\">\n");
      out.write("                            <span class=\"focus-input100\" data-symbol=\"&#xf190;\"></span>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"wrap-input100 validate-input m-b-23\" data-validate=\"Mật khẩu không được trống\">\n");
      out.write("                            <span class=\"label-input100\">Nhập lại mật khẩu</span>\n");
      out.write("                            <input class=\"input100\" type=\"password\" name=\"password2\">\n");
      out.write("                            <span class=\"focus-input100\" data-symbol=\"&#xf190;\"></span>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"wrap-input100 validate-input m-b-23\" data-validate = \"Tên đăng nhập không được trống\">\n");
      out.write("                            <span class=\"label-input100\">Họ tên</span>\n");
      out.write("                            <input class=\"input100\" type=\"text\" name=\"fullname\">\n");
      out.write("                            <span class=\"focus-input100\" data-symbol=\"&#xf206;\"></span>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"wrap-input100 validate-input m-b-23\" data-validate = \"Tên đăng nhập không được trống\">\n");
      out.write("                            <span class=\"label-input100\">Số điện thoại</span>\n");
      out.write("                            <input class=\"input100\" type=\"text\" name=\"phone\">\n");
      out.write("                            <span class=\"focus-input100\" data-symbol=\"&#xf206;\"></span>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"wrap-input100 validate-input m-b-23\" data-validate = \"Tên đăng nhập không được trống\">\n");
      out.write("                            <span class=\"label-input100\">Email</span>\n");
      out.write("                            <input class=\"input100\" type=\"text\" name=\"email\">\n");
      out.write("                            <span class=\"focus-input100\" data-symbol=\"&#xf206;\"></span>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"container-login100-form-btn p-t-17\">\n");
      out.write("                            <div class=\"wrap-login100-form-btn\">\n");
      out.write("                                <div class=\"login100-form-bgbtn\"></div>\n");
      out.write("                                <button class=\"login100-form-btn\" name=\"submit\">\n");
      out.write("                                    Đăng ký\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"flex-col-c p-t-17\">\n");
      out.write("                            <span class=\"txt1 p-b-17\">Hoặc đăng nhập để sử dụng</span>\n");
      out.write("                            <a href=\"login.jsp\" class=\"txt2\">Đăng nhập ngay</a>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <script src=\"/template/login/vendor/jquery/jquery-3.2.1.min.js\"></script>\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <script src=\"/template/login/vendor/animsition/js/animsition.min.js\"></script>\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <script src=\"/template/login/vendor/bootstrap/js/popper.js\"></script>\n");
      out.write("        <script src=\"/template/login/vendor/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <script src=\"/template/login/vendor/select2/select2.min.js\"></script>\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <script src=\"/template/login/vendor/daterangepicker/moment.min.js\"></script>\n");
      out.write("        <script src=\"/template/login/vendor/daterangepicker/daterangepicker.js\"></script>\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <script src=\"/template/login/vendor/countdowntime/countdowntime.js\"></script>\n");
      out.write("        <!--===============================================================================================-->\n");
      out.write("        <script src=\"/template/login/js/main.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_sql_setDataSource_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  sql:setDataSource
    org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag _jspx_th_sql_setDataSource_0 = (org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag) _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.get(org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag.class);
    _jspx_th_sql_setDataSource_0.setPageContext(_jspx_page_context);
    _jspx_th_sql_setDataSource_0.setParent(null);
    _jspx_th_sql_setDataSource_0.setVar("db");
    _jspx_th_sql_setDataSource_0.setDriver("com.mysql.jdbc.Driver");
    _jspx_th_sql_setDataSource_0.setUrl((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("jdbc:mysql://${DB.HOST}:${DB.PORT}/${DB.DBNAME}", java.lang.String.class, (PageContext)_jspx_page_context, null));
    _jspx_th_sql_setDataSource_0.setUser((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${DB.USERNAME}", java.lang.String.class, (PageContext)_jspx_page_context, null));
    _jspx_th_sql_setDataSource_0.setPassword((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${DB.PASSWORD}", java.lang.String.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_sql_setDataSource_0 = _jspx_th_sql_setDataSource_0.doStartTag();
    if (_jspx_th_sql_setDataSource_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.reuse(_jspx_th_sql_setDataSource_0);
      return true;
    }
    _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.reuse(_jspx_th_sql_setDataSource_0);
    return false;
  }
}
