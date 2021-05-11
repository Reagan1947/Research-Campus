<%--
  Created by IntelliJ IDEA.
  User: buwan
  Date: 2021/3/12
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="admin_head.jsp"/>
    <!-- 页面Head信息 / -->
    <title>个人与活动</title>

    <style>
        #profile-photo-fade {
            background-color: #343a404a;
            width: 88px;
            height: 88px;
            top: -94px;
            left: 6px;
            position: relative;
            border-radius: 50%;
            opacity: 0;
            transition: opacity 0.3s;

        }

        #image-div:hover #profile-photo-fade {
            /*transition-duration: 1s;*/
            opacity: 1;
            transition: opacity 0.3s;

        }

        #profile-photo-change-icon {
            position: relative;
            top: 42%;
            color: #444444e8;
        }

        #image-div {
            width: 100px;
            height: 100px;
            margin: auto;
            overflow: hidden;
            border-radius: 50%; /*设置为圆形*/
        }

        .os-padding {
            z-index: auto !important;
        }

        #imgReader {
            display: none;
        }

        .previewBox, .previewBoxRound {
            box-shadow: 0 0 5px #adadad;
            width: 130px;
            height: 130px;
            margin: 0 auto 60px auto;
            /*margin-top: 30px;*/
            overflow: hidden; /*这个超出设置为隐藏很重要，否则就会整个显示出来了*/
        }

        .previewBoxRound {
            border-radius: 50%; /*设置为圆形*/
        }

        .link-black:focus, .link-black:hover {
            color: #1672ce!important;
        }

    </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

<!-- 头像弹窗 -->
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
                        <div>
                            <img id="image" alt="" width="100px"
                                 src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/${sessionScope.uuid}">


                            <label class="btn btn-primary btn-upload" style="margin-top: 10px;" for="inputImage"
                                   title="Upload image file">
                                <input type="file" class="sr-only" id="inputImage" name="file"
                                       accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                                <span class="docs-tooltip" data-toggle="tooltip" title="Import image with Blob URLs">
                                    <span class="fa fa-images"><span
                                            style="font-weight: normal;"> 选择您的头像图像文件</span></span>
                                </span>
                            </label>

                            <%--                            <label class="btn btn-primary btn-upload" style="margin-top: 10px; width: auto;"--%>
                            <%--                                   id="uploadImage"--%>
                            <%--                                   title="Upload image file">--%>
                            <%--                                <span class="docs-tooltip" data-toggle="tooltip" title="Import image with Blob URLs">--%>
                            <%--                                    <span class="fa fa-upload">--%>
                            <%--                                        <span style="font-weight: normal;"> 上传头像</span></span>--%>
                            <%--                                </span>--%>
                            <%--                                <div class="valid-tooltip">--%>
                            <%--                                    Looks good!--%>
                            <%--                                </div>--%>
                            <%--                            </label>--%>

                            <div class="spinner-border spinner-border-sm text-primary" role="status" style="position:
                            relative; top: 2px;display: none" id="image-uploading">
                                <span class="sr-only">Loading...</span>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-3"
                         style="text-align: center; background-color: #f2f2f5; margin: 0 10px 46px 50px;">
                        <!-- 裁剪预览 -->
                        <h5 style="margin: 20px">预览</h5>
                        <div class="previewBox"></div>
                        <div style="position: relative;top: -50px;">100 × 100 Px</div>
                        <div class="previewBoxRound" style="width: 150px; height: 150px"></div>
                        <div style="position: relative;top: -50px;">100 × 100 Px</div>
                    </div>


                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="uploadImage" data-dismiss="modal">保存设置</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /. 头像弹窗 -->

