<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>个人科研项目管理</title>

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
                        <h1>个人科研项目管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">个人科研项目管理</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <c:forEach items="${taskList}" var="task">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title" style="font-weight: 550; display: contents;">${task.name}</p>
                                    <hr>
                                    <p class="card-text">
                                    <p>
                                        <span><i class="fas fa-clock fa-fw"></i> ${task.createTime} </span>
                                    <br>
                                        <span><i class="fas fa-pen-square fa-fw"></i> Task-ID-${task.id} </span>
                                    </p>
                                    </p>
                                    <button type="button" class="btn btn-primary">立即处理</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

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

</script>
</body>
</html>
