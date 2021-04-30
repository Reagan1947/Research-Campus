<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>用户与用户组</title>

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
                        <h1>用于与用户组管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">用户与用户组</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">添加用户组</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                onclick="clearForm()">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="groupOfUserForm">
                            <div class="form-group">
                                <label>用户组名称</label>
                                <input type="text" class="form-control" placeholder="User Group Name" id="groupOfUserName"
                                       name="groupOfUserName">
                            </div>
                            <div class="form-group">
                                <label>用户组类型</label>
                                <input type="text" class="form-control" placeholder="User Group Type" id="groupOfUserType"
                                       name="groupOfUserType">
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearForm()">关闭
                        </button>
                        <button type="button" class="btn btn-primary" id="createGroupOfUser" data-dismiss="modal">
                            创建用户群组
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


        <div class="modal fade" id="modal-dynamicFormInf" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="app">
                    <div class="modal-header">
                        <h4 class="modal-title">更改用户群组信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="dynamicForm">
                            <div class="form-group">
                                <label>用户群组名称</label>
                                <input type="text" class="form-control" placeholder="User Group Name"
                                       id="groupOfUserNameInf" name="groupOfUserName"
                                       v-model="groupOfUserInf.name">
                            </div>
                            <div class="form-group">
                                <label>用户群组类型</label>
                                <input type="text" class="form-control" placeholder="User Group Type"
                                       id="groupOfUserTypeInf" name="groupOfUserType"
                                       v-model="groupOfUserInf.type">
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="alterBpmnInf"
                                @click="changeGroupOfUserInf($event)" data-dismiss="modal">更改用户群组信息
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
                        <h3 class="card-title" style="margin-top: 5px;">用户组列表</h3>
                        <!-- 右侧按钮 -->
                        <div style="float: right">
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" id="filterButton"><i
                                            class="fas fa-filter"></i></button>
                                    <button type="button" class="btn btn-default" onclick="reloadData()"><i
                                            class="fas fa-sync-alt"></i>
                                    </button>
                                    <!-- 导入表格 -->
                                    <button type="button" class="btn btn-default" onclick="inputNewForm()">
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
                                    <lable class="col-form-label">用户群组ID</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="UserGroup ID">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">群组名称</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="UserGroup Name">
                                </div>
                                <div class="col-2">
                                    <lable class="col-form-label">群组类型</lable>
                                    <input type="text" class="form-control forPlaceholder" placeholder="UserGroup Type">
                                </div>

                                <div class="col-6" style="margin-top: 24px;">
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default">查询</button>
                                            <button type="button" class="btn btn-default">重置</button>
<%--                                            <button type="button" class="btn btn-default" id="showMoreButton">更多 <i--%>
<%--                                                    class="fas fa-angle-down"></i></button>--%>
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
        methods: {
            changeGroupOfUserInf: function (event) {
                var up_data = {
                    id: vue_data.groupOfUserInf.id,
                    name: vue_data.groupOfUserInf.name,
                    type: vue_data.groupOfUserInf.type,
                }
                event.preventDefault();

                let config = {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }
                this.$http.post('${pageContext.request.contextPath}/applyGroupOfUserChange', up_data, config).then(function (res) {
                    if (res.status === 200) {
                        toastr.success("用户群组信息更新成功！");
                        $("#jsGrid1").jsGrid("loadData");
                    } else if(res.status === 400) {
                        toastr.error("用户群组信息更新失败！");
                    }
                })
            }
        }
    });

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

    function inputNewForm() {
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
                        url: "${pageContext.request.contextPath}/getGroupOfUser",
                        data: filter,
                        dataType: "JSON"
                    })

                }
            },

            fields: [
                {name: "id", type: "text", width: 100, title: "ID"},
                {name: "name", type: "text", width: 200, title: "群组名称"},
                {name: "type", type: "text", width: 100, title: "群组类型"},
                {
                    type: "control", width: 150, editButton: false, deleteButton: false,
                    itemTemplate: function (value, item) {
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                        // 添加用户群组信息编辑方法
                        var $editDynamicFormInf = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-edit"}))
                            .click(function (e) {
                                toEditGroupOfUserInformation(item.id);
                                e.stopPropagation();
                            });

                        // 添加用户群组信息删除方法
                        var $deleteDynamicForm = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-trash-alt"}))
                            .click(function (e) {
                                toDeleteGroupOfUser(item.id);
                                e.stopPropagation();
                            });

                        return $("<div>").append($editDynamicFormInf).append($deleteDynamicForm);
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

    $("#createGroupOfUser").click(function () {
        toastr.info('正在添加群组信息！')
        $.ajax({
            url: "${pageContext.request.contextPath}/createUserGroup",
            type: "POST",
            data: new FormData($("#groupOfUserForm")[0]),
            processData: false,//告诉ajax不要处理和编码这些数据，直接提交
            contentType: false,//不使用默认的内容类型
            dataType: 'json',
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("用户群组创建失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("用户群组创建成功！")
                    $("#jsGrid1").jsGrid("loadData");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
        $("#groupOfUserForm")[0].reset();
    });

    function toEditGroupOfUserInformation(groupOfUserUuid) {
        var json_data = {groupOfUserUuid: groupOfUserUuid}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/getGroupOfUserInf',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            async: false, //同步传输，并添加返回值，返回值应为已定义的全局变量
            data: JSON.stringify(json_data),
            success: function (data) {//返回json结果
                vue_data.groupOfUserInf = data.group;
            }
        });
        $('#modal-dynamicFormInf').modal("show");
    }

    function toDeleteGroupOfUser(groupOfUserUuid) {
        var json_data = {groupOfUserUuid: groupOfUserUuid}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/deleteGroupOfUser',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("群组删除失败!");
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("群组删除成功！");
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

</script>
</body>
</html>
