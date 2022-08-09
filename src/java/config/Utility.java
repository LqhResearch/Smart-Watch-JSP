package config;

public class Utility {

    public static String Active(Object value) {
        return value.equals(1) ? "<span class='badge badge-success'>Kích hoạt</span>" : "<span class='badge badge-danger'>Ẩn</span>";
    }
}
