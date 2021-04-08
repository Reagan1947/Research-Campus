<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="admin_head.jsp"/>
    <title>创建流程</title>

    <!-- 页面Head信息 / -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/custom/css/diagram-js.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bpmn-font/css/bpmn-embedded.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/custom/css/app.css"/>
    <style>
        .buttons {
            position: absolute;
        }

        #js-properties-panel::-webkit-scrollbar {
            display: none
        }

        .buttons > li > a {
            background: #fafafa;
            border: solid 1px #cccccc;
            display: inline-block;
            padding: 5px;
            color: #444444;
        }

        .djs-palette .entry:before {
            text-align: center;
            vertical-align: middle;
            display: inline-block;
            /* margin: auto; */
            padding: 8px 0 8px 0;
        }

        .bpp-properties-group > .group-label {
            font-style: unset;
        }

        ul.bpp-properties-tabs-links > li.bpp-active a {
            border-top: 2px solid #007bff;
        }

        .bjs-powered-by {
            display: none;
        }
        .bpp-radios-group input, .bpp-checkbox input {
            margin-left: 0;
            margin-bottom: -3px;
            margin-right: 3px;
        }
        .os-padding {
            z-index: auto !important;
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
                        <h1>创建流程
                            <span style="margin-left: 5px; display: inline-block; text-decoration:underline; font-size: 15px;"><a href="${pageContext.request.contextPath}/bpmnList">← 返回流程列表</a></span>
                        </h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">创建流程</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div id="base_url" style="display: none">
            https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/
        </div>

        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">保存流程至系统</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="clearForm()">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="bpmnForm">
                            <div class="form-group">
                                <label>流程名称</label>
                                <input type="text" class="form-control" placeholder="process name" id="processName"  name="processName">
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
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearForm()">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="saveToSystem()" id="uploadBpmnFile" data-dismiss="modal">保存</button>
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
                        <div class="card card-primary card-outline" style="height: 800px; font-size: 13px">
                            <%--                            <div class="card-header">--%>
                            <%--                                <h3 class="card-title">--%>
                            <%--                                    <i class="fas fa-edit"></i>--%>
                            <%--                                    弹框示例--%>
                            <%--                                </h3>--%>
                            <%--                            </div>--%>

                            <div class="content with-diagram" id="js-drop-zone">

                                <div class="message intro">
                                    <div class="note">
                                        拖拽 BPMN Diagram 到此处或者 <a id="js-create-diagram" href>创建一个新的BPMN Diagram</a> 开始.
                                    </div>
                                </div>

                                <div class="message error">
                                    <div class="note">
                                        <p>Ooops, we could not display the BPMN 2.0 diagram.</p>

                                        <div class="details">
                                            <span>Import Error Details</span>
                                            <pre></pre>
                                        </div>
                                    </div>
                                </div>
                                <div class="canvas" id="js-canvas"></div>
                                <div class="properties-panel-parent" id="js-properties-panel"
                                     style="width: 350px"></div>

                            </div>

                            <ul class="buttons">
                                <%--                                    <li>--%>
                                <%--                                        download--%>
                                <%--                                    </li>--%>
                                <li>
                                    <a id="js-download-diagram" href title="download BPMN diagram">
                                        <i class="fas fa-file-export"></i> 导出 BPMN Diagram
                                    </a>
                                </li>
                                <li>
                                    <a id="js-download-svg" href title="download as SVG image">
                                        <i class="fas fa-download"></i> 下载 SVG Image 图像
                                    </a>
                                </li>
                                <li>
                                    <a id="js-save-system" data-toggle="modal" data-target="#modal-lg" href="javascript:void(0);" title="保存文件">
                                        <i class="fas fa-save"></i>  保存流程至系统
                                    </a>
                                </li>
                                <span style="color: #d7d7d7;"> Powered by bpmn.io.</span>
                            </ul>

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
    $(function () {
        //The passed argument has to be at least a empty object or a object with your desired options
        $("body").overlayScrollbars({});
    });

    function saveToSystem(){
        var svg_href = $('#js-download-svg').attr('href');
        var bpmn_href = $('#js-download-diagram').attr('href');
        var bpmnName = $(" input[ name='processName' ] ").val();
        var bpmnDesc = $('#processDesc').val();

        var json_data = {svg_data:decodeURIComponent(svg_href), bpmn_data:decodeURIComponent(bpmn_href), bpmn_name:bpmnName, bpmn_desc:bpmnDesc}

        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url:"${pageContext.request.contextPath}/saveBPMNEdit",
            //发送方式为GET，也可为POST，需要与后台对应
            type:'POST',
            data:JSON.stringify(json_data),
            dataType:'json',
            contentType:"application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("流程保存失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    toastr.success("流程保存成功！")
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
</script>

<script src="${pageContext.request.contextPath}/custom/js/app.js"></script>

<script>
    function clearForm(){
        $('#bpmnForm').get(0).reset();
    }
</script>
</body>
</html>
