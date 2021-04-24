<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>${businessEntity.businessEntityName}管理</title>

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
                        <h1>${businessEntity.businessEntityName}管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">${businessEntity.businessEntityName}管理</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">添加${businessEntity.businessEntityName}配置</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                onclick="clearForm()">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="bpmnForm">
                            <div class="form-group">
                                    <label>项目主体</label>
                                    <select class="form-control" name="projectEntityUuid" id="projectEntity">
                                    </select>
                            </div>
                            <div class="form-group">
                                <label>业务主体UUID(自动填充，无需更改)</label>
                                <input type="text" class="form-control" placeholder="Entity Name" id="businessEntityUuid"
                                       name="businessEntityUuid" value='${businessEntity.businessEntityUuid}'>
                            </div>
                            <div class="form-group">
                                <label>流程定义</label>
                                <select class="form-control" name="processDefineId" id="processDefineId">
                                </select>
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearForm()">关闭
                        </button>
                        <button type="button" class="btn btn-primary" id="addPBEDetail" data-dismiss="modal">
                            添加${businessEntity.businessEntityName}配置
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <div class="modal fade" id="modal-showCode" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">页面Json配置信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <%--                        <button class="btn" data-clipboard-target="#foo">--%>
                        <%--                            <i class="far fa-clipboard"></i> 复制到剪贴板--%>
                        <%--                        </button>--%>
                        <div id="codePane">
                            <div class="btn-group" style="position: absolute; top: 35px; right: 33px; display: none;"
                                 id="copyButtonGroup">
                                <button class="btn btn-sm btn-flat btn-default"
                                        data-clipboard-target="#dynamicFormJsonData" id="copyIt">
                                    <i class="fas fa-paste fa-fw"></i> 复制
                                </button>
                            </div>
                            <pre><code class="json" id="dynamicFormJsonData">
                        </code></pre>
                        </div>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-end">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
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
                        <h4 class="modal-title">更改表单属性</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="dynamicForm">
                            <div class="form-group">
                                <label>动态表单名称</label>
                                <input type="text" class="form-control" placeholder="Dynamic FormName"
                                       id="dynamicFormName" name="dynamicFormName"
                                       v-bind:value="dynamicFormInf.formName">
                            </div>
                            <div class="form-group">
                                <label>动态表单创建人</label>
                                <input type="text" class="form-control" placeholder="DynamicForm CreateBy" id="createBy"
                                       name="createBy" v-bind:value="dynamicFormInf.createBy">
                            </div>
                            <div class="form-group">
                                <label>动态表单标识UUID</label>
                                <input type="text" class="form-control" placeholder="DynamicForm UUID"
                                       id="dynamicFormUUID" name="dynamicFormUUID" v-bind:value="dynamicFormInf.uuid">
                            </div>
                            <div class="form-group">
                                <label>动态表单描述</label>
                                <input type="text" class="form-control" placeholder="Dynamic Form Desc"
                                       id="dynamicFormDescInf" name="dynamicFormDescInf"
                                       v-bind:value="dynamicFormInf.formDesc">
                            </div>
                            <div class="form-group">
                                <label>动态表单Json文件</label>
                                <textarea class="form-control" rows="8" placeholder="Dynamic Form Json"
                                          id="dynamicFormJson"
                                          name="dynamicFormJson">{{ dynamicFormInf.formJson }}</textarea>
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="alterBpmnInf"
                                @click="changeDynamicFormInf(dynamicFormInf.uuid)" data-dismiss="modal">更改表单属性
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
                        <h3 class="card-title" style="margin-top: 5px;">${businessEntity.businessEntityName}配置信息列表</h3>
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
        dynamicFormInf: {},
    };

    var app = new Vue({
        el: '#app',
        data: vue_data,
        methods: {
            changeDynamicFormInf: function (uuid) {
                console.log(uuid);
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
        $('#projectEntity').find("option").remove();
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/getProjectEntity",
            dataType: "JSON",
            success: function (data) {
                if (data !== "" && data !== null) {
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        $("#projectEntity").append("<option value='" + data[i].projectEntityUuid + "'>" + data[i].projectEntityName + "</option>");
                    }
                }

            },
            error: function (e) {
                console.log(e);
            }
        })
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/getImplementBPMN",
            dataType: "JSON",
            success: function (data) {
                if (data !== "" && data !== null) {
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        $("#processDefineId").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
                    }
                }

            },
            error: function (e) {
                console.log(e);
            }
        })
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
                        url: "${pageContext.request.contextPath}/getPbpInformation?businessEntityUuid=${businessEntity.businessEntityUuid}",
                        data: filter,
                        dataType: "JSON"
                    })

                }
            },

            fields: [
                {name: "id", type: "text", width: 50, title: "ID"},
                {name: "businessEntity.businessEntityName", type: "text", width: 50, title: "业务主体名称"},
                {name: "projectEntity.projectEntityName", type: "text", width: 150, title: "项目主体名称"},
                {name: "projectEntity.projectEntityUuid", type: "text", width: 150, title: "项目主体UUID"},
                {name: "processDefineId", type: "date", width: 150, title: "流程定义名称"},
                {name: "processDefineName", type: "text", width: 150, title: "流程定义UUID"},

                {
                    type: "control", width: 100, editButton: false, deleteButton: false,
                    itemTemplate: function (value, item) {
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                        // <i class="far fa-play-circle"></i>
                        // 添加公告设置方法
                        var $showDynamicTable = $("<button>").attr({class: "btn btn-default btn-flat suspensionState_" + item.suspensionState + ""}).append($("<i></i>").attr({class: "far fa-comment-alt"}))
                            .click(function (e) {
                                toEditDeclaration(item.projectEntity.projectEntityUuid, item.processDefineId);
                                e.stopPropagation();
                            });

                        // 添加查看json数据方法
                        // var $showJsonCode = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-file-code"}))
                        //     .click(function (e) {
                        //         toShowJsonCode(item.uuid);
                        //         e.stopPropagation();
                        //     });

                        // 添加动态表单编辑方法
                        var $editDynamicFormInf = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-edit"}))
                            .click(function (e) {
                                toEditDynamicFormInf(item.uuid);
                                e.stopPropagation();
                            });

                        // 添加删除方法
                        var $deleteDynamicForm = $("<button>").attr({class: "btn btn-default btn-flat"}).append($("<i></i>").attr({class: "far fa-trash-alt"}))
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

                        return $("<div>").append($showDynamicTable).append($editDynamicFormInf).append($deleteDynamicForm);
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
        $('#bpmnForm').get(0).reset();
    }

    $("#addPBEDetail").click(function () {
        toastr.info('正在添加配置信息')
        $.ajax({
            url: "${pageContext.request.contextPath}/addPBEDetail",
            type: "POST",
            data: new FormData($("#bpmnForm")[0]),
            processData: false,//告诉ajax不要处理和编码这些数据，直接提交
            contentType: false,//不使用默认的内容类型
            dataType: 'json',
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("配置信息添加失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("配置信息添加成功！")
                    $("#jsGrid1").jsGrid("loadData");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
        $("#bpmnForm")[0].reset();
    });

    function toShowJsonCode(uuid) {
        var json_data = {dynamicFormUuid: uuid}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/getDynamicFormJsonByUuid',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            success: function (data) {//返回json结果
                var dynamicFormJson = data.dynamicForm.formJson;
                $('#dynamicFormJsonData').html(dynamicFormJson);
                hljs.highlightAll();
            }
        });
        $('#modal-showCode').modal("show");
    }

    function toEditDynamicFormInf(uuid) {
        var json_data = {dynamicFormUuid: uuid}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/getDynamicFormJsonByUuid',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            async: false, //同步传输，并添加返回值，返回值应为已定义的全局变量 如a
            data: JSON.stringify(json_data),
            success: function (data) {//返回json结果
                vue_data.dynamicFormInf = data.dynamicForm;
            }
        });
        $('#modal-dynamicFormInf').modal("show");
    }

    function toDeleteProjectEntity(uuid) {
        var json_data = {projectEntityUuid: uuid}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/deleteProjectEntityByUuid',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("项目实体删除失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("项目主体删除成功！")
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

    function toApplyDynamicFormInf(uuid) {
        var json_data = {dynamicFormUuid: uuid}
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/applyDynamicFormInfByUuid',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("动态表单应用失败!");
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("动态表单应用成功！")
                    $("#jsGrid1").jsGrid("loadData");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function toEditDeclaration(projectEntityUuid, processDefineId){
        window.location = "${pageContext.request.contextPath}/declarationEdit?PeUuid=" +  projectEntityUuid + "&BeUuid=" + "${businessEntity.businessEntityUuid}" + "&processDefineId=" + processDefineId;
    }

</script>
</body>
</html>
