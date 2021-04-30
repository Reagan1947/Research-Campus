<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>公告编辑</title>

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
                        <h1>
                            公告编辑
                            <span style="margin-left: 5px; display: inline-block; text-decoration:underline; font-size: 15px;">
                                    <a href="${pageContext.request.contextPath}/businessEntity?businessEntityUuid=${businessEntity.businessEntityUuid}">← 返回${businessEntity.businessEntityName}</a></span>
                        </h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">
                                公告编辑
                            </li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid" id="app">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">${businessEntity.businessEntityName}公告编辑</h3>
                            </div>
                            <form role="form">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="declarationName">公告名称</label>
                                        <input type="text" class="form-control" id="declarationName"
                                               placeholder="Declaration Name"
                                               v-model="declarationData.declarationName">
                                    </div>
                                    <div class="form-group">
                                        <label>公告概览</label>
                                        <textarea class="form-control" rows="3" placeholder="Declaration Overview"
                                                  id="declarationOverview"
                                                  v-model="declarationData.declarationOverview"
                                                  name="declarationOverview"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>公告信息</label>
                                        <textarea class="form-control" rows="5" placeholder="Declaration Announcement"
                                                  id="declarationAnnouncement"
                                                  v-model="declarationData.declarationAnnouncement"
                                                  name="declarationAnnouncement"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>内容详细</label>
                                        <div id="summernote"></div>
                                    </div>
                                </div>
                            </form>

                            <div class="card-footer">
                                <button class="btn btn-primary" @click="saveDeclarationInf">保存公告信息</button>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    {{ declarationData.declarationName }}
                                </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body" v-html="declarationData.declarationAnnouncement">
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button class="btn btn-primary">详细信息</button>
                                <button class="btn btn-default float-right">
                                    立即申报
                                </button>
                            </div>
                            <!-- /.card -->
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

<!-- include summernote css/js-->
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    var out_data = {
        declarationData: {
            id: -1,
            declarationName: "公告名称",
            projectBodyInformationUrl: "",
            declarationAnnouncement: "公告信息",
            declarationOverview: "公告概览",
            declarationUuid: "",
        },
        declarationPage: "",
    }
    $(function () {
        $('#summernote').summernote();

        var json_data = {proBusUuid: '${proBusUuid.toString()}'};
        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url: "${pageContext.request.contextPath}/getDeclaration",
            //发送方式为GET，也可为POST，需要与后台对应
            type: 'POST',
            data: JSON.stringify(json_data),
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                } else if (data.code === 200) {
                    console.log(data);
                    if(data.hasOwnProperty("declaration")) {
                        out_data.declarationData = data.declaration;
                        getDeclarationPage();
                    }
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    })

    Vue.prototype.$http = axios;
    vm = new Vue({
        el: "#app",
        data: out_data,
        methods: {
            saveDeclarationInf: function () {
                let config = {
                    headers: {
                        'Content-Type': 'application/json;character:utf-8',
                    }
                }
                out_data.declarationPage =  $('#summernote').summernote('code');
                var saveData = out_data.declarationData;
                saveData["declarationPage"] = out_data.declarationPage;
                saveData["proBusUuid"] = '${proBusUuid.toString()}';
                this.$http.post('${pageContext.request.contextPath}/applyDeclaration', JSON.stringify(saveData), config).then(function (res) {
                    if (res.status === 200) {
                        // declaration = res.data.declaration;
                        toastr.success("公告信息保存成功！")
                    }
                    if (res.status === 400) {
                        toastr.error("公告信息保存失败！")
                    }
                })

            }
        }
    })

    function getDeclarationPage(){
        $.ajax({
            type: 'get',
            url: 'https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/declarationDetail/' + out_data.declarationData.projectBodyInformationUrl + ".html",
            async: false, //同步传输，并添加返回值，返回值应为已定义的全局变量 如a
            success: function (data) {//返回json结果
                out_data.declarationPage = data;
                $('#summernote').summernote('code', out_data.declarationPage);
            }
        });
    }

</script>
</body>
</html>
