<%@ page import="com.research_campus.service.IUserInfService" %>
<%@ page import="com.research_campus.domain.BpmnList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>查看流程</title>

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
                        <h1>查看流程</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">查看流程</li>
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
                            <span class="upper">${bpmnList.bpmnName} - ${bpmnList.bpmnUUID}</span>
                        </h3>
                        <!-- 右侧按钮 -->
                        <div style="float: right">
                            <td>
                                <div class="btn-group">
                                    <a href="${pageContext.request.contextPath}/bpmnList">
                                        <button type="button" class="btn btn-default"><i
                                                class="fas fa-chevron-left"></i> 返回
                                        </button>
                                    </a>
                                </div>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-lg" onclick=""><i class="fas fa-cogs"></i> 属性设置
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="deleteBpmn('${bpmnList.bpmnUUID}')"><i class="fas fa-trash-alt"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="downloadBPMN()"><i class="fas fa-download"></i> 下载BPMN
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reviewBpmn('${bpmnList.bpmnUUID}')"><i class="fas fa-edit"></i> 编辑
                                    </button>
                                    <button type="button" class="btn btn-default"><i class="fas fa-check"></i> 发布
                                    </button>
                                </div>
                            </td>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <!-- 查询按钮组 -->

                        <div class="message_sm">
                            <span><i class="far fa-clock fa-fw"></i> ${bpmnList.uploadDate}</span>
                            <span style="margin-left: 10px; font-size: 14px;"><i class="far fa-bookmark fa-fw"></i>
                            <c:if test="${bpmnList.bpmnDesc != null}">
                                <span>${bpmnList.bpmnDesc}</span>
                            </c:if>
                            <c:if test="${bpmnList.bpmnDesc == null}">
                                <span>当前流程尚未添加流程描述，可在属性设置中添加。</span>
                            </c:if>
                            </span>
                        </div>

<%--                        <div style="width: 100%; height: 100%; text-align: center; vertical-align:middle;">--%>
<%--                            <div style="vertical-align: middle; display: table-cell;">--%>
<%--                                <img src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/${bpmnList.bpmnUUID}.svg">--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="image_container">
                            <span class="i_center"><img src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/${bpmnList.bpmnUUID}.svg"/></span>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

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
        $('#bpmnDesc').val('${bpmnList.bpmnDesc}');
    })
    function deleteBpmn(uuid) {
        var json_data = {bpmnUuid:uuid}
        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url:"${pageContext.request.contextPath}/deleteBPMN",
            //发送方式为GET，也可为POST，需要与后台对应
            type:'POST',
            data:JSON.stringify(json_data),
            dataType:'json',
            contentType:"application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("BPMN流程删除失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    // $('#image-uploading').fadeOut("slow");
                    // toastr.success("BPMN流程删除成功！")
                    window.location.href="${pageContext.request.contextPath}/bpmnList";
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    function reviewBpmn(uuid) {
         //使用encodeURI编码
        location.href = encodeURI("${pageContext.request.contextPath}/reviewBPMN?uuid=" + uuid);
    }
    function downloadBPMN() {
        window.location.href="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/${bpmnList.bpmnUUID}.bpmn";
    }
    function setDefault(){
        $('#bpmnName').val('${bpmnList.bpmnName}');
        $('#bpmnFileName').val('${bpmnList.bpmnFileName}');
        $('#svgFileName').val('${bpmnList.svgFileName}');
        $('#bpmnDesc').val('${bpmnList.bpmnDesc}');
    }

    function changeBPMNInf(uuid){
        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url:"${pageContext.request.contextPath}/changeBPMNInf",
            //发送方式为GET，也可为POST，需要与后台对应
            type:'POST',
            data: new FormData($("#bpmnForm")[0]),
            processData: false,//告诉ajax不要处理和编码这些数据，直接提交
            contentType: false,//不使用默认的内容类型
            dataType:'json',
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("流程属性更改失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    toastr.success("流程属性更改成功！")
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
