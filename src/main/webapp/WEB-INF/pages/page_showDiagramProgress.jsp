<%@ page import="com.research_campus.service.IUserInfService" %>
<%@ page import="com.research_campus.domain.BpmnList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>查看流程进度</title>

    <style>
        .upper {
            text-transform: uppercase;
        }
        .i_center {
            vertical-align: middle;
            text-align: center;
            display: table-cell;
        }
        .image_container {
            width: 100%;
            height: 100%;
            text-align: center;
            display: table;
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
                        <h1>查看流程进度</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">查看流程进度</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">更改流程属性</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="setDefault()">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 内容开始 -->
                        <form id="bpmnForm">
                            <div class="form-group">
                                <label>流程名称</label>
                                <input type="text" class="form-control" placeholder="BPMN Name" id="bpmnName"  name="bpmnName" value="${bpmnList.bpmnName}">
                            </div>
                            <div class="form-group">
                                <label>流程UUID</label>
                                <input type="text" class="form-control" placeholder="BPMN UUID" id="bpmnUuid"  name="bpmnUuid" value="${bpmnList.bpmnUUID}">
                            </div>
                            <div class="form-group">
                                <label>流程文件名</label>
                                <input type="text" class="form-control" placeholder="BPMN File Name" id="bpmnFileName"  name="bpmnFileName" value="${bpmnList.bpmnFileName}">
                            </div>
                            <div class="form-group">
                                <label>SVG文件名</label>
                                <input type="text" class="form-control" placeholder="Svg File Name" id="svgFileName"  name="svgFileName" value="${bpmnList.svgFileName}">
                            </div>
                            <div class="form-group">
                                <label>流程描述</label>
                                <textarea class="form-control" rows="3" placeholder="Bpmn Description" id="bpmnDesc"  name="bpmnDesc"></textarea>
                            </div>
                        </form>
                        <!-- 内容结束 -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="setDefault()">关闭</button>
                        <button type="button" class="btn btn-primary" id="alterBpmnInf" onclick="changeBPMNInf('${bpmnList.bpmnUUID}')" data-dismiss="modal">更改流程属性</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">

                    </div>
                </div>

                <div class="card card-primary card-outline" style="height: 90%">
                    <div class="card-header">
                        <h3 class="card-title" style="margin-top: 5px;"><span class="upper"
                                                                              style="font-weight: bold; color: #2980bb;">BPMN</span>
                            <span style="font-size: 20px;position: relative;bottom: 1px;">|</span>
                            <span class="upper">${projectEntity.projectEntityName} - ${businessEntity.businessEntityName}</span>
                        </h3>
                        <!-- 右侧按钮 -->
                        <div style="float: right">
                            <td>
                                <div class="btn-group">
                                    <a href="${pageContext.request.contextPath}/myResearchProject">
                                        <button type="button" class="btn btn-default"><i
                                                class="fas fa-chevron-left"></i> 返回
                                        </button>
                                    </a>
                                </div>
                            </td>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <!-- 查询按钮组 -->

                        <div class="message_sm">
                            <span><i class="far fa-clock fa-fw"></i> ${processInstanceStartTime}</span>
                            <span style="margin-left: 10px; font-size: 14px;"><i class="far fa-bookmark fa-fw"></i>
                                <span>${projectEntity.projectEntityDesc}</span>
                            </span>
                        </div>

                        <%--                        <div style="width: 100%; height: 100%; text-align: center; vertical-align:middle;">--%>
                        <%--                            <div style="vertical-align: middle; display: table-cell;">--%>
                        <%--                                <img src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/${bpmnList.bpmnUUID}.svg">--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>


                        <div class="image_container">
                            <span class="i_center"><img src="${pageContext.request.contextPath}/diagramProgress?queryProPlan&ProcessInstanceId=${processInstanceId}" style="position: relative; top: -100px; left: -140px;"/></span>
                        </div>

                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
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
        var searchUrl = window.location.href;
        var searchData = searchUrl.split("="); //截取 url中的“=”,获得“=”后面的参数
        var uuid = decodeURI(searchData[1]); //decodeURI解码
        console.log('UUID: ' + uuid);
        // text area 添加默认值
    })
</script>
</body>
</html>
