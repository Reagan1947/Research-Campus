<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- jQuery JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/custom/js/jquery-3.6.0.min.js"></script>

<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>

<!-- overScrollbars -->
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>

<!-- toastr -->
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/toastr/toastr.min.js"></script>

<!-- jsGrid -->
<script src="${pageContext.request.contextPath}/plugins/jsgrid/demos/db.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jsgrid/jsgrid.min.js"></script>

<!-- 用于演示 AdminLTE -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>

<!-- 用于 边栏的激活 -->
<script>
    $(document).ready(function() {
        var host_link = window.location.pathname;
        var activate_a = $("a[href='" + host_link + "']");
        console.log(host_link);
        activate_a.addClass("active");
    });
</script>
