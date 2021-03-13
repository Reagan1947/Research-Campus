<%--
  Created by IntelliJ IDEA.
  User: buwan
  Date: 2021/3/12
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="P_common_head.jsp"/>
    <!-- 页面Head信息 / -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<h1>${sessionScope.uuid}</h1>
<div class="wrapper" style="background-color: #f4f6f9;">
    <!-- 页面头部 -->
    <jsp:include page="P_header.jsp"/>
    <!-- 页面头部 / -->

    <!-- 页面侧边栏 -->
    <jsp:include page="P_aside.jsp"/>
    <!-- 页面侧边栏 / -->

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper" style="min-height: inherit!important;">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>资料</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">用户资料</li>
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

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img class="profile-user-img img-fluid img-circle"
                                         src="../../dist/img/user4-128x128.jpg"
                                         alt="User profile picture">
                                </div>

                                <h3 class="profile-username text-center">Nina Mcintire</h3>

                                <p class="text-muted text-center">讲师</p>

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

                                <a href="#" class="btn btn-primary btn-block"><b>粉我</b></a>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                        <!-- 关于我 Box -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">关于我</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <strong><i class="fas fa-building mr-1"></i> 所属部门</strong>

                                <p class="text-muted">
                                    重庆工程学院 软件学院 软件工程
                                </p>

                                <hr>

                                <strong><i class="fas fa-id-card-alt mr-1"></i> 所属角色</strong>

                                <p class="text-muted">科研项目管理员 RP-Manager</p>

                                <hr>

<%--                                <strong><i class="fas fa-pencil-alt mr-1"></i> 技能</strong>--%>

<%--                                <p class="text-muted">--%>
<%--                                    <span class="tag tag-danger">UI 设计</span>--%>
<%--                                    <span class="tag tag-success">编码</span>--%>
<%--                                    <span class="tag tag-info">Javascript</span>--%>
<%--                                    <span class="tag tag-warning">PHP</span>--%>
<%--                                    <span class="tag tag-primary">Node.js</span>--%>
<%--                                </p>--%>

<%--                                <hr>--%>

                                <strong><i class="fas fa-quote-right mr-1"></i> 说明</strong>

                                <p class="text-muted">主要负责SpringBoot相关科研项目，以及计算机学院部分Deep Learning项目.
                                </p>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">活动</a>
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
                                        <!-- Post -->
                                        <div class="post">
                                            <div class="user-block">
                                                <img class="img-circle img-bordered-sm"
                                                     src="../../dist/img/user1-128x128.jpg" alt="用户头像">
                                                <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                                                <span class="description">公开分享 - 今天下午7:30</span>
                                            </div>
                                            <!-- /.user-block -->
                                            <p>
                                                Lorem ipsum 代表了设计师、排版师们的长期坚持。
                                                一些人憎恨它，并为它的消亡而争辩，
                                                但另一些人对此不屑一顾。因为他们创建的文本填充工具
                                                帮助了从培根爱好者到
                                                Charlie Sheen 的粉丝。
                                            </p>

                                            <p>
                                                <a href="#" class="link-black text-sm mr-2"><i
                                                        class="fas fa-share mr-1"></i> 分享</a>
                                                <a href="#" class="link-black text-sm"><i
                                                        class="far fa-thumbs-up mr-1"></i> 喜欢</a>
                                                <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> 评论 (5)
                          </a>
                        </span>
                                            </p>

                                            <input class="form-control form-control-sm" type="text" placeholder="输入评论">
                                        </div>
                                        <!-- /.post -->

                                        <!-- Post -->
                                        <div class="post clearfix">
                                            <div class="user-block">
                                                <img class="img-circle img-bordered-sm"
                                                     src="../../dist/img/user7-128x128.jpg" alt="用户头像">
                                                <span class="username">
                          <a href="#">Sarah Ross</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                                                <span class="description">给你发了消息 - 3天前</span>
                                            </div>
                                            <!-- /.user-block -->
                                            <p>
                                                Lorem ipsum 代表了设计师、排版师们的长期坚持。
                                                一些人憎恨它，并为它的消亡而争辩，
                                                但另一些人对此不屑一顾。因为他们创建的文本填充工具
                                                帮助了从培根爱好者到
                                                Charlie Sheen 的粉丝。
                                            </p>

                                            <form class="form-horizontal">
                                                <div class="input-group input-group-sm mb-0">
                                                    <input class="form-control form-control-sm" placeholder="响应">
                                                    <div class="input-group-append">
                                                        <button type="submit" class="btn btn-danger">发送</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- /.post -->

                                        <!-- Post -->
                                        <div class="post">
                                            <div class="user-block">
                                                <img class="img-circle img-bordered-sm"
                                                     src="../../dist/img/user6-128x128.jpg" alt="用户头像">
                                                <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                                                <span class="description">发布图片 - 5天前</span>
                                            </div>
                                            <!-- /.user-block -->
                                            <div class="row mb-3">
                                                <div class="col-sm-6">
                                                    <img class="img-fluid" src="../../dist/img/photo1.png" alt="照片">
                                                </div>
                                                <!-- /.col -->
                                                <div class="col-sm-6">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <img class="img-fluid mb-3" src="../../dist/img/photo2.png"
                                                                 alt="照片">
                                                            <img class="img-fluid" src="../../dist/img/photo3.jpg"
                                                                 alt="照片">
                                                        </div>
                                                        <!-- /.col -->
                                                        <div class="col-sm-6">
                                                            <img class="img-fluid mb-3" src="../../dist/img/photo4.jpg"
                                                                 alt="照片">
                                                            <img class="img-fluid" src="../../dist/img/photo1.png"
                                                                 alt="照片">
                                                        </div>
                                                        <!-- /.col -->
                                                    </div>
                                                    <!-- /.row -->
                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.row -->

                                            <p>
                                                <a href="#" class="link-black text-sm mr-2"><i
                                                        class="fas fa-share mr-1"></i> 分享</a>
                                                <a href="#" class="link-black text-sm"><i
                                                        class="far fa-thumbs-up mr-1"></i> 喜欢</a>
                                                <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> 评论 (5)
                          </a>
                        </span>
                                            </p>

                                            <input class="form-control form-control-sm" type="text" placeholder="输入评论">
                                        </div>
                                        <!-- /.post -->
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
                                            <!-- END timeline item -->
                                            <!-- timeline item -->
                                            <div>
                                                <i class="fas fa-user bg-info"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="far fa-clock"></i> 5 分钟前</span>

                                                    <h3 class="timeline-header border-0"><a href="#">Sarah Young</a>
                                                        接受了你的朋友请求
                                                    </h3>
                                                </div>
                                            </div>
                                            <!-- END timeline item -->
                                            <!-- timeline item -->
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
                                            <!-- END timeline item -->
                                            <!-- timeline time label -->
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
                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div><!-- /.card-body -->
                        </div>
                        <!-- /.nav-tabs-custom -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

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
    $(function () {
        //The passed argument has to be at least a empty object or a object with your desired options
        $("body").overlayScrollbars({});
    });
</script>


</body>
</html>
