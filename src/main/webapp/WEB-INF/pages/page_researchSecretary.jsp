<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>科研秘书用户组管理</title>

    <style>
        .col-form-label {
            margin-left: 5px;
            margin-bottom: 8px;
        }

        .infoTextarea.change::-webkit-input-placeholder {
            color: black !important;
        }

        .infoTextarea.change::-moz-placeholder { /* Mozilla Firefox 19+ */
            color: black !important;
        }

        .infoTextarea.change:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color: black !important;
        }

        .infoTextarea.change:-ms-input-placeholder { /* Internet Explorer 10-11 */
            color: black !important;
        }

        .select2-container .select2-selection--single {
            height: calc(2.25rem + 2px) !important;
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
                        <h1>科研秘书用户组管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">科研秘书用户组管理</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">添加科研秘书用户组</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                onclick="clearForm()">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="groupOfUserForm">
                            <div class="form-group">
                                <label>二级部门</label>
                                <select class="form-control" name="subject" id="subject">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>用户组</label>
                                <select class="form-control" name="groupOfUser"  id="groupOfUser">
                                </select>
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearForm()">关闭
                        </button>
                        <button type="button" class="btn btn-primary" id="addGroupOfSecretary" data-dismiss="modal">
                            添加科研秘书用户组
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


        <div class="modal fade" id="modal-researchSecretaryGroupInf" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="app">
                    <div class="modal-header">
                        <h4 class="modal-title">更改科研秘书用户群组信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="groupOfSecretary">
                            <div class="form-group">
                                <label>所属二级部门</label>
                                <input type="text" class="form-control" placeholder="Subject Name"
                                       id="subjectName" name="subjectName" disabled>
                            </div>
                            <div class="form-group">
                                <label>群组名称</label>
                                <select class="form-control" name="groupOfUserUuid" id="groupOfSecretaryChange">
                                </select>
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="alterBpmnInf"
                                onclick="changeGroupOfSecretaryInf()" data-dismiss="modal">更改科研秘书用户组
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
                    <div class="col-md-12">
                    </div>
                </div>

                <!-- 表格开始 -->
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title" style="margin-top: 5px;">科研秘书用户组列表</h3>
                        <!-- 右侧按钮 -->
                        <div style="float: right">
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" id="filterButton"><i
                                            class="fas fa-filter"></i></button>
                                    <button type="button" class="btn btn-default" onclick="reloadData()"><i
                                            class="fas fa-sync-alt"></i>
                                    </button>
                                    <!-- 创建新的科研秘书用户群组 -->
                                    <button type="button" class="btn btn-default"
                                            onclick="addNewResearchSecretaryGroup()">
                                        <i class="fas fa-plus"></i>
                                    </button>
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
                                    <lable class="col-form-label">科研秘书群组ID</lable>
                                    <input type="text" class="form-control forPlaceholder"
                                           placeholder="Group Of User Secretary">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">所属二级部门</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="Subject Name">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">群组UUID</lable>
                                    <input type="text" class="form-control forPlaceholder"
                                           placeholder="User Group UUID">
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
                                    <lable class="col-form-label">群组名称</lable>
                                    <input type="text" class="form-control forPlaceholder"
                                           placeholder="User Group Name">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">群组类型</lable>
                                    <input type="text" class="form-control forPlaceholder"
                                           placeholder="User Group Type">
                                </div>
                                <%--                                <div class="col-2">--%>
                                <%--                                    <lable class="col-form-label">项目主体ID</lable>--%>
                                <%--                                    <input type="text" class="form-control forPlaceholder" placeholder="formDesc">--%>
                                <%--                                </div>--%>
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

<!-- high light js -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/highlight.min.js"></script>
<!-- copy it -->
<script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.8/dist/clipboard.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<script>
    // $('#dynamicFormJson').overlayScrollbars({textarea:{dynHeight: true}});

    var vue_data = {
        groupOfUserInf: {},
    };

    Vue.prototype.$http = axios;
    var app = new Vue({
        el: '#app',
        data: vue_data,
        methods: {}
    });

    var global_data = {
        groupOfSecretaryId: "",
    }

    new ClipboardJS('#copyIt');

    $(function () {
        $('#codePane').mouseenter(function () {
            $('#copyButtonGroup').show("fade", "fast");
        });
        $('#codePane').mouseleave(function () {
            $('#copyButtonGroup').hide("fade", "fast");
        });
    })

    // $('#dynamicFormJsonData').hover(function () {
    //     $('#copyButtonGroup').fadeIn;
    // }, function() {
    //     $('#copyButtonGroup').fadeOut;
    // });

    $(document).ready(function() {
        $('#groupOfUser').select2({
            ajax: {
                url: '${pageContext.request.contextPath}/getGroupOfUserSelect',
                dataType: 'json'
                // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
            }
        });

        $('#groupOfSecretaryChange').select2({
            ajax: {
                url: '${pageContext.request.contextPath}/getGroupOfUserSelect',
                dataType: 'json'
                // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
            }
        });

        $('#subject').select2({
            ajax: {
                url: '${pageContext.request.contextPath}/getAllSubjectSelect',
                dataType: 'json'
                // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
            }
        });
    });

    function addNewResearchSecretaryGroup() {
        $('#groupOfUser').find("option").remove();
        $('#subject').find("option").remove();
        <%--$.ajax({--%>
        <%--    type: "GET",--%>
        <%--    url: "${pageContext.request.contextPath}/getGroupOfUser",--%>
        <%--    dataType: "JSON",--%>
        <%--    success: function (data) {--%>
        <%--        if (data !== "" && data !== null) {--%>
        <%--            console.log(data);--%>
        <%--            for (var i = 0; i < data.length; i++) {--%>
        <%--                $("#groupOfUser").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");--%>
        <%--            }--%>
        <%--        }--%>
        <%--    },--%>
        <%--    error: function (e) {--%>
        <%--        console.log(e);--%>
        <%--    }--%>
        <%--})--%>
        <%--$.ajax({--%>
        <%--    type: "GET",--%>
        <%--    url: "${pageContext.request.contextPath}/getAllSubject",--%>
        <%--    dataType: "JSON",--%>
        <%--    success: function (data) {--%>
        <%--        var subjectData = data.subjectList;--%>
        <%--        if (subjectData !== "" && subjectData !== null) {--%>
        <%--            console.log(data);--%>
        <%--            for (var i = 0; i < subjectData.length; i++) {--%>
        <%--                $("#subject").append("<option value='" + subjectData[i].id + "'>" + subjectData[i].subjectDesc + "</option>");--%>
        <%--            }--%>
        <%--        }--%>
        <%--    },--%>
        <%--    error: function (e) {--%>
        <%--        console.log(e);--%>
        <%--    }--%>
        <%--})--%>
        $('#modal-lg').modal("show")
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
                        url: "${pageContext.request.contextPath}/getGroupOfSecretary",
                        data: filter,
                        dataType: "JSON"
                    })

                }
            },

            fields: [
                {name: "id", type: "text", width: 100, title: "ID"},
                {name: "subject.subjectDesc", type: "text", width: 200, title: "所属二级部门"},
                {name: "group.id", type: "text", width: 200, title: "群组UUID"},
                {name: "group.name", type: "text", width: 200, title: "群组名称"},
                {name: "group.type", type: "text", width: 100, title: "群组类型"},
                {
                    type: "control", width: 150, editButton: false, deleteButton: false,
                    itemTemplate: function (value, item) {
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                        // 添加科研秘书群组信息编辑方法
                        var $editGroupOfSecretary = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-edit"}))
                            .click(function (e) {
                                toEditGroupOfSecretaryInformation(item.subject.subjectDesc, item.group.name, item.group.id, item.id);
                                e.stopPropagation();
                            });

                        // 添加科研秘书群组信息删除方法
                        var $deleteGroupOfSecretary = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-trash-alt"}))
                            .click(function (e) {
                                toDeleteGroupOfSecretaryInformation(item.id);
                                e.stopPropagation();
                            });

                        return $("<div>").append($editGroupOfSecretary).append($deleteGroupOfSecretary);
                        // return $result.add($customButton);
                    },
                }
            ]
        });
    });

    window.onload = function () {
        // $('#datemask').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' });
        $('[data-mask]').inputmask();

        // 当状态表示1时候 表示已部署 此时部署按钮不可用
        $('.suspensionState_1').addClass("disabled").attr('disabled', "true");
        $('filter-row>.jsgrid-cell:last-child, .jsgrid-header-row>.jsgrid-header-cell:last-child, .jsgrid-insert-row>.jsgrid-cell:last-child').text("操作");
    }

    $(document).ready(function () {
        $("#filterButton").click(function () {
            $("#filterBar").slideToggle(250);
        });

        $("#showMoreButton").click(function () {
            $("#showMoreBar").slideToggle(250);
        });

    });

    $("input").focus(function () {
        var elem = $(this);
        if (elem.hasClass('forPlaceholder')) {
            elem.addClass('infoTextarea change');
        }
    });
    $("input").blur(function () {
        var elem = $(this);
        if (elem.hasClass('infoTextarea change') && elem.hasClass('forPlaceholder')) {
            elem.removeClass('infoTextarea change');
        }
    });

    function clearForm() {
        $('#groupOfUserForm').get(0).reset();
    }

    $("#addGroupOfSecretary").click(function () {
        toastr.info('正在添加科研秘书用户组信息！')
        $.ajax({
            url: "${pageContext.request.contextPath}/addGroupOfSecretary",
            type: "POST",
            data: new FormData($("#groupOfUserForm")[0]),
            processData: false,//告诉ajax不要处理和编码这些数据，直接提交
            contentType: false,//不使用默认的内容类型
            dataType: 'json',
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("添加科研秘书用户组信息失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("添加科研秘书用户组信息成功！")
                    $("#jsGrid1").jsGrid("loadData");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
        $("#groupOfUserForm")[0].reset();
    });

    function toEditGroupOfSecretaryInformation(subjectName, groupOfSecretaryName, groupOfSecretaryUuid, groupOfSecretaryId) {
        $("#subjectName").val(subjectName);
        var groupOfSecretaryChange = $('#groupOfSecretaryChange');
        var option = new Option(groupOfSecretaryName, groupOfSecretaryUuid, true, true);
        groupOfSecretaryChange.append(option).trigger('change');

        // manually trigger the `select2:select` event
        groupOfSecretaryChange.trigger({
            type: 'select2:select',
            params: {
                data: {
                    "id": groupOfSecretaryUuid,
                    "text": groupOfSecretaryName,
                }
            }
        });
        global_data.groupOfSecretaryId = groupOfSecretaryId;
        <%--console.log(global_data);--%>
        <%--$.ajax({--%>
        <%--    type: "GET",--%>
        <%--    url: "${pageContext.request.contextPath}/getGroupOfUser",--%>
        <%--    dataType: "JSON",--%>
        <%--    success: function (data) {--%>
        <%--        if (data !== "" && data !== null) {--%>
        <%--            console.log(data);--%>
        <%--            for (var i = 0; i < data.length; i++) {--%>
        <%--                if (data[i].id === groupOfSecretaryUuid) {--%>
        <%--                    $("#groupOfSecretaryChange").append("<option selected = 'selected' value='" + data[i].id + "'>" + data[i].name + "</option>");--%>
        <%--                } else {--%>
        <%--                    $("#groupOfSecretaryChange").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");--%>
        <%--                }--%>
        <%--            }--%>
        <%--        }--%>
        <%--    },--%>
        <%--    error: function (e) {--%>
        <%--        console.log(e);--%>
        <%--    }--%>
        <%--});--%>
        $('#modal-researchSecretaryGroupInf').modal("show");
    }

    function toDeleteGroupOfSecretaryInformation(groupOfSecretaryId) {
        var json_data = {groupOfSecretaryId: groupOfSecretaryId}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/deleteGroupOfSecretaryInf',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("科研秘书用户群组删除失败!");
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("科研秘书用户群组删除成功！");
                    $("#jsGrid1").jsGrid("loadData");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function reloadData() {
        $("#jsGrid1").jsGrid("loadData");
        toastr.success("动态表单列表已刷新");
    }

    function changeGroupOfSecretaryInf() {
        var formData = new FormData($("#groupOfSecretary")[0]);
        formData.append("groupOfSecretaryId", global_data.groupOfSecretaryId);

        $.ajax({
            url: "${pageContext.request.contextPath}/changeGroupOfSecretary",
            type: "POST",
            data: formData,
            processData: false, //告诉ajax不要处理和编码这些数据，直接提交
            contentType: false, //不使用默认的内容类型
            dataType: 'json',
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("配置信息更改失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    toastr.success("配置信息更改成功！")
                    $("#jsGrid1").jsGrid("loadData");
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
