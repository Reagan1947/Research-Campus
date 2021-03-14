<%--
  Created by IntelliJ IDEA.
  User: buwan
  Date: 2021/3/12
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="P_common_head.jsp"/>
    <!-- 页面Head信息 / -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- 页面头部 -->
    <jsp:include page="P_header.jsp"/>
    <!-- 页面头部 / -->

    <!-- 页面侧边栏 -->
    <jsp:include page="P_aside.jsp"/>
    <!-- 页面侧边栏 / -->

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>发票</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">发票</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>


        <form action="${pageContext.request.contextPath }/fileUpload.do"
              method="post" enctype="multipart/form-data">
            选择文件:<input type="file" name="uploadFile" width="120px"> <input
                type="submit" value="上传">
        </form>
        <hr>
        <form action="${pageContext.request.contextPath }/file/down.chao"
              method="get">
            <input type="submit" value="下载">
        </form>

    </div>
    <!-- 页面footer -->
    <jsp:include page="P_footer.jsp"/>
    <!-- 页面footer / -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
    </aside>
    <!-- /.control-sidebar -->
</div>

<!-- 页面js -->
<jsp:include page="P_foot_js.jsp"/>
<!-- 页面jsr / -->

<script>
    $(function() {
        //The passed argument has to be at least a empty object or a object with your desired options
        $("body").overlayScrollbars({ });
    });
</script>


</body>
</html>
