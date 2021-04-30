<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- jQuery JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/custom/js/jquery-3.6.0.min.js"></script>

<!-- propper -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

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

<!-- date range picker -->
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>

<!-- datatables -->
<script src="https://cdn.datatables.net/v/bs4/dt-1.10.18/b-1.5.6/sc-2.0.0/sl-1.3.0/datatables.min.js"></script>

<!-- Select2 -->
<script src="${pageContext.request.contextPath}/plugins/select2/js/select2.full.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js" integrity="sha512-k6/Bkb8Fxf/c1Tkyl39yJwcOZ1P4cRrJu77p83zJjN2Z55prbFHxPs9vN7q3l3+tSMGPDdoH51AEU8Vgo1cgAA==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" integrity="sha512-3JRrEUwaCkFUBLK1N8HehwQgu8e23jTH4np5NHOmQOobuC4ROQxFwFgBLTnhcnQRMs84muMh0PnnwXlPq5MGjg==" crossorigin="anonymous" />

<!-- moment.js -->
<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>

<!-- 用于 边栏的激活 -->
<script>
    function getQueryVariable(variable)
    {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }

    function getUrlname(url){ //假如传进来的url是 http://www.qq.com/index.html?name=joey 这里一共是有3个斜杠,如果我们想获取index.html
        url=url.split('?')[0] ;// 我们只要?号前的
        var urlSlashCount=url.split('/').length; // 统计有3斜杠
        return url.split('/')[urlSlashCount-1]; //获取数组最后一个
    }

    function deleteParagram(){
        var url = window.location.href;                    //获取当前页面的url
        if(url.indexOf("?")!==-1){                        //判断是否存在参数
           url =  url.replace(/(\?|#)[^'"]*/, '');           //去除参数
        }

        return url;
    }

    $(function () {
        var url = "";
        // 如果地址是businessEntityDetail 并且有businessEntityUuid参数
        console.log("url Name 是：" + getUrlname(window.location.href))
        console.log("参数为：" + getUrlname(window.location.href))

        if((getUrlname(window.location.href) === "businessEntity" || getUrlname(window.location.href) === "toDeclarationPage") && getQueryVariable("businessEntityUuid") !== false){
            url = window.location.href;
        } else {
            url = deleteParagram();
        }
        console.log("当前URL：" + url)
        // for single sidebar menu
        $('ul.nav-sidebar a').filter(function () {
                if(this.href == url){
                    return this.href == url;
                } else if(this.href + "#/" == url){
                    return this.href + "#/" == url
                }
        }).addClass('active');

        // for sidebar menu and treeview
        $('ul.nav-treeview a').filter(function () {
            if(this.href == url){
                return this.href == url;
            } else if(this.href + "#/" == url){
                return this.href + "#/" == url
            }
        }).parentsUntil(".nav-sidebar > .nav-treeview")
            .css({'display': 'block'})
            .addClass('menu-open').prev('a')
            .addClass('active');
    });

</script>

<script>
    // $(function () {
    //     //The passed argument has to be at least a empty object or a object with your desired options
    //     $("body").overlayScrollbars({});
    // });
</script>

<link rel="stylesheet" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/b-1.5.6/sc-2.0.0/sl-1.3.0/datatables.min.css"></link>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
