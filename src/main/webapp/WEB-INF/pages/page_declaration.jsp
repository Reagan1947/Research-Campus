<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>科研项目申报</title>

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
                        <h1>科研项目申报</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">科研项目申报</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="modal fade" id="modal-default" style="display: none;" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">消息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <div style="text-align: left">

                            <i class="fas fa-exclamation-triangle"
                               style="position: absolute;font-size: 45px;top: 22%;left: 25px;color: #ffa200;"></i>
                            <dl style="margin-left: 80px;">
                                <dt id="declarationName">
                                </dt>
                                <dd>确认申请后，如需撤销请前往科研项目管理页面。</dd>
                            </dl>
                        </div>

                        <textarea id="deploymentId" style="display: none"></textarea>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-end">
                        <button type="button" class="btn btn-danger" onclick="declarationProject(this)" data-dismiss="modal" id="toDeclaration">
                            &nbsp;&nbsp;是&nbsp;&nbsp;
                        </button>
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal"> &nbsp;&nbsp;否&nbsp;&nbsp;
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <c:forEach items="${declarationList}" var="node">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <c:out value="${node.declarationName}"/>
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <c:out value="${node.declarationAnnouncement}" escapeXml="false"/>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <button class="btn btn-primary">详细信息</button>
                                    <button class="btn btn-default float-right"
                                            declarationName="<c:out value="${node.declarationName}"/>"
                                            processInstanceId="<c:out value="${node.processInstanceId}"/>"
                                            declarationUuid="<c:out value="${node.declarationUuid}"/>"
                                            onclick="toDeclaration(this)">
                                        立即申报
                                    </button>
                                </div>
                                <!-- /.card -->
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>
</div>
</div>
</div>
<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
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

    function toDeclaration(obj) {
        // 增加弹窗信息
        var declarationName = $(obj).attr("declarationName");
        var processInstanceId = $(obj).attr("processInstanceId");
        var declarationUuid = $(obj).attr("declarationUuid");
        $('#declarationName').html("是否申请" + declarationName + "?");
        // 弹出模态窗口
        $('#toDeclaration').attr({
            processInstanceId: processInstanceId,
            declarationUuid:declarationUuid
        })
        $('#modal-default').modal("show");
    }

    function declarationProject(obj){
        var processInstanceId = $(obj).attr("processInstanceId");
        var declarationUuid = $(obj).attr("declarationUuid");

        var json_data = {processInstanceId: processInstanceId, declarationUuid:declarationUuid}
        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url: "${pageContext.request.contextPath}/declarationProject",
            //发送方式为GET，也可为POST，需要与后台对应
            type: 'POST',
            data: JSON.stringify(json_data),
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("申报流程启动失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    $('#example').DataTable().ajax.reload();
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("申报流程启动成功！")
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

</script>
</body>
</html>
