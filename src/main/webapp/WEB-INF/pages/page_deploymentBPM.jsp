<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>创建流程</title>

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
        .card-tools {
            margin-top: 9px;
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
                        <h1>流程列表与操作</h1>
                        <button onclick="fun()">loadjsgrid;
                        </button>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">流程列表与操作</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-outline card-primary collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">流程数据总览</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body" style="display: none;">
                                正在建设中...
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!-- left column -->
                    <div class="col-md-6">
                        <!-- general form elements -->
                        <div class="card card-primary card-outline collapsed-card">
                            <div class="card-header">
                                <h3 class="card-title">上传流程文件</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                                <div class="card-body" >
                                    <form id="bpmnForm">
                                    <div class="form-group">
                                        <label>流程定义名称</label>
                                        <input type="text" class="form-control" id="processName" placeholder="Enter Process Name" name="processName">
                                    </div>
                                    <div class="form-group">
                                        <label>流程BPMN文件</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="uploadBpmn" name="uploadBpmn">
                                                <label class="custom-file-label">resourceBPMN</label>
                                            </div>
<%--                                            <div class="input-group-append">--%>
<%--                                                <span class="input-group-text">上传</span>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>流程PNG文件</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="uploadPng" name="uploadPng">
                                                <label class="custom-file-label" >resourcePNG</label>
                                            </div>
<%--                                            <div class="input-group-append">--%>
<%--                                                <span class="input-group-text">上传</span>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary" id="uploadBpmnFile">提交</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 表格开始 -->
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">流程列表与操作</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
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
                {name: "id", type: "text", width: 150, title: "流程定义ID"},
                {name: "deploymentId", type: "text", width: 50, title: "流程部署ID"},
                {name: "name", type: "text", width: 200, title: "流程定义名称"},
                {name: "key", type: "text", title: "流程定义KEY"},
                {name: "version", type: "text", width:50, title: "版本号"},
                {name: "resourceName", type: "text", title: "XML资源名称"},
                {name: "diagramResourceName", type: "text", title: "图片资源名称"},
                {name: "suspensionState", type: "text", width:50 ,title: "状态"},
                // 状态1表示激活 2表示挂起
                {
                    type: "control", width: 150, editButton: false, deleteButton: false,
                    itemTemplate: function (value, item) {
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                        // <i class="far fa-play-circle"></i>
                        // 添加流程部署方法
                        var $BPMNDeployment = $("<button>").attr("disabled", function(){
                            if(item.suspensionState === 1){
                                return 'true';
                            }
                            })
                            .attr("class","btn btn-default btn-flat")
                            .append($("<i></i>").attr({class: "fas fa-play"}))
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
                        var $BPMNHangUp = $("<button>")
                            .attr("disabled", function(){
                                if(item.suspensionState === 2){
                                    return 'true';
                                }
                            })
                            .attr("class", "btn btn-default btn-flat").append($("<i></i>").attr({class: "fas fa-pause"}))
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

                        // 添加关联业务方法
                        var $connectBusiness = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "fas fa-link"}))
                            .click(function (e) {
                                alert("Title: " + item.title);
                                e.stopPropagation();
                            });

                        return $("<div>").append($BPMNDeployment).append($BPMNHangUp).append($BPMNDetail).append($connectBusiness).append($BPMNDelete);
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
        // $('.suspensionState_1').addClass("disabled").attr('disabled',"true");
        $('filter-row>.jsgrid-cell:last-child, .jsgrid-header-row>.jsgrid-header-cell:last-child, .jsgrid-insert-row>.jsgrid-cell:last-child').text("操作");
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        bsCustomFileInput.init();
    });
</script>

<script>
    $("#uploadBpmnFile").click(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/uploadBPMN",
            type: "POST",
            data: new FormData($("#bpmnForm")[0]),
            processData: false,//告诉ajax不要处理和编码这些数据，直接提交
            contentType: false,//不使用默认的内容类型
            success: function (result) {
                console.log(result);
            },
            error: function (e) {
                console.log(e);
            }
        });
    });

    function fun() {
        toastr.success("用户头像上传成功！")
    }
</script>

</body>
</html>
