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

<!-- input mask -->
<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/inputmask/jquery.inputmask.bundle.js"></script>

<!-- bs-custom-file-input -->
<script src="${pageContext.request.contextPath}/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<!-- datatables -->
<script src="https://cdn.datatables.net/v/bs4/dt-1.10.18/b-1.5.6/sc-2.0.0/sl-1.3.0/datatables.min.js"></script>

<!-- propper -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<!-- 用于 边栏的激活 -->
<script>

    function deleteParagram(){
        var url = window.location.href;                    //获取当前页面的url
        if(url.indexOf("?")!==-1){                        //判断是否存在参数
           url =  url.replace(/(\?|#)[^'"]*/, '');           //去除参数
        }

        return url;
    }

    $(function () {
        var url = deleteParagram();
        console.log("当前URL：" + url)
        // for single sidebar menu
        $('ul.nav-sidebar a').filter(function () {
            return this.href == url;
        }).addClass('active');

        // for sidebar menu and treeview
        $('ul.nav-treeview a').filter(function () {
            return this.href == url;
        }).parentsUntil(".nav-sidebar > .nav-treeview")
            .css({'display': 'block'})
            .addClass('menu-open').prev('a')
            .addClass('active');
    });
</script>

<link rel="stylesheet" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/b-1.5.6/sc-2.0.0/sl-1.3.0/datatables.min.css"></link>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
