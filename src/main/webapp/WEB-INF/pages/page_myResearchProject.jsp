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

                    <c:forEach items="${taskMoreList}" var="taskMore">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title" style="display:contents;">
                                        <span style="font-weight: 550;">${taskMore.task.name}</span> |
                                        <span>${taskMore.projectEntity.projectEntityName}</span>
                                    </p>
                                    <hr>
                                    <p class="card-text">
                                    <p>
                                        <span><i class="fas fa-clock fa-fw"></i> ${taskMore.task.createTime} </span>
                                        <br>
                                        <span><i
                                                class="fas fa-pen-square fa-fw"></i> Task-ID-${taskMore.task.id} </span>
                                    </p>
                                    </p>
                                    <button type="button" class="btn btn-primary"
                                            onclick="toApplyBusinessEntity('${taskMore.task.id}')">立即处理
                                    </button> &nbsp;&nbsp;
                                    <button type="button" class="btn btn-default">撤销申请</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>


                <!-- 表格开始 -->
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title" style="margin-top: 5px;">个人科研项目管理</h3>
                        <!-- 右侧按钮 -->
                        <div style="float: right">
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" id="filterButton"><i
                                            class="fas fa-filter"></i></button>
                                    <button type="button" class="btn btn-default" onclick="reloadData()"><i
                                            class="fas fa-sync-alt"></i>
                                    </button>
                                    <%--                                    <!-- 导入表格 -->--%>
                                    <%--                                    <button type="button" class="btn btn-default" onclick="inputNewForm()">--%>
                                    <%--                                        <i class="fas fa-plus"></i>--%>
                                    <%--                                    </button>--%>
                                </div>
                            </td>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <!-- 查询按钮组 -->
                        <div style="margin-bottom: 15px; display: none;" id="filterBar">
                            <div class="row">
                                <div class="col-2">
                                    <lable class="col-form-label">项目主体名称</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="formName">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">创建时间</lable>
                                    <input type="text" class="form-control" data-inputmask-alias="datetime"
                                           data-inputmask-inputformat="dd/mm/yyyy" data-mask placeholder="dd/mm/yyyy">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">项目主体描述</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="formDesc">
                                </div>

                                <div class="col-6" style="margin-top: 24px;">
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default">查询</button>
                                            <button type="button" class="btn btn-default">重置</button>
                                            <button type="button" class="btn btn-default" id="showMoreButton">更多 <i
                                                    class="fas fa-angle-down"></i></button>
                                        </div>
                                    </td>
                                </div>
                            </div>

                            <div class="row" style="margin-top: 10px; display: none;" id="showMoreBar">
                                <div class="col-2">
                                    <lable class="col-form-label">项目主体UUID</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="formName">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">更新时间</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="formName">

                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">项目主体ID</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="formDesc">
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
    function toApplyBusinessEntity(taskId) {
        window.location.href = "${pageContext.request.contextPath}/toBusinessEntityDynamicForm?taskId=" + taskId;
    }

    var DateField = function (config) {
        jsGrid.Field.call(this, config);
    };
    DateField.prototype = new jsGrid.Field({
        sorter: function (date1, date2) {
            return moment(date1) - moment(date2);
        },
        itemTemplate: function (value) {
            var momentResult;
            if (value == "" || value == null) {
                momentResult = "暂无数据"
            } else {
                momentResult = moment(value).locale('en').format('YYYY-MM-DD HH:mm:ss');
            }
            return momentResult
        },
    });
    jsGrid.fields.date = DateField;
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
                        url: "${pageContext.request.contextPath}/getMyResearchProjectDetail",
                        data: filter,
                        dataType: "JSON"
                    })

                }
            },

            fields: [
                {name: "id", type: "text", width: 50, title: "ID"},
                {name: "projectEntity.projectEntityName", type: "text", width: 100, title: "项目主体名称"},
                {name: "projectEntity.projectEntityUuid", type: "text", width: 150, title: "项目主体UUID"},
                {name: "businessEntity.businessEntityName", type: "text", width: 100, title: "项目业务阶段"},
                {name: "createDate", type: "date", width: 150, title: "项目业务开始时间"},
                {name: "nowTask.name", type: "text", width: 150, title: "当前环节"},
                {name: "instanceStatus", type: "text", width: 100, title: "状态"},

                {
                    type: "control", width: 100, editButton: false, deleteButton: false,
                    itemTemplate: function (value, item) {
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                        // <i class="far fa-play-circle"></i>
                        // 添加表单预览方法
                        // var $showDynamicTable = $("<button>").attr({class: "btn btn-default btn-flat suspensionState_" + item.suspensionState + ""}).append($("<i></i>").attr({class: "far fa-list-alt"}))
                        //     .click(function (e) {
                        //         previewForm(item.uuid);
                        //         e.stopPropagation();
                        //     });

                        // 添加查看json数据方法
                        // var $showJsonCode = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-file-code"}))
                        //     .click(function (e) {
                        //         toShowJsonCode(item.uuid);
                        //         e.stopPropagation();
                        //     });

                        // 查看具体流程进度
                        var $editDynamicFormInf = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "fas fa-project-diagram fa-fw"}))
                            .click(function (e) {
                                toShowDiagramProgress(item.processInstanceId);
                                e.stopPropagation();
                            });

                        // 添加删除方法
                        var $deleteDynamicForm = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "fas fa-list fa-fw"}))
                            .click(function (e) {
                                toDeleteProjectEntity(item.projectEntityUuid);
                                e.stopPropagation();
                            });

                        // 添加应用表单方法
                        // var $applyDynamicForm = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-hdd"}))
                        //     .attr("disabled", function () {
                        //         if (item.formStatus === 1) {
                        //             return 'true';
                        //         }
                        //     })
                        //     .click(function (e) {
                        //         toApplyDynamicFormInf(item.uuid);
                        //         e.stopPropagation();
                        //     });

                        return $("<div>").append($editDynamicFormInf).append($deleteDynamicForm);
                        // return $result.add($customButton);
                    },
                }
            ]
        });
    });


    $(document).ready(function () {
        $("#filterButton").click(function () {
            $("#filterBar").slideToggle(250);
        });

        $("#showMoreButton").click(function () {
            $("#showMoreBar").slideToggle(250);
        });

    });

    window.onload = function () {
        // $('#datemask').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' });
        $('[data-mask]').inputmask();

        // 当状态表示1时候 表示已部署 此时部署按钮不可用
        $('.suspensionState_1').addClass("disabled").attr('disabled', "true");
        $('filter-row>.jsgrid-cell:last-child, .jsgrid-header-row>.jsgrid-header-cell:last-child, .jsgrid-insert-row>.jsgrid-cell:last-child').text("操作");
    }

    function toShowDiagramProgress(processInstanceId) {
        window.location.href = "${pageContext.request.contextPath}/showDiagramProgress?processInstanceId=" + processInstanceId;
    }
</script>
</body>
</html>
