<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="P_common_head.jsp"/>
    <!-- 页面Head信息 / -->

    <style>
        #imgReader{
            display: none;
        }

        .previewBox,.previewBoxRound{
            box-shadow: 0 0 5px #adadad;
            width: 100px;
            height: 100px;
            margin-top: 30px;
            overflow: hidden;       /*这个超出设置为隐藏很重要，否则就会整个显示出来了*/
        }
        .previewBoxRound{
            border-radius: 50%;     /*设置为圆形*/
        }


    </style>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- 页面头部 -->
    <jsp:include page="P_header.jsp"/>
    <!-- 页面头部 / -->

    <!-- 页面侧边栏 -->
    <jsp:include page="P_aside.jsp"/>
    <!-- 页面侧边栏 / -->

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>发票</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">发票</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>


        <form action="${pageContext.request.contextPath }/fileUpload.do"
              method="post" enctype="multipart/form-data">
            选择文件:<input type="file" name="uploadFile" width="120px"> <input
                type="submit" value="上传">
        </form>
        <hr>
        <form action="${pageContext.request.contextPath }/file/down.chao"
              method="get">
            <input type="submit" value="下载">
        </form>

        <!-- 1.一个用于获取上传文件的input，type="file"，并且监听onchange事件  -->
        <input type="file" accept="image/*" id="imgReader" onchange="loadImage()">

        <!-- 2.一个用于给Cropper.js覆盖使用的img  -->
<%--        <div style="width: 500px;">--%>
<%--            <img id="cropImg" alt="" src="" width="500px">--%>
<%--        </div>--%>

        <button onclick="function uploadImg() {
        toggle();
        document.querySelector('#imgReader').click();
        }
        uploadImg()">点击上传</button>
        <!-- 裁剪预览 -->
<%--         <img id="cropImg" alt="" src="">--%>

<%--        <div class="previewBox" style="width: 100px; height: 100px"></div>--%>
        <div class="previewBoxRound" style="width: 100px; height: 100px"></div>
        <!-- 3.两个用于预览的div  -->
<%--        <div class="previewText">裁剪预览</div>--%>
<%--        <div class="previewBox"></div>--%>
<%--        <div class="previewBoxRound"></div>--%>

        <button class="btn btn-primary" type="button">点击我</button>

        <!-- /*    设置头像弹窗    */ -->
        <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">头像设置</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div style="width: 100px;">
                                    <img id="cropImg" alt="" width="100px"
                                         src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/${sessionScope.uuid}">
                                </div>
                            </div>
                            <div class="col-md-4 ">
                                <!-- 裁剪预览 -->
                                <div class="previewBox" style="width: 100px; height: 100px"></div>
                                <div class="previewBoxRound" style="width: 100px; height: 100px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary">保存设置</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </div>
    <!-- 页面footer -->
    <jsp:include page="P_footer.jsp"/>
    <!-- 页面footer / -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
    </aside>
    <!-- /.control-sidebar -->
</div>

<!-- 页面js -->
<jsp:include page="P_foot_js.jsp"/>
<!-- 页面jsr / -->

<script>

    function loadImage(){
        let reader = new FileReader();
        console.log(event.target.files[0]);

        if(event.target.files[0]) {
            //readAsDataURL方法可以将File对象转化为data:URL格式的字符串（base64编码）
            let a = reader.readAsDataURL(event.target.files[0]);

            reader.onload = (e) => {
                let dataURL = reader.result;

                //将img的src改为刚上传的文件的转换格式
                document.querySelector('#cropImg').src = dataURL;

                var $image = $('#cropImg');

                //创建cropper实例-----------------------------------------
                $image.cropper({
                    aspectRatio: 16 / 16,
                    viewMode: 0,
                    minContainerWidth: 500,
                    minContainerHeight: 500,
                    dragMode: 'move',
                    preview: [document.querySelector('.previewBox')]
                })

                var cropper = $image.data('cropper');
            }
        }
    }

    function toggle() {
        $("#modal-lg").modal("toggle");
    }

</script>
</body>
</html>
