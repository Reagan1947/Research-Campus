<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="admin_head.jsp"/>
    <title>流程管理</title>

    <style>
        .cards tbody tr {
            float: left;
            width: 19rem;
            margin: 0.5rem;
            border: 0.0625rem solid rgba(0, 0, 0, .125);
            border-radius: 0.25rem;
            height: auto!important;
            overflow: hidden;
            /*box-shadow: 0.25rem 0.25rem 0.5rem rgba(0, 0, 0, 0.25);*/

            -webkit-transition: all 0.2s ease-in-out 0s;
            -moz-transition: all 0.2s ease-in-out 0s;
            -o-transition: all 0.2s ease-in-out 0s;
            -ms-transition: all 0.2s ease-in-out 0s;
            /* 动画效果
                all：所有属性都将获得过渡效果
                0.4s：完成过渡效果需要花费的时间
                ease-in-out：规定以慢速开始和结束的过渡效果
                0s：规定过渡效果何时开始
            */
            transition: all 0.2s ease-in-out 0s;
        }

        .cards tbody td {
            display: block;
            color: #80808d;
            background-color: #dee2e6;
        }

        .cards tbody .text-center {
            /*display: block;*/
            background-color: white;
            border-top: none;
        }

        .cards thead {
            display: none;
        }

        .cards td:before {
            content: attr(data-label);
            position: relative;
            float: left;
            color: #808080;
            min-width: 4rem;
            margin-left: 0;
            margin-right: 1rem;
            text-align: left;
        }

        tr.selected td:before {
            color: #CCC;
        }

        .table .avatar {
            width: 50px;
        }

        .cards .avatar {
            width: 100%;
            /*margin: 15px;*/
        }
        .btn-secondary:not(:disabled):not(.disabled).active, .btn-secondary:not(:disabled):not(.disabled):active, .show>.btn-secondary.dropdown-toggle {
            color: #2b2b2b;
            background-color: #e9ecef;
            border-color: #ddd;
        }
        .table.dataTable.table-sm>thead>tr>th {
            padding-right: 30px;
        }
        .test {
            position: absolute;
            right: 5px;
            top:7px;
            /*right: 6px;*/

        }
    </style>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- 页面头部 -->
    <jsp:include page="admin_navbar.jsp"/>
    <!-- 页面头部 / -->

    <!-- 页面侧边栏 -->
    <jsp:include page="admin_sidebar.jsp"/>
    <!-- 页面侧边栏 / -->

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>流程管理</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">流程管理</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">导入流程</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="bpmnForm">
                            <div class="form-group">
                                <label>流程定义名称</label>
                                <input type="text" class="form-control" placeholder="process name" id="processName"  name="processName">
                            </div>
                            <div class="form-group">
                                <label>流程BPMN文件</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file"  accept=".bpmn" class="custom-file-input" id="uploadBpmn" name="uploadBpmn">
                                        <label class="custom-file-label">resource .bpmn</label>
                                    </div>
                                    <%--                                            <div class="input-group-append">--%>
                                    <%--                                                <span class="input-group-text">上传</span>--%>
                                    <%--                                            </div>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>流程SVG文件</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" accept=".svg" class="custom-file-input" id="uploadSvg" name="uploadSvg">
                                        <label class="custom-file-label" >resource .svg</label>
                                    </div>
                                    <%--                                            <div class="input-group-append">--%>
                                    <%--                                                <span class="input-group-text">上传</span>--%>
                                    <%--                                            </div>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>流程描述</label>
                                <textarea class="form-control" rows="3" placeholder="process description" id="processDesc"  name="processDesc"></textarea>
