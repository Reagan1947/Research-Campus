<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>科研项目审批</title>

    <style>
        div.dataTables_wrapper div.dataTables_length select {
            width: 50px !important;
        }

        table.dataTable thead > tr > th.sorting_asc, table.dataTable thead > tr > th.sorting_desc, table.dataTable thead > tr > th.sorting,
        table.dataTable thead > tr > td.sorting_asc, table.dataTable thead > tr > td.sorting_desc, table.dataTable thead > tr > td.sorting {
            background-image: none !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: .5rem 0 .5rem 0 !important;
            margin: 0 !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: none !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0 !important;
            border: none !important;
        }

        table.dataTable tbody th, table.dataTable tbody td {
            padding-left: 20px !important;
        }
    </style>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css
">

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
                        <h1>科研项目审批(已认领)</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">科研项目审批(已认领)</li>
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
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">科研项目待审批已认领列表</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">

                                <!-- main -->
                                <table id="table_id" class="display" style="width: 100%;">
                                    <thead>
                                    <tr>
                                        <th>任务-Id</th>
                                        <th>任务定义-Key</th>
                                        <th>任务名称</th>
                                        <th>任务办理人</th>
                                        <th>流程实例ID</th>
                                        <th>审批项目主体</th>
                                        <th>审批申请人</th>
                                        <th>审批申请人UUID</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>

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
    $(document).ready(function () {
        $('#table_id').DataTable({
            paging: true,  //是否开启本地分页
            info: true,  //控制是否显示表格左下角的信息
            lengthChange: true,  //是否允许用户改变表格每页显示的记录数
            ordering: true,  //是否允许Datatables开启排序
            processing: true,  //是否显示处理状态(排序的时候，数据很多耗费时间长的话，也会显示这个)
            searching: true, //是否允许Datatables开启本地搜索
            serverSide: true,  //是否开启服务器模式
            deferRender: true,  //控制Datatables的延迟渲染，可以提高初始化的速度
            language: {
                url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Chinese.json'
            },
            ajax: "${pageContext.request.contextPath}/getClaimTaskOfEa",
            columns: [
                {"data": "taskId"},
                {"data": "taskDefinitionKey"},
                {"data": "taskName"},
                {
                    "data": "taskAssignee",
                    "render": function (data, type, row) {
                        var result = '';
                        if (data == null) {
                            result = '暂未认领';
                        } else {
                            result = '<span style="word-wrap:break-word;word-break:break-all;">' + data + '</span>';
                        }

                        return result;
                    }
                },
                {"data": "processInstanceId"},
                {"data": "projectName"},
                {"data": "userName"},
                {
                    "data": "userUuid",
                    "render": function (data, type, row) {
                        return '<span style="word-wrap:break-word;word-break:break-all;">' + data + '</span>'
                    }
                },
                // 领取、审批、撤回
                {
                    "orderable": false,
                    "data": function (row, type, val, meta) {
                        var claim = '';
                        var examine = 'disabled';
                        var cancel = 'disabled';
                        if (row.taskAssignee != null) {
                            claim = 'disabled';
                        }
                        if (row.taskAssignee != null && row.taskAssignee === '${sessionScope.uuid}') {
                            examine = '';
                            cancel = '';
                        }
                        return '<div class="btn-group"> ' +
                            '<button type="button" class="btn btn-default" ' + claim + ' onclick="claimTask(' + row.taskId + ')"><i class="fas fa-user-check"></i></button> ' +
                            '<button type="button" class="btn btn-default" ' + examine + ' onclick="examineAndApproveTask(' + row.taskId + ')"><i class="fas fa-file-signature"></i></button> ' +
                            '<button type="button" class="btn btn-default" ' + cancel + ' onclick="cancelClaim(' + row.taskId + ')" ><i class="fas fa-reply"></i></button> ' +
                            '</div>'
                    }
                },
            ]
        });
    });

    // 通过 taskId 认领任务
    function claimTask(taskId) {
        var json_data = {taskId: taskId}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/claimTask',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("任务认领失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    toastr.success("任务认领成功！")
                    $('#table_id').DataTable().ajax.reload();
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

        // 通过 taskId 取消任务认领
        function cancelClaim(taskId) {
            var json_data = {taskId: taskId}
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath }/cancelClaim',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(json_data),
                success: function (data) {
                    if (data.code === 400) {
                        console.log(data);
                        toastr.error("取消任务认领失败！")
                    } else if (data.code === 200) {
                        console.log(data);
                        toastr.success("取消任务认领成功！")
                        $('#table_id').DataTable().ajax.reload();
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            });
    }

    function examineAndApproveTask(taskId) {
        window.location.href = "${pageContext.request.contextPath}/toEaDynamicForm?taskId=" + taskId;
    }
</script>
</body>
</html>
