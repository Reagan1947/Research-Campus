<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>流程表单管理</title>

    <style>
        #imgReader {
            display: none;
        }

        .previewBox, .previewBoxRound {
            box-shadow: 0 0 5px #adadad;
            width: 130px;
            height: 130px;
            margin: 0 auto 60px auto;
            /*margin-top: 30px;*/
            overflow: hidden; /*这个超出设置为隐藏很重要，否则就会整个显示出来了*/
        }

        .previewBoxRound {
            border-radius: 50%; /*设置为圆形*/
        }

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
                        <h1>流程表单管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">流程表单管理</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
<%--                        <div class="card card-primary card-outline">--%>
<%--                            <div class="card-header">--%>
<%--                                <h3 class="card-title">上传流程文件</h3>--%>
<%--                            </div>--%>
<%--                            <form>--%>
<%--                                <div class="card-body">--%>
<%--                                    <div class="form-group">--%>
<%--                                        &lt;%&ndash;                                        <label for="exampleInputFile">上传流程文件并部署</label>&ndash;%&gt;--%>
<%--                                        <div class="col-md-6" style="padding-left: 0">--%>

<%--                                            <div class="input-group">--%>
<%--                                                <div class="custom-file">--%>
<%--                                                    <input type="file" class="custom-file-input" id="exampleInputFile">--%>
<%--                                                    <label class="custom-file-label"--%>
<%--                                                           for="exampleInputFile">选择.BPMN流程文件</label>--%>
<%--                                                </div>--%>
<%--                                                <div class="input-group-append">--%>
<%--                                                    <span class="input-group-text">上传</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <!-- /.card-body -->--%>
<%--                            </form>--%>
<%--                        </div>--%>
                    </div>
                </div>

                <!-- 表格开始 -->
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title" style="margin-top: 5px;">流程表单列表</h3>
                        <!-- 右侧按钮 -->
                        <div style="float: right">
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" id="filterButton"><i class="fas fa-filter"></i></button>
                                    <button type="button" class="btn btn-default"><i class="fas fa-sync-alt"></i></button>
                                    <button type="button" class="btn btn-default"><i class="fas fa-plus"></i></button>
                                </div>
                            </td>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <!-- 查询按钮组 -->
                        <div style="margin-bottom: 15px; display: none;" id="filterBar">
                            <div class="row">
                                <div class="col-1">
                                    <lable class="col-form-label">表单名称</lable>
                                    <input type="text" class="form-control" placeholder="formName">
                                </div>
                                <div class="col-1">
                                    <lable class="col-form-label">创建时间</lable>
                                    <input type="text" class="form-control" data-inputmask-alias="datetime" data-inputmask-inputformat="dd/mm/yyyy" data-mask>
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">表单描述</lable>
                                    <input type="text" class="form-control" placeholder="formDesc">
                                </div>

                                <div class="col-6" style="margin-top: 24px;">
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default">查询</button>
                                        <button type="button" class="btn btn-default">重置</button>
                                        <button type="button" class="btn btn-default">更多  <i class="fas fa-angle-down"></i></button>

<%--                                        <div class="btn-group">--%>
<%--                                            <button type="button" class="btn btn-default dropdown-toggle dropdown-icon" data-toggle="dropdown">--%>
<%--                                                更多--%>
<%--                                            </button>--%>
<%--                                            <div class="dropdown-menu">--%>
<%--                                                <a class="dropdown-item" href="#">下拉链接</a>--%>
<%--                                                <a class="dropdown-item" href="#">下拉链接</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                    </div>
                                </td>
                                </div>

                            </div>
                        </div>

                        <div id="jsGrid1"></div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
                <!-- 表格结束 -->

            </div>
        </section>
        <%--        <!-- Main content -->--%>
        <%--            <div class="card card-primary card-outline">--%>
        <%--                <div class="card-header">--%>
        <%--                    <h3 class="card-title">现有流程及其操作</h3>--%>
        <%--                </div>--%>
        <%--                <!-- /.card-header -->--%>
        <%--                <div class="card-body">--%>
        <%--                    <div id="jsGrid1"></div>--%>
        <%--                </div>--%>
        <%--                <!-- /.card-body -->--%>
        <%--            </div>--%>
        <%--            <!-- /.card -->--%>


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
    $(function () {
        $("#jsGrid1").jsGrid({
            width: "100%",
            height: "auto",
            sorting: true,
            paging: true,
            autoload: true,
            // filtering: true,

            controller: {
                loadData: function (filter) {

                    return $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/getImplementBPMN",
                        data: filter,
                        dataType: "JSON"
                    })

                }
            },

            fields: [
                {name: "id", type: "text", width: 150, title: "表单名称"},
                {name: "deploymentId", type: "text", width: 50, title: "表单描述"},
                {name: "name", type: "text", width: 200, title: "创建时间"},
                {name: "name", type: "text", width: 200, title: "创建人"},

                // {name: "key", type: "text", title: "流程定义KEY"},
                // {name: "version", type: "text", title: "版本号"},
                // {name: "resourceName", type: "text", title: "XML资源名称"},
                // {name: "diagramResourceName", type: "text", title: "图片资源名称"},
                // {name: "suspensionState", type: "text", title: "状态(1-部署 2-挂起)"},
                // 状态1表示激活 2表示挂起
                {
                    type: "control", width: 100, editButton: false, deleteButton: false,
                    itemTemplate: function (value, item) {
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                        // <i class="far fa-play-circle"></i>
                        // 添加流程部署方法
                        var $BPMNDeployment = $("<button>").attr({class: "btn btn-default btn-flat suspensionState_" + item.suspensionState + ""}).append($("<i></i>").attr({class: "fas fa-play"}))
                            .click(function (e) {
                                alert("Title: " + item.id);
                                e.stopPropagation();
                            });

                        // 添加流程删除方法
                        var $BPMNDelete = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-trash-alt"}))
                            .click(function (e) {
                                alert("Title: " + item.id);
                                e.stopPropagation();
                            });

                        // 添加流程挂起方法
                        var $BPMNHangUp = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "fas fa-pause"}))
                            .click(function (e) {
                                alert("Title: " + item.id);
                                e.stopPropagation();
                            });

                        // 添加详细信息方法
                        var $BPMNDetail = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "fas fa-info"}))
                            .click(function (e) {
                                alert("Title: " + item.title);
                                e.stopPropagation();
                            });

                        return $("<div>").append($BPMNDeployment).append($BPMNHangUp).append($BPMNDetail).append($BPMNDelete);
                        //return $result.add($customButton);
                    },
                }

            ]
        });
    });

    window.onload = function () {
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' });
        $('[data-mask]').inputmask();

        // 当状态表示1时候 表示已部署 此时部署按钮不可用
        $('.suspensionState_1').addClass("disabled").attr('disabled',"true");
        $('filter-row>.jsgrid-cell:last-child, .jsgrid-header-row>.jsgrid-header-cell:last-child, .jsgrid-insert-row>.jsgrid-cell:last-child').text("操作");
    }

    $(document).ready(function(){
        $("#filterButton").click(function(){
            $("#filterBar").toggle();
        });
    });
</script>
</body>
</html>
