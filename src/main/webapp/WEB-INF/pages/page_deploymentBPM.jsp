<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>流程定义与操作</title>

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
        .image_container {
            min-height: 500px;
            width: 100%;
            height: 100%;
            text-align: center;
            display: table;
        }
        .i_center {
            vertical-align: middle;
            text-align: center;
            display: table-cell;
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
                        <h1>流程定义与操作</h1>
                        </button>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">流程定义与操作</li>
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
                            <i class="fas fa-exclamation-triangle" style="position: absolute;font-size: 45px;top: 18px;left: 25px;color: #ffbf00;"></i>
                            <dl style="margin-left: 80px;">
                                <dt>是否删除该流程定义下的所有实例？</dt>
                                <dd>这将导致所有基于此定义的实例流程被终止且删除。</dd>
                            </dl>
                        </div>

                        <textarea id="deploymentId" style="display: none"></textarea>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-end">
                        <button type="button" class="btn btn-danger" onclick="deleteSingleBpmn(1)" data-dismiss="modal"> &nbsp;&nbsp;是&nbsp;&nbsp; </button>
                        <button type="button" class="btn btn-default" onclick="deleteSingleBpmn(0)" data-dismiss="modal"> &nbsp;&nbsp;否&nbsp;&nbsp; </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">流程详细信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <div class="image_container">
                            <span class="i_center"> <img src="" alt="BPMN-png" id="showBPMN"></span>
                        </div>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" onclick="getSource('bpmn')"><i class="fas fa-project-diagram fa-fw"></i> 下载bpmn文件</button>
                                <button type="button" class="btn btn-default" onclick="getSource('svg')"><i class="fas fa-file-image fa-fw"></i> 下载SVG图像</button>
                                <button type="button" class="btn btn-default" onclick="editByUuid()"><i class="fas fa-edit fa-fw"></i> 编辑对应流程</button>
                            </div>
                        <button type="button" class="btn btn btn-default" id="uploadBpmnFile" data-dismiss="modal"> &nbsp;&nbsp;关闭&nbsp;&nbsp;</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">

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
                </div>
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
    (function (jsGrid) {

        jsGrid.locales["zh-cn"] = {
            grid: {
                noDataContent: "暂无数据",
                deleteConfirm: "确认删除？",
                pagerFormat: "页码: {first} {prev} {pages} {next} {last} &nbsp;&nbsp; {pageIndex} / {pageCount}",
                pagePrevText: "上一页",
                pageNextText: "下一页",
                pageFirstText: "第一页",
                pageLastText: "最后页",
                loadMessage: "请稍后...",
                invalidMessage: "数据有误！"
            },

            loadIndicator: {
                message: "载入中..."
            },

            fields: {
                control: {
                    searchModeButtonTooltip: "切换为搜索",
                    insertModeButtonTooltip: "切换为新增",
                    editButtonTooltip: "编辑",
                    deleteButtonTooltip: "删除",
                    searchButtonTooltip: "搜索",
                    clearFilterButtonTooltip: "清空过滤",
                    insertButtonTooltip: "插入",
                    updateButtonTooltip: "更新",
                    cancelEditButtonTooltip: "取消编辑"
                }
            },

            validators: {
                required: {message: "字段必填"},
                rangeLength: {message: "字段值长度超过定义范围"},
                minLength: {message: "字段长度过短"},
                maxLength: {message: "字段长度过长"},
                pattern: {message: "字段值不符合定义规则"},
                range: {message: "字段值超过定义范围"},
                min: {message: "字段值太小"},
                max: {message: "字段值太大"}
            }
        };

    }(jsGrid, jQuery));

    $(function () {

        jsGrid.locale("zh-cn");

        $("#jsGrid1").jsGrid({
            width: "100%",
            height: "auto",
            sorting: true,
            paging: true,
            autoload: true,

            pageSize: 15,
            pageButtonCount: 5,

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
                {name: "version", type: "text", width: 50, title: "版本号"},
                {name: "resourceName", type: "text", title: "XML资源名称"},
                {name: "diagramResourceName", type: "text", title: "图片资源名称"},
                {name: "suspensionState", type: "text", width: 50, title: "状态"},
                // 状态1表示激活 2表示挂起
                {
                    type: "control", width: 150, editButton: false, deleteButton: false,
                    itemTemplate: function (value, item) {
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                        // <i class="far fa-play-circle"></i>
                        // 添加流程激活方法
                        var $BPMNDeployment = $("<button>").attr("disabled", function () {
                            if (item.suspensionState === 1) {
                                return 'true';
                            }
                        })
                            .attr("class", "btn btn-default btn-flat")
                            .append($("<i></i>").attr({class: "fas fa-play"}))
                            .click(function (e) {
                                activateSingleBpmn(item.id);
                                e.stopPropagation();
                            });

                        // 添加流程删除方法 data-toggle="modal" data-target="#modal-lg"
                        var $BPMNDelete = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-trash-alt"}))
                            .click(function (e) {
                                $('#modal-default').modal("show")
                                $('#deploymentId').val(item.deploymentId);
                                e.stopPropagation();
                            });

                        // 添加流程挂起方法
                        var $BPMNHangUp = $("<button>")
                            .attr("disabled", function () {
                                if (item.suspensionState === 2) {
                                    return 'true';
                                }
                            })
                            .attr("class", "btn btn-default btn-flat").append($("<i></i>").attr({class: "fas fa-pause"}))
                            .click(function (e) {
                                suspendedSingleBpmn(item.id);
                                e.stopPropagation();
                            });

                        // 添加详细信息方法
                        var $BPMNDetail = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "fas fa-info"}))
                            .click(function (e) {
                                getUuidByDeploymentId(item.deploymentId)
                                $('#modal-lg').modal("show");
                                e.stopPropagation();
                            });

                        // 添加关联业务方法
                        var $connectBusiness = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "fas fa-link"}))
                            .click(function (e) {
                                toBusinessPage();
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
        $('#datemask2').inputmask('mm/dd/yyyy', {'placeholder': 'mm/dd/yyyy'});
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

    // 挂起流程方法
    function suspendedSingleBpmn(processDefinitionId) {
        var json_data = {processDefinitionId: processDefinitionId}
        console.log("尝试挂起流程定义：" + processDefinitionId);

        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url: "${pageContext.request.contextPath}/suspendedSingleBpmn",
            //发送方式为GET，也可为POST，需要与后台对应
            type: 'POST',
            data: JSON.stringify(json_data),
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("流程定义挂起失败！");
                } else if (data.code === 200) {
                    console.log(data);
                    $("#jsGrid1").jsGrid("loadData");
                    toastr.success("流程定义已挂起！");
                    // 刷新js-grid数据
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    // 激活流程定义方法
    function activateSingleBpmn(processDefinitionId) {
        var json_data = {processDefinitionId: processDefinitionId}
        console.log("尝试激活流程定义：" + processDefinitionId);

        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url: "${pageContext.request.contextPath}/activateSingleBpmn",
            //发送方式为GET，也可为POST，需要与后台对应
            type: 'POST',
            data: JSON.stringify(json_data),
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("流程定义激活失败！");
                } else if (data.code === 200) {
                    console.log(data);
                    $("#jsGrid1").jsGrid("loadData");
                    toastr.success("流程定义已激活！");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    // 激活流程定义方法
    function deleteSingleBpmn(deleteCase) {
        var deploymentId = $('#deploymentId').val();
        var json_data = {deploymentId: deploymentId, deleteCase: deleteCase}
        console.log("尝试删除流程定义(流程)：" + deploymentId);

        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url: "${pageContext.request.contextPath}/deleteSingleBpmn",
            //发送方式为GET，也可为POST，需要与后台对应
            type: 'POST',
            data: JSON.stringify(json_data),
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("流程定义(流程)删除失败！");
                } else if (data.code === 200) {
                    console.log(data);
                    $("#jsGrid1").jsGrid("loadData");
                    toastr.success("流程定义(流程)已删除！");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    var bpmnUUIDGlobal = "";

    function getUuidByDeploymentId(deploymentId){
        var json_data = {deploymentId: deploymentId}
        console.log("尝试获取 " + deploymentId + " 其流程UUID");

        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url: "${pageContext.request.contextPath}/getUuidByDeploymentId",
            //发送方式为GET，也可为POST，需要与后台对应
            type: 'POST',
            data: JSON.stringify(json_data),
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                } else if (data.code === 200) {
                    var showSrc = "https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/" + data.bpmnUUID +".svg";
                    bpmnUUIDGlobal = data.bpmnUUID;
                    $('#showBPMN').attr("src", showSrc);
                    console.log(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function getSource(extend){
        window.location.href = "https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/" + bpmnUUIDGlobal + "." + extend;
    }

    function editByUuid(){
        window.location = "${pageContext.request.contextPath}/reviewBPMN?uuid=" +  bpmnUUIDGlobal;
    }

    function toBusinessPage(){
        window.location = "${pageContext.request.contextPath}/toBusinessPage";
    }
</script>
</body>
</html>
