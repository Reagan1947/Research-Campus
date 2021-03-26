<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="admin_head.jsp"/>
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
                        <h1>流程创建</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">流程创建</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

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
                                <%--                                    <li>--%>
                                <%--                                        <a id="js-clear-svg" href title="清空画布">--%>
                                <%--                                            清空画布--%>
                                <%--                                        </a>--%>
                                <%--                                    </li>--%>
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
</script>

<script src="${pageContext.request.contextPath}/custom/js/app.js"></script>

</body>
</html>
