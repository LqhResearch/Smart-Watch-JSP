package config;

import java.text.*;
import java.util.*;

public class Helper {

    // Database connection
    public static String HOST = "localhost";
    public static String USERNAME = "root";
    public static String PASSWORD = "";
    public static String DBNAME = "smart-watch";
    public static String PORT = "3306";

    // File upload
    public static String SLIDER_UPLOAD = "C:/QH/Smart-Watch/web/assets/slider/";
    public static String PRODUCT_UPLOAD = "C:/QH/Smart-Watch/web/assets/product/";

    // Extensions
    public static String Status(boolean isCheck, String vTrue, String vFalse) {
        return isCheck ? "<span class='badge badge-success'>" + vTrue + "</span>" : "<span class='badge badge-danger'>" + vFalse + "</span>";
    }

    public static String Span(boolean isCheck, String vTrue, String vFalse) {
        return isCheck ? "<span class='badge badge-primary'>" + vTrue + "</span>" : "<span class='badge badge-warning'>" + vFalse + "</span>";
    }

    public static String Currency(Object value) {
        return NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(value);
    }

    public static String Date(String value) throws Exception {
        Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(value);
        return new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(date);
    }

    public static String Phone(String value) {
        return String.valueOf(value).replaceFirst("(\\d{4})(\\d{3})(\\d+)", "$1 $2 $3");
    }
}
