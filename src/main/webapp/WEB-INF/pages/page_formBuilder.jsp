<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>创建流程表单</title>

    <style>
        .card-body {
            padding: 0;
        }

        .main-left {
            background-color: #f8f8f8;
            border-left: 1px solid #cccccc !important;
        }

        .main-right {
            background-color: #f8f8f8;
            border-right: 1px solid #cccccc !important;
        }

        .header-title {
            border-bottom: 2px solid #e4e7ed !important;
        }

        .main-bottom {
            border-bottom: 2px solid #e4e7ed !important;
            margin: 0 10px;
        }

        .container-form {
            border: none !important;
        }

        .active .view-operations {
            bottom: -13px !important;
            right: -13px !important;
        }

        .el-tag--dark, .el-tag--dark.is-hit {
            border-radius: inherit !important;
        }

        .widget-view {
            padding: 13px;
        }

        .active .view-operations div .el-tag--dark i {
            line-height: 22px !important;
        }

        #app > div > section > section > header > span:nth-child(5) {
            display: none;
        }

        #app > div > section > section > header > span:nth-child(2) {
            top: 12px;
            position: inherit;
        }

        #app > div > section > section > header > span:nth-child(3) {
            top: 12px;
            position: inherit;
        }

        #app > div > section > section > header > span:nth-child(4) {
            top: 12px;
            position: inherit;
        }
        #app > div > section > aside.el-aside.main-right > header {
            font-size: 15px;
            line-height: 2.3rem!important;
        }
        .el-input-number__decrease, .el-input-number__increase {
            height: 95%!important;
        }
        .el-icon-minus, .el-icon-plus {
            line-height: 30px!important;
        }
    </style>

    <link href="${pageContext.request.contextPath}/formBuilder/css/app.967b7da3.css" rel="preload" as="style">
    <link href="${pageContext.request.contextPath}/formBuilder/css/chunk-vendors.84bb20f7.css" rel="preload" as="style">
    <link href="${pageContext.request.contextPath}/formBuilder/js/app.25096156.js" rel="preload" as="script">
    <link href="${pageContext.request.contextPath}/formBuilder/js/chunk-vendors.eb1319ad.js" rel="preload" as="script">
    <link href="${pageContext.request.contextPath}/formBuilder/css/chunk-vendors.84bb20f7.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/formBuilder/css/app.967b7da3.css" rel="stylesheet">

</head>

<!-- 公共body配置 -->
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- 页面导航栏 -->
    <jsp:include page="admin_navbar.jsp"/>

    <!-- 页面侧边栏 -->
    <jsp:include page="admin_sidebar.jsp"/>

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>创建流程表单</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">创建流程表单</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-primary card-outline">
                            <!-- /.card-header -->
                            <div class="card-body">
                                <noscript><strong>We're sorry but c-form doesn't work properly without JavaScript
                                    enabled. Please enable it to
                                    continue.</strong></noscript>
                                <div id="app"></div>
                                <script src="${pageContext.request.contextPath}/formBuilder/js/chunk-vendors.eb1319ad.js"></script>
                                <script src="${pageContext.request.contextPath}/formBuilder/js/app.25096156.js"></script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </div>
    <!-- 页面footer -->
    <jsp:include page="admin_footer.jsp"/>
    <!-- 页面footer / -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
    </aside>
    <!-- /.control-sidebar -->
</div>

<!-- 页面js -->
<jsp:include page="admin_foot.jsp"/>
<!-- 页面jsr / -->

<script>
$(function () {
    var fatherElement = $("#app > div > section > aside.el-aside.main-right > div").find("i");
    fatherElement.each(function () {
        $(this).removeClass("el-icon-share").addClass("fas fa-genderless fa-fw");
    });

    setTimeout(function(){
        document.querySelector("body > div > aside.main-sidebar.elevation-4.sidebar-light-primary.menu-open > div > div.os-padding > div > div > div > div.info > a").innerHTML="<%=session.getAttribute("username")%>";
    },200);
})
</script>
</body>
</html>