<%--                                <input type="text" class="form-control" placeholder="process description" id="processDesc"  name="processDesc">--%>
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="uploadBpmnFile" data-dismiss="modal">上传流程</button>
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
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title" style="margin-top: 5px;">流程表单列表</h3>
                                <!-- 右侧按钮 -->
                                <div style="float: right">
                                    <td>
                                        <div class="btn-group">
                                            <a href="${pageContext.request.contextPath}/buildBPMN">
                                            <button type="button" class="btn btn-default"><i
                                                    class="fas fa-plus"></i>  创建新流程</button></a>
                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-lg"><i class="fas fa-file-import"></i>  导入流程</button>
                                        </div>
                                    </td>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <!-- 内容开始 -->
                                <table id="example" class="table cell-border compact" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>ID</th>
                                        <th>BPMN流程文件名</th>
                                        <th>BPMN流程描述</th>
                                        <th>上传日期</th>
                                        <th>上传用户ID</th>
                                        <th>流程状态</th>
                                        <th>流程UUID</th>
                                        <th>上传BPMN流程文件名</th>
                                        <th>上传SVG流程文件名</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


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
    $(document).ready(function () {

        Date.prototype.Format = function (fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份

                "d+": this.getDate(), //日

                "h+": this.getHours(), //小时

                "m+": this.getMinutes(), //分

                "s+": this.getSeconds(), //秒

                "q+": Math.floor((this.getMonth() + 3) / 3), //季度

                "S": this.getMilliseconds() //毫秒

            };
            if (/(y+)/.test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            }
            for (var k in o) {
                if (new RegExp("(" + k + ")").test(fmt)) {
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                }
            }
            return fmt;
        };

        var table = $('#example').DataTable({
            language: {
                url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Chinese.json'
            },
            'dom':
                "<'row functionBar'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'<'float-md-right ml-2'B>f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
            'ajax': {url:'${pageContext.request.contextPath}/getBPMNList',dataSrc:""},
            // Create button
            'buttons': [ 'csv', {
                'text': '<i class="fas fa-th fa-fw changeIcon" aria-hidden="true"></i>',
                'action': function (e, dt, node) {

                    $(dt.table().node()).toggleClass('cards');
                    $('.fas', node).toggleClass(['fa-align-justify', 'fa-th']);

                    dt.draw('page');
                },

                'className': 'btn  btn-default',
                'attr': {
                    'title': 'Change views',
                }
            }],
            // 'select': 'single',
            'columns': [
                {
                    'orderable': false,
                    'data': null,
                    'className': 'text-center',
                    'render': function(data, type, full, meta){
                        if (type === 'display'){
                            // data = '<i class="fa fa-user fa-fw"></i>';
                            data = '<img src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/' + encodeURIComponent(full['bpmnUUID']) + '.png" class="avatar">';
                        }

                        return data;
                    }
                },
                {
                    'data': 'id',
                    // 'class': 'text-right'

                },
                {
                    'data': 'bpmnName',
                    "orderable" : false,

                    // 'class': 'text-right'
                },
                {
                    'data': 'bpmnDesc',
                    "orderable" : false,
                    // 'class': 'text-right'
                },
                {
                    'data': 'uploadDate',
                    render: function (data, type, row, meta) {
                        if (data){   // data不为空进行转换
                            return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                        } else {
                            return data = ''; //data为空时不转换
                        }
                    }
                    // 'class': 'text-right'
                },
                {
                    'data': 'uploadUserId',
                    "orderable" : false,
                    // 'class': 'text-right'
                },
                {
                    'data': 'bpmnStatus',
                    "orderable" : false,
                    // 'class': 'text-right'
                },
                {
                    'data': 'bpmnUUID',
                    "orderable" : false,
                    // 'class': 'text-right'
                },
                {
                    'data': 'bpmnFileName',
                    "orderable" : false,
                    // 'class': 'text-right'
                },
                {
                    'data': 'svgFileName',
                    "orderable" : false,
                    // 'class': 'text-right'
                },
                {
                    "targets" : 1,//操作按钮目标列
                    "orderable" : false,
                    "data" : null,
                    "render" : function(data, type,row) {
                        // var id = '"' + row.id + '"';
                        var uuid = '"' + row.bpmnUUID + '"';
                        var html = "<div class='btn-group'>" +
                        "<button type='button' onclick='toShowBpmn("+ uuid + ")' class='btn btn-sm btn-default'><i class='fas fa-search'></i> 查看</button>" +
                            "<button type='button' class='btn btn-sm btn-default'><i class='far fa-trash-alt'></i> 删除</button>" +
                            "<button type='button' class='btn btn-sm btn-default'><i class='fas fa-edit'></i> 编辑</button>" +
                            "<button type='button' class='btn btn-sm btn-default'><i class='fas fa-check'></i> 部署</button>" +
                            "</div>"
                        return html;
                    }
                },
            ],
            'drawCallback': function (settings) {
                var api = this.api();
                var $table = $(api.table().node());

                if ($table.hasClass('cards')) {

                    // Create an array of labels containing all table headers
                    var labels = [];
                    $('thead th', $table).each(function () {
                        labels.push($(this).text());
                    });

                    // Add data-label attribute to each cell
                    $('tbody tr', $table).each(function () {
                        $(this).find('td').each(function (column) {
                            $(this).attr('data-label', labels[column]);
                        });
                    });

                    var max = 0;
                    $('tbody tr', $table).each(function () {
                        max = Math.max($(this).height(), max);
                    }).height(max);

                    $.each([1,3,7,8,9,10], function (index, value) {
                        var column = table.column(value);
                        column.visible(false);
                    });
                    var column_0 = table.column(0);
                    if(column_0.visible()===false){
                        column_0.visible(true)
                    }

                    $(".cards").find("tr").hover(function () {
                        var txt1 = "<div class='btn-group test'>" +
                            "<button type='button' class='btn btn-default'><i class='fas fa-search'></i></button>" +
                            "<button type='button' class='btn btn-default'><i class='far fa-trash-alt'></i></button>" +
                            "<button type='button' class='btn btn-default'><i class='fas fa-edit'></i></button>" +
                            "<button type='button' class='btn btn-default'><i class='fas fa-check'></i></button>" +
                            "</div>";
                        $(this).css("position", "relative");
                        $(this).css("border-color", "#999999");

                        $(this).append(txt1);
                        // alert($(this).children('td').eq(1).attr("data-label"));
                        // var column = table.column(0);
                        // column.visible(false);
                    }, function(){
                            $('.test').remove();
                            $(this).css("border-color", "#dee2e6");


                    })


                } else {
                    // Remove data-label attribute from each cell
                    $('tbody td', $table).each(function () {
                        $(this).removeAttr('data-label');
                    });

                    $('tbody tr', $table).each(function () {
                        $(this).height('auto');
                    });

                    $.each([1,2,3,4,5,6,7,8,9,10], function (index, value) {
                        var column = table.column(value);
                        column.visible(true);
                    });

                    $("#example").find("tr").unbind('mouseenter').unbind('mouseleave');

                    var column_0 = table.column(0);
                    if(column_0.visible()===true){
                        column_0.visible(false)
                    }
                }
            }
        })
            .on('select', function (e, dt, type, indexes) {
                var rowData = table.rows(indexes).data().toArray()
                $('#row-data').html(JSON.stringify(rowData));
            })
            .on('deselect', function () {
                $('#row-data').empty();
            })

        var column = table.column(0);
        column.visible( ! column.visible() );
    });

</script>

<script type="text/javascript">
    $(document).ready(function () {
        bsCustomFileInput.init();
    });
</script>

<script>
    $("#uploadBpmnFile").click(function () {
        toastr.info('正在上传新的流程文件！')
        $.ajax({
            url: "${pageContext.request.contextPath}/uploadBPMN",
            type: "POST",
            data: new FormData($("#bpmnForm")[0]),
            processData: false,//告诉ajax不要处理和编码这些数据，直接提交
            contentType: false,//不使用默认的内容类型
            dataType: 'json',
            success: function (data) {
                // alert(data.code);
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("流程文件上传出现问题！")
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("流程文件上传成功！")
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
        $("#bpmnForm")[0].reset();
    });

    function toShowBpmn(uuid) {
        var searchUrl = encodeURI("${pageContext.request.contextPath}/showBPMN?uuid=" + uuid); //使用encodeURI编码
        location.href = searchUrl;
    }
</script>


</body>
</html>
