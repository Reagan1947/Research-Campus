<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>申报公告详细</title>

    <style>
    </style>

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
                        <h1>
                            申报公告详细
                            <span style="margin-left: 5px; display: inline-block; text-decoration:underline; font-size: 15px;">
                                    <a href="${pageContext.request.contextPath}/toDeclarationPage?businessEntityUuid=${businessEntity.businessEntityUuid}">← 返回${businessEntity.businessEntityName}申请</a></span>
                        </h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">申报公告详细</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">${declaration.declarationName}</h5>
                            </div>
                            <div class="card-body">
                                <div id="declarationPage"></div>
                            </div>
                            <div class="card-footer">
                                <a href="#" class="btn btn-primary">立即申报</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
        // 获取 declarationPage 内容
        $.ajax({
            type: 'get',
            url: "https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/declarationDetail/${declaration.projectBodyInformationUrl}.html",
            async: false, //同步传输，并添加返回值，返回值应为已定义的全局变量 如a
            success: function (data) {//返回json结果
                $('#declarationPage').html(data)
            }
        });
    });
</script>
</body>
</html>