<div class="wrapper" style="background-color: #f4f6f9;">
    <!-- 页面头部 -->
    <jsp:include page="admin_navbar.jsp"/>

    <!-- 页面侧边栏 -->
    <jsp:include page="admin_sidebar.jsp"/>

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper" style="min-height: inherit!important;">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>个人资料与活动</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">个人资料与活动</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image 头像 -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <div id="image-div">
                                        <img class="profile-user-img img-fluid img-circle userIcon"
                                             src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/${sessionScope.uuid}"
                                             alt="User profile picture">

                                        <div id="profile-photo-fade"><a data-target="#modal-lg" data-toggle="modal"
                                                                        href="">
                                            <i class="fas fa-camera fa-lg" id="profile-photo-change-icon"></i></a>
                                        </div>

                                    </div>
                                </div>
                                <!-- / * Profile Image 头像 -->


                                <h3 class="profile-username text-center">
                                    ${sessionScope.username} &nbsp; ${userInfo.chineseName}
                                </h3>
                                <p class="text-muted text-center">
                                    <span>${userInfo.competent.competentDesc}</span>
                                </p>
                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>关注</b> <a class="float-right">1,322</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>粉丝</b> <a class="float-right">543</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>好友</b> <a class="float-right">13,287</a>
                                    </li>
                                </ul>

                                <a href="#" class="btn btn-primary btn-block disabled"><b>关注</b></a>
                            </div>
                        </div>

                        <!-- 关于我 Box -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">关于我</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <strong><i class="fas fa-building mr-1"></i> 所属二级部门</strong>
                                <c:forEach items="${userInfo.subject}" var="subject">
                                    <p class="text-muted">${subject.subjectDesc}</p>
                                </c:forEach>

                                <hr>

                                <strong><i class="fas fa-id-card-alt mr-1"></i> 所属角色</strong>
                                <p class="text-muted">
                                    <c:forEach items="${userInfo.roles }" var="role">
                                        <span class="badge badge-info bg-gray">${role.roleDesc}</span>
                                    </c:forEach>
                                </p>
                                <hr>

                                <strong><i class="fas fa-quote-right mr-1"></i> 说明</strong>
                                <p class="text-muted">
                                <td>${userInfo.explanatory }</td>
                                </p>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9" id="app">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#activity"
                                                            data-toggle="tab">活动</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">时间线</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">设置</a>
                                    </li>
                                </ul>
                            </div><!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="active tab-pane" id="activity">

                                        <div class="post">
                                            <div class="form-group">
                                                <label>科研动态</label>
                                                <textarea class="form-control" rows="2" placeholder="科研动态信息 ..."
                                                          id="publishText" @focus="expandTextarea()" @blur="closeTextarea()"></textarea>
                                            </div>
                                            <div class="row" style="height: 36px;">
                                                <div class="col-md-2">
                                                    <button type="submit" class="btn btn-default"
                                                            @mousedown="publishDataFunction($event)">发布动态
                                                    </button>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <select class="form-control" id="publishAccess">
                                                            <option value="1">所有人可见</option>
                                                            <option value="2">仅好友可见</option>
                                                            <option value="3">仅自己可见</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <component-post
                                                v-for="publishdata in publishData"
                                                v-bind:key="publishdata.id"
                                                v-bind:publishdata="publishdata"
                                                v-bind:cosinf="cosInf"
                                        ></component-post>


                                    </div>
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="timeline">
                                        <!-- The timeline -->
                                        <div class="timeline timeline-inverse">
                                            <!-- timeline time label -->
                                            <div class="time-label">
                        <span class="bg-danger">
                          2014年2月10日
                        </span>
                                            </div>
                                            <!-- /.timeline-label -->
                                            <!-- timeline item -->
                                            <div>
                                                <i class="fas fa-envelope bg-primary"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="far fa-clock"></i> 12:05</span>

                                                    <h3 class="timeline-header"><a href="#">支持团队</a> 给你发了一封邮件</h3>

                                                    <div class="timeline-body">
                                                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                                        weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                                        jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo
                                                        kaboodle
                                                        quora plaxo ideeli hulu weebly balihoo...
                                                    </div>
                                                    <div class="timeline-footer">
                                                        <a href="#" class="btn btn-primary btn-sm">阅读更多</a>
                                                        <a href="#" class="btn btn-danger btn-sm">删除</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <i class="fas fa-user bg-info"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="far fa-clock"></i> 5 分钟前</span>

                                                    <h3 class="timeline-header border-0"><a href="#">Sarah Young</a>
                                                        接受了你的朋友请求
                                                    </h3>
                                                </div>
                                            </div>

                                            <div>
                                                <i class="fas fa-comments bg-warning"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="far fa-clock"></i> 27 分钟前</span>

                                                    <h3 class="timeline-header"><a href="#">Jay White</a> 评论了你</h3>

                                                    <div class="timeline-body">
                                                        Take me to your leader!
                                                        Switzerland is small and neutral!
                                                        We are more like Germany, ambitious and misunderstood!
                                                    </div>
                                                    <div class="timeline-footer">
                                                        <a href="#" class="btn btn-warning btn-flat btn-sm">查看评论</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="time-label">
                        <span class="bg-success">
                          2014年1月3日
                        </span>
                                            </div>
                                            <!-- /.timeline-label -->
                                            <!-- timeline item -->
                                            <div>
                                                <i class="fas fa-camera bg-purple"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="far fa-clock"></i> 2 天前</span>

                                                    <h3 class="timeline-header"><a href="#">Mina Lee</a> 上传了新照片</h3>

                                                    <div class="timeline-body">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END timeline item -->
                                            <div>
                                                <i class="far fa-clock bg-gray"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.tab-pane -->

                                    <div class="tab-pane" id="settings">
                                        <form class="form-horizontal">
                                            <div class="form-group row">
                                                <label for="inputName" class="col-sm-2 col-form-label">名字</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputName"
                                                           placeholder="名字">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputEmail" class="col-sm-2 col-form-label">邮箱</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputEmail"
                                                           placeholder="邮箱">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputName2" class="col-sm-2 col-form-label">名字</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="inputName2"
                                                           placeholder="名字">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputExperience" class="col-sm-2 col-form-label">经验</label>
                                                <div class="col-sm-10">
                                                    <textarea class="form-control" id="inputExperience"
                                                              placeholder="经验"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputSkills" class="col-sm-2 col-form-label">技能</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="inputSkills"
                                                           placeholder="技能">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="offset-sm-2 col-sm-10">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox"> 我同意<a href="#">条款和条件</a>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="offset-sm-2 col-sm-10">
                                                    <button type="submit" class="btn btn-danger">提交</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->

