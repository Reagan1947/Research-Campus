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
                        <h1>公告编辑</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">公告编辑</li>
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
                                               v-model="declarationDetail.declarationName">
                                    </div>
                                    <div class="form-group">
                                        <label>公告概览</label>
                                        <textarea class="form-control" rows="3" placeholder="Declaration Overview"
                                                  id="declarationOverview"
                                                  v-model="declarationDetail.declarationOverview"
                                                  name="declarationOverview"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>公告正文</label>
                                        <textarea class="form-control" rows="5" placeholder="Declaration Announcement"
                                                  id="declarationAnnouncement"
                                                  v-model="declarationDetail.declarationAnnouncement"
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
                                    {{ declarationDetail.declarationName }}
                                </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body" v-html="declarationDetail.declarationAnnouncement">
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
    var vue_data = {
        declarationDetail: {
            declarationAnnouncement: "请输入公告正文...",
            declarationName: "请输入公告名称...",
            declarationOverview: "请输入公告概览...",
        },
        declarationDetailHtml: '',
    };

    $(document).ready(function () {
        $('#summernote').summernote();

        // 初始化DeclarationDetail 数据
        vue_data.declarationDetail["projectEntityUuid"] = '${projectEntity.projectEntityUuid}'
        vue_data.declarationDetail["businessEntityUuid"] = '${businessEntity.businessEntityUuid}'
        vue_data.declarationDetail["processDefineId"] = '${processDefineId}'

        var json_data = {
            projectEntityUuid: '${projectEntity.projectEntityUuid}',
            businessEntityUuid: '${businessEntity.businessEntityUuid}'
        }
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/getDeclarationDetail',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            async: false, //同步传输，并添加返回值，返回值应为已定义的全局变量 如a
            data: JSON.stringify(json_data),
            success: function (data) {//返回json结果
                if (data.hasOwnProperty("declaration")) {
                    vue_data.declarationDetail = data.declaration;
                }
            }
        });

        if (vue_data.declarationDetail.hasOwnProperty("projectBodyInformationUrl")) {
            $.ajax({
                type: 'get',
                url: 'https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com' + vue_data.declarationDetail.projectBodyInformationUrl,
                async: false, //同步传输，并添加返回值，返回值应为已定义的全局变量 如a
                success: function (data) {//返回json结果
                    vue_data.declarationDetailHtml = data;
                }
            });
        }

        $('#summernote').summernote('code', vue_data.declarationDetailHtml)
    });

    Vue.prototype.$http = axios;
    var app = new Vue({
        el: '#app',
        data: vue_data,
        methods: {
            changeDynamicFormInf: function (event) {
                event.preventDefault();

                let config = {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }
                this.$http.post('${pageContext.request.contextPath}/applyDynamicFormInfChange', vue_data.dynamicFormInf, config).then(function (res) {
                    if (res.status === 200) {
                        toastr.success("表单信息更改成功！");
                    } else if (res.status === 400) {
                        toastr.error("表单信息更改失败！");
                    }
                })
            },
            saveDeclarationInf: function (event) {
                var controllerTag = 1;
                var declarationDetailUrl = vue_data.declarationDetail.projectBodyInformationUrl;
                var declarationBodyInf = {
                    declarationDetailUrl: declarationDetailUrl,
                    declarationDetailHtml: vue_data.declarationDetailHtml
                }

                event.preventDefault();
                let config = {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }
                // 保存基础信息
                this.$http.post('${pageContext.request.contextPath}/applyDeclarationDetail', vue_data.declarationDetail, config).then(function (res) {
                    if (res.status === 400) {
                        controllerTag = 0;
                    }
                })
                // 保存内容详细
                this.$http.post('${pageContext.request.contextPath}/applyDeclarationDetailHtml', declarationBodyInf, config).then(function (res) {
                    if (res.status === 400) {
                        controllerTag = 0;
                    }
                })
                // 判断是否上传成功
            }
        }
    });
</script>
</body>
</html>