</div>

<!-- 页面footer -->
<jsp:include page="admin_footer.jsp"/>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- 控制侧边栏内容在这里 -->
</aside>
<!-- /.control-sidebar -->
</div>

<!-- 页面js -->
<jsp:include page="admin_foot.jsp"/>
<!-- 页面jsr / -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
    window.addEventListener('DOMContentLoaded', function () {
        var image = document.getElementById('image');
        var inputImage = document.getElementById('inputImage');
        var URL = window.URL || window.webkitURL;
        var originalImageSrc = image.src;
        var uploadedImageType = 'image/jpeg';
        var uploadedImageURL;
        var cropBoxData;
        var canvasData;
        var cropper;
        var options;

        options = {
            autoCropArea: 0.5,
            aspectRatio: 16 / 16,
            viewMode: 2,
            movable: false,
            scalable: false,
            minContainerWidth: 530,
            minContainerHeight: 530,
            minCropBoxWidth: 150,
            minCropBoxHeight: 150,
            checkCrossOrigin: true,
            dragMode: 'move',
            preview: [document.querySelector('.previewBox'), document.querySelector('.previewBoxRound')],
            ready: function () {
                //Should set crop box data first here
                cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
            }
        }

        $('#modal-lg').on('shown.bs.modal', function () {
            cropper = new Cropper(image, options);
        }).on('hidden.bs.modal', function () {
            // alert(originalImageSrc);
            image.src = originalImageSrc;
            // $('.userIcon').attr('src',originalImageSrc + '?' +Math.random())
            console.log(originalImageSrc)
            cropBoxData = cropper.getCropBoxData();
            canvasData = cropper.getCanvasData();
            cropper.destroy();
        });


        if (URL) {
            inputImage.onchange = function () {
                var files = this.files;
                var file;

                if (cropper && files && files.length) {
                    file = files[0];

                    if (/^image\/\w+/.test(file.type)) {
                        uploadedImageType = file.type;

                        if (uploadedImageURL) {
                            URL.revokeObjectURL(uploadedImageURL);
                        }

                        image.src = uploadedImageURL = URL.createObjectURL(file);
                        cropper.destroy();
                        cropper = new Cropper(image, options);
                        inputImage.value = null;
                    } else {
                        window.alert('Please choose an image file.');
                    }
                }
            };
        } else {
            inputImage.disabled = true;
            inputImage.parentNode.className += ' disabled';
        }

        $("#uploadImage").click(function () {
            // $('#image-uploading').css('display', 'inline-block');
            toastr.info('正在上传用户头像！')

            // alert('test')
            //getCroppedCanvas方法可以将裁剪区域的数据转换成canvas数据
            var croppedCanvasData = cropper.getCroppedCanvas({
                maxWidth: 4096,
                maxHeight: 4096,
                fillColor: '#fff',
                imageSmoothingEnabled: true,
                imageSmoothingQuality: 'high',
            })
            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: '${pageContext.request.contextPath}/fileUpload.do',
                datatype: "json",

                data: JSON.stringify({
                    base64Img: croppedCanvasData.toDataURL()
                }),
                processData: false,
                success: function (data) {
                    if (data.code === 400) {
                        console.log(data);
                        toastr.error("用户头像上传失败，请重试！")
                    } else if (data.code === 200) {
                        console.log(data);
                        // $('#image-uploading').fadeOut("slow");
                        toastr.success("用户头像上传成功！")
                    }
                }
            })
        })
    })

    // $('#publishText').focus(function () {
    //     $('#publishText').attr("rows", 4)
    // });
    //
    // $('#publishText').blur(function () {
    //     $('#publishText').attr("rows", 2)
    // });

    var ComponentReplySecond = {
        props: {
            publishdata: Object,
            cosinf: Object,
            publishReply: Object,
        },
        template: `
            <div class="card-comment">
            <img class="img-circle img-sm"
                :src="'https://' + cosinf.bucketName + '.cos.' + cosinf.region +'.myqcloud.com/' + publishReply.fromUuid"
                alt="用户头像" style="height: 1.2rem; width: 1.2rem;">
            <div class="comment-text" style="margin-left: 28px;">
                <span class="username" style="line-height: initial;">
                    {{ publishReply.fromUserInfo.userName }}

                    <div class="float-right btn-tool" style="position: relative; right: -20px;">
                        <button class="btn btn-link" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            ...
                        </button>
                        <div class="dropdown-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="javascript:void(0)" @click="makeReply">回复此人</a>
                            <a class="dropdown-item" href="#">收藏动态</a>
                            <a class="dropdown-item" href="#">投诉或对此有疑问</a>
                        </div>
                    </div>
                </span>
                <span>{{ childCoverTimeStamp(publishReply.replyDate) }}</span><br>
                <div style="margin-top: 5px;">
                    回复@<a href="javascript:void(0)">{{ publishReply.toUserInfo.userName }}</a>：{{ publishReply.content }}
                </div>
            </div>
            <component-reply-second v-for="publishReply in publishReply.publishReplyList" v-bind:key="publishReply.id"
                    v-bind:publishReply="publishReply" v-bind:publishdata="publishdata" v-bind:cosinf="cosinf">
                </component-reply-second>
        </div>`,
        name: 'component-reply-second',
        created() {
            this.updateCount();
        },
        methods: {
            childCoverTimeStamp: function(timeStamp) {
                return this.$parent.childCoverTimeStamp(timeStamp);
            },
            updateCount: function() {
                this.$parent.updateCount();
            },
            setReplyDefault: function(replyDefault) {
                this.$parent.setReplyDefault(replyDefault);
            },
            makeReply: function() {
                var replyObject =  {
                        type: "reply", // comment or reply
                        content: "",
                        fromUuid: "",
                        toUuid: this.publishReply.fromUuid,
                        replyType: "forReply",
                        aimId: this.publishReply.id,
                        toUserName: this.publishReply.fromUserInfo.userName,
                        originalContent: this.publishReply.content,
                        display: "display: block;",
                        placeholderString: "回复@" + this.publishReply.fromUserInfo.userName,
                };
                console.log(this);
                this.setReplyDefault(replyObject);
            },
        },
    }

    var ComponentReply = {
        props: {
            publishdata: Object,
            cosinf: Object,
            publishReply: Object,
        },
        template: `
        <div class="card-footer card-comments" style="padding: 10px 0 0 5px;!important;">
            <div class="card-comment">
                <img class="img-circle img-sm"
                    :src="'https://' + cosinf.bucketName + '.cos.' + cosinf.region +'.myqcloud.com/' + publishReply.fromUuid"
                    alt="用户头像" style="height: 1.2rem; width: 1.2rem;">
                <div class="comment-text" style="margin-left: 28px;">
                    <span class="username" style="line-height: initial;">
                        {{ publishReply.fromUserInfo.userName }}
                        <div class="float-right btn-tool" style="position: relative; right: -20px;">
                            <button class="btn btn-link" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                ...
                            </button>
                            <div class="dropdown-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="javascript:void(0)" @click="makeReply">回复此人</a>
                                <a class="dropdown-item" href="#">收藏动态</a>
                                <a class="dropdown-item" href="#">投诉或对此有疑问</a>
                            </div>
                        </div>
                    </span>
                    <span>{{ childCoverTimeStamp(publishReply.replyDate) }}</span><br>
                    <div style="margin-top: 5px;">
                        {{ publishReply.content }}
                    </div>
                </div>
                <component-reply-second v-for="publishReply in publishReply.publishReplyList" v-bind:key="publishReply.id"
                    v-bind:publishReply="publishReply" v-bind:publishdata="publishdata" v-bind:cosinf="cosinf">
                </component-reply-second>
            </div>
        </div>`,
        created() {
            this.updateCount();
        },
        methods: {
            childCoverTimeStamp: function(timeStamp) {
                return this.$parent.childCoverTimeStamp(timeStamp);
            },
            updateCount: function() {
                this.$parent.updateCount();
            },
            setReplyDefault: function(replyDefault) {
                this.$parent.setReplyDefault(replyDefault);
            },
            makeReply: function() {
                var replyObject =  {
                    type: "reply", // comment or reply
                    content: "",
                    fromUuid: "",
                    toUuid: this.publishReply.fromUuid,
                    replyType: "forReply",
                    aimId: this.publishReply.id,
                    toUserName: this.publishReply.fromUserInfo.userName,
                    originalContent: this.publishReply.content,
                    display: "display: block;",
                    placeholderString: "回复@" + this.publishReply.fromUserInfo.userName,
                };
                console.log(this);
                this.setReplyDefault(replyObject);
            },
        },
        components: {
            'component-reply-second': ComponentReplySecond,
        },
    }

    var ComponentComment = {
        props: {
            publishdata: Object,
            cosinf: Object,
            comment: Object,

        },
        template: `
            <div class="card-footer card-comments" style="padding-bottom: 0!important;">
                <div class="card-comment" style="padding-bottom: 0!important;">
                    <img class="img-circle img-sm" :src="'https://' + cosinf.bucketName + '.cos.' + cosinf.region +'.myqcloud.com/' + comment.fromUserUuid" alt="用户头像">
                    <div class="comment-text">
                        <span class="username">
                        {{ comment.userInfo.userName }}
                            <div class="float-right btn-tool" style="position: relative; right: -20px;">
                    <button class="btn btn-link" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            ...
                    </button>
                    <div class="dropdown-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="javascript:void(0)" @click="makeReply">回复评论</a>
                        <a class="dropdown-item" href="#">收藏动态</a>
                        <a class="dropdown-item" href="#">投诉或对此有疑问</a>
                    </div>
                </div>
                        </span>
                        <span>{{ childCoverTimeStamp(comment.commentDate) }}</span><br>
                        <div style="margin-top: 8px; margin-bottom: 8px;">
                        {{ comment.commentContent }}
                        </div>

                        <component-reply
                            v-for="publishReply in comment.publishReplyList"
                            v-bind:key="publishReply.id"
                            v-bind:publishReply="publishReply"
                            v-bind:publishdata="publishdata"
                            v-bind:cosinf="cosinf"
                        ></component-reply>

                    </div>
                </div>
            </div>`,
        created() {
            this.updateCount();
        },
        methods: {
            childCoverTimeStamp: function(timeStamp) {
                return this.$parent.coverTimeStampToString(timeStamp);
            },
            updateCount: function() {
                this.$parent.updateCount();
            },
            setReplyDefault: function(replyDefault) {
                this.$parent.setReplyDefault(replyDefault);
            },
            makeReply: function() {
                var replyObject =  {
                    type: "reply", // comment or reply
                    content: "",
                    fromUuid: "",
                    toUuid: this.comment.fromUserUuid,
                    replyType: "forComment",
                    aimId: this.comment.id,
                    toUserName: this.comment.userInfo.userName,
                    originalContent: this.comment.commentContent,
                    display: "display: block;",
                    placeholderString: "回复@" + this.comment.userInfo.userName,
                };
                console.log(this);
                this.setReplyDefault(replyObject);
            },
        },
        components: {
            'component-reply': ComponentReply,
        },
    }


    var ComponentPost = {
        props: {
            publishdata: Object,
            cosinf: Object,
        },
        data: function (){
            var result = {};
            if(this.publishdata.isLike === 0){
                result = {
                    likeActionClass: "far fa-thumbs-up mr-1",
                    likeStyle: "",
                    comments: [],
                    countForComment: 0,
                    replyDefault: {
                        type: "comment", // comment or reply
                        content: "",
                        fromUuid: "",
                        toUuid: "",
                        replyType: "",
                        aimId: this.publishdata.id,
                        fromUserName: "",
                        originalContent: "",
                        display: "display:none;",
                        placeholderString: "写回复...",
                    }
                }
            } else if(this.publishdata.isLike === 1) {
                result = {
                    likeActionClass: "fas fa-thumbs-up mr-1",
                    likeStyle: "color: #007bff;",
                    comments: [],
                    countForComment: 0,
                    replyDefault: {
                        type: "comment", // comment or reply
                        content: "",
                        fromUuid: "",
                        toUuid: "",
                        replyType: "",
                        aimId: this.publishdata.id,
                        toUserName: "",
                        originalContent: "",
                        display: "display:none;",
                        placeholderString: "写回复...",
                    }
                }
            }
            return result;
        },
        template: `
        <div class="post">
        <div class="user-block">
            <img class="img-circle img-bordered-sm" v-bind:src="'https://' + cosinf.bucketName + '.cos.' + cosinf.region +'.myqcloud.com/' + publishdata.publishUserUuid">
            <span class="username">
                <a href="javascript:void(0)" style="display: inline-block;">{{ publishdata.userInfo.userName }}</a>
                <div class="float-right btn-tool" style="position: relative; bottom: 20px; right: -10px;">
                    <button class="btn btn-link" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            ...
                    </button>
                    <div class="dropdown-menu dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">转发动态</a>
                        <a class="dropdown-item" href="#">收藏动态</a>
                        <a class="dropdown-item" href="#">投诉或对此有疑问</a>
                    </div>
                </div>
            </span>
            <span class="description">{{ publishdata.publishAccessDesc }} - {{ coverTimeStampToString(publishdata.publishDate) }}</span>
        </div>
        <p>
        {{ publishdata.publishContent }}
        </p>
        <p>
            <a href="#" class="link-black text-sm mr-2">
                <i class="fas fa-share mr-1"></i> 转发
            </a>
            <a href="javascript:void(0)" class="link-black text-sm">
                <i :class="likeActionClass" :style="likeStyle" @click="likePublish($event)"></i> {{ publishdata.likeCount }}
            </a>
            <span class="float-right">
                <a :href="'#publishComment_' + publishdata.id" class="link-black text-sm" data-toggle="collapse" aria-expanded="false"
                    :aria-controls="'publishComment_' + publishdata.id">
                    <i class="far fa-comments mr-1"></i> 评论 ({{ countForComment }})
                </a>
            </span>
        </p>

        <div class="publishCommentContain collapse" :id="'publishComment_' + publishdata.id">
            <component-comment
                v-for="comment in comments"
                v-bind:key="comment.id"
                v-bind:comment="comment"
                v-bind:publishdata="publishdata"
                v-bind:cosinf="cosinf"
            ></component-comment>
        <div class="card-footer">
        <div>
            <div class="img-push">
                <div :class="replyDefault.displayClass" style="margin: 0 1px 3px 1px; padding: 3px 8px 3px 6px; background-color: #dcdcdc!important; color: #636363!important; font-size: 15px; border-radius: .2rem;" :style="replyDefault.display">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true" @click="makeReplyToDefault">×</button>
                    <span style="font-weight: bold;">{{ replyDefault.toUserName }}: </span> {{ replyDefault.originalContent }}
                </div>
                <input type="text" class="form-control form-control-sm" :placeholder="replyDefault.placeholderString" @keyup.enter="submitComment" v-model="replyDefault.content">
            </div>
        </div>
        </div>
        </div>
        </div>
        </div>
  `,
        created() {
            this.getPublishComment(this);
        },
        components: {
            'component-comment': ComponentComment,
        },
        methods: {
            coverTimeStampToString: function (timeStamp) {
                if (timeStamp) {
                    var time = new Date(timeStamp);
                    var y = time.getFullYear(); //getFullYear方法以四位数字返回年份
                    var M = time.getMonth() + 1; // getMonth方法从 Date 对象返回月份 (0 ~ 11)，返回结果需要手动加一
                    var d = time.getDate(); // getDate方法从 Date 对象返回一个月中的某一天 (1 ~ 31)
                    var h = time.getHours(); // getHours方法返回 Date 对象的小时 (0 ~ 23)
                    var m = time.getMinutes(); // getMinutes方法返回 Date 对象的分钟 (0 ~ 59)
                    var s = time.getSeconds(); // getSeconds方法返回 Date 对象的秒数 (0 ~ 59)
                    return y + '-' + M + '-' + d + ' ' + h + ':' + m + ':' + s;
                } else {
                    return '';
                }
            },
            
            likePublish: function () {
                var publishId = this.publishdata.id;

                if(this.likeActionClass === "fas fa-thumbs-up mr-1"){
                    this.likeActionClass = "far fa-thumbs-up mr-1";
                    this.likeStyle = "";

                    // 减少
                    this.$options.methods.changeLikeCount("decrease", publishId)

                    this.publishdata.likeCount = this.publishdata.likeCount - 1;

                } else if(this.likeActionClass === "far fa-thumbs-up mr-1"){
                    this.likeActionClass = "fas fa-thumbs-up mr-1";
                    this.likeStyle = "color: #007bff;";

                    // 增加
                    this.$options.methods.changeLikeCount("increase", publishId);

                    this.publishdata.likeCount = this.publishdata.likeCount + 1;
                }
            },
            updateCount: function() {
                this.countForComment = this.countForComment + 1;
            },

            setReplyDefault: function(replyDefault) {
                this.replyDefault = replyDefault;
            },

            makeReplyToDefault: function () {
                var replyDefaultObject = {
                        type: "comment", // comment or reply
                        content: "",
                        fromUuid: "",
                        toUuid: "",
                        replyType: "",
                        aimId: this.publishdata.id,
                        toUserName: "",
                        originalContent: "",
                        display: "display:none;",
                        placeholderString: "写回复...",
                    };
                this.replyDefault = replyDefaultObject;
            },

            submitComment: function() {
                // 提交评论数据
                var json_data = this.replyDefault;
                const that = this;

                $.ajax({
                    //发送请求URL，可使用相对路径也可使用绝对路径
                    url: "${pageContext.request.contextPath}/createComment",
                    //发送方式为GET，也可为POST，需要与后台对应
                    type: 'POST',
                    data: JSON.stringify(json_data),
                    dataType: 'json',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    //后台返回成功后处理数据，data为后台返回的json格式数据
                    success: function (data) {
                        if (data.code === 400) {
                            console.log(data);
                        } else if (data.code === 200) {
                            console.log(data);
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });

                that.getPublishComment(that);
            },

            changeLikeCount: function(tag, publishId) {
                var json_data = {tag: tag, publishId: publishId}

                $.ajax({
                    //发送请求URL，可使用相对路径也可使用绝对路径
                    url: "${pageContext.request.contextPath}/changeLikeCount",
                    //发送方式为GET，也可为POST，需要与后台对应
                    type: 'POST',
                    data: JSON.stringify(json_data),
                    dataType: 'json',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    //后台返回成功后处理数据，data为后台返回的json格式数据
                    success: function (data) {
                        if (data.code === 400) {
                            console.log(data);
                        } else if (data.code === 200) {
                            console.log(data);
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            },
            getPublishComment: function (that) {
                var json_data = {publishId: this.publishdata.id};

                $.ajax({
                    //发送请求URL，可使用相对路径也可使用绝对路径
                    url: "${pageContext.request.contextPath}/getPublishComment",
                    //发送方式为GET，也可为POST，需要与后台对应
                    type: 'POST',
                    data: JSON.stringify(json_data),
                    dataType: 'json',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    //后台返回成功后处理数据，data为后台返回的json格式数据
                    success: function (data) {
                        if (data.code === 400) {
                            console.log(data);
                        } else if (data.code === 200) {
                            console.log(data);
                            // 重新加载科研动态信息
                           that.comments = data.commentList;
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }
        }
    }

    var vue_data = {
        publishData: [],
        cosInf: {
            bucketName: '${sessionScope.bucketName}',
            region: '${sessionScope.region}',
            thisUser: '${sessionScope.uuid}'
        }
    };

    var vm = new Vue({
        el: '#app',
        data: vue_data,
        components: {
            'component-post': ComponentPost,
        },
        methods: {
            expandTextarea: function (){
                $('#publishText').attr("rows", 4)
            },
            closeTextarea: function () {
                $('#publishText').attr("rows", 2)
            },
            publishDataFunction: function (event){
                event.preventDefault();
                // 获取 textAre 数据
                var publishContent = $('#publishText').val();

                // 获取权限信息
                var publishAccess = $('#publishAccess').val();

                var json_data = {publishContent: publishContent, publishAccess: publishAccess};

                $.ajax({
                    //发送请求URL，可使用相对路径也可使用绝对路径
                    url: "${pageContext.request.contextPath}/publishData",
                    //发送方式为GET，也可为POST，需要与后台对应
                    type: 'POST',
                    data: JSON.stringify(json_data),
                    dataType: 'json',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    //后台返回成功后处理数据，data为后台返回的json格式数据
                    success: function (data) {
                        if (data.code === 400) {
                            console.log(data);
                            toastr.error("科研动态发布失败!")
                        } else if (data.code === 200) {
                            console.log(data);
                            // 重新加载科研动态信息
                            // $('#example').DataTable().ajax.reload();
                            // $('#image-uploading').fadeOut("slow");
                            toastr.success("科研动态发布成功！")
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
                $('#publishText').val('');
                getPublishData();
            }
        }
    })

    $(function () {
        getPublishData();
    })

    function getPublishData() {
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/getPublishData',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                } else if (data.code === 200) {
                    console.log(data);
                    vue_data.publishData = data.publishData;
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function getPublishComment(publishId) {
        var json_data = {publishId: publishId};

        $.ajax({
            //发送请求URL，可使用相对路径也可使用绝对路径
            url: "${pageContext.request.contextPath}/getPublishComment",
            //发送方式为GET，也可为POST，需要与后台对应
            type: 'POST',
            data: JSON.stringify(json_data),
            dataType: 'json',
            async: false,
            contentType: "application/json;charset=utf-8",
            //后台返回成功后处理数据，data为后台返回的json格式数据
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("科研动态发布失败!")
                } else if (data.code === 200) {
                    console.log(data);
                    // 重新加载科研动态信息
                    // $('#example').DataTable().ajax.reload();
                    // $('#image-uploading').fadeOut("slow");
                    toastr.success("科研动态发布成功！")
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
