<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>表单填写</title>

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
                        <h1>表单</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">表单</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-8">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">项目申报表单</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body">
                                <form role="form">
                                    <div class="row">
                                        <!-- 项目概况 -->
                                        <div class="col-sm-12">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>项目名称</label>
                                                <input type="text" class="form-control" placeholder="" name="3a9782643aef48f0b1d5e3971cb0b0ab">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>项目类别</label>
                                                <select class="form-control" name="d8824951d21b4e7182c2a0c2b4b52fc1">
                                                    <option value="重点项目">A. 重点项目</option>
                                                    <option value="一般项目">B. 一般项目</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>项目研究类别</label>
                                                <select class="form-control" name="c16f80f5b441462ead061d8d116ce14b">
                                                    <option value="重点项目">A. 基础研究</option>
                                                    <option value="一般项目">B. 应用研究</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>申请经费</label>
                                                <input type="number" class="form-control" placeholder="万元" name="6d583fc7861d44d2b15039f2fd732582">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>学科代码</label>
                                                <input type="text" class="form-control" placeholder="例如：030101(参科技处学科代码公示)" name="8354da7a00ce46efa5657053556babfe">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>学科名称</label>
                                                <input type="text" class="form-control" placeholder="" name="1cc4c2d8ba534ca6b8b8b92671c06b84">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>起止日期:</label>

                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                       <span class="input-group-text">
                                                           <i class="far fa-calendar-alt"></i>
                                                       </span>
                                                    </div>
                                                    <input type="text" class="form-control float-right"
                                                           id="reservation" name="c28e3654daa64ebf83af23d033d50aa5">
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                        </div>
                                    </div>


                                    <hr>

                                    <!-- 申请人信息 -->
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>姓名</label>
                                                <input type="text" class="form-control" placeholder="" name="14ad5956ff4d4978a5b9964b111e34ed">
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>性别</label>
                                                <select class="form-control" name="2a0c41d9d19b4a9fbb34473a00054aff">
                                                    <option value="男">男</option>
                                                    <option value="女">女</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>出生日期</label>
                                                <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                    <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate" name="f76f46b139cb4f4b8c70e0f4c9e91e3e"/>
                                                    <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>教职工工号</label>
                                                <input type="text" class="form-control" placeholder="" name="3f9d5cfc5a0e4349b8ceb4afa87b8c6d">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>职称</label>
                                                <input type="text" class="form-control" placeholder="例如：讲师" name="adbaf559781140d5a04fd90dda33345e">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>学历</label>
                                                <input type="text" class="form-control" placeholder="例如：本科" name="e6f5c730c07b472286cbccff7d56f524">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>学位</label>
                                                <input type="text" class="form-control" placeholder="例如：学士" name="6cc61c459c304a4fb562ae34e2efebe3">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>民族</label>
                                                <input type="text" class="form-control" placeholder="例如：汉族" name="619909779cbc46caa32fa5658e8c30f4">
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <!-- 主要研究内容与技术指标 -->
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- textarea -->
                                            <div class="form-group">
                                                <label>主要研究内容与技术指标</label>
                                                <textarea class="form-control" rows="5" placeholder="限制200字" name="2694956c8acd4291879b8f84447a741a"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <!-- textarea -->
                                            <div class="form-group">
                                                <label>主题词</label>
                                                <textarea class="form-control" rows="1" placeholder="不超过3个" name="fa632181733f46e39c0cfaa244414f7a"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>

                            <!-- 通用card-foot -->
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary float-right">提交信息</button>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>

                    <!-- 时间线 -->
                    <div class="col-md-4">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">申报概况</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                    <div class="col-md-12">
                        <!-- The time line -->
                        <div class="timeline">
                            <!-- timeline time label -->
                            <div class="time-label">
                                <span class="bg-red">开始申报</span>
                            </div>
                            <!-- /.timeline-label -->
                            <!-- timeline item -->
                            <div>
                                <i class="fas fa-graduation-cap bg-blue"></i>
                                <div class="timeline-item">
                                    <h3 class="timeline-header"><a href="#">申报项目信息</a><br>
                                        2020年博雅博士后项目
                                    </h3>

                                    <div class="timeline-body">
                                        北京大学自2016年设立博雅博士后项目，旨在吸引汇聚全球优秀年轻人才来校从事博士后研究工作，成就学术卓越的梦想。该项目为年轻的研究人员从事理学、信息与工程、社会科学...
                                    </div>
                                    <div class="timeline-footer">
                                        <a class="btn btn-primary btn-sm">阅读详细</a>
<%--                                        <a class="btn btn-danger btn-sm">Delete</a>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="time-label">
                                <span class="bg-green">填写项目申报表</span>
                            </div>
                            <!-- END timeline item -->
                            <!-- timeline item -->
                            <div>
                                <i class="fas fa-user bg-green"></i>
                                <div class="timeline-item">
                                    <span class="time"><i class="fas fa-clock"></i> Now </span>
                                    <h3 class="timeline-header no-border"><a href="#">填写申请表</a> </h3>
                                    <div class="timeline-body">
                                        项目申报基础表单
                                    </div>
                                </div>
                            </div>
                            <!-- END timeline item -->
                            <!-- timeline item -->
                            <div>
                                <i class="fas fa-pencil-alt bg-yellow"></i>
                                <div class="timeline-item">
                                    <h3 class="timeline-header"><a href="#">填写成员表单</a></h3>
                                    <div class="timeline-body">
                                       科研项目成员信息表
                                    </div>
                                </div>
                            </div>
                            <!-- END timeline item -->
                            <!-- END timeline item -->
                            <div>
                                <i class="fas fa-clock bg-gray"></i>
                            </div>
                        </div>
                    </div>
                        </div>
                    </div>
                    </div>
                    <!-- 时间线结束 -->
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

<script>
    //Date picker
    $('#reservation').daterangepicker();


    $('#reservationdate').datetimepicker({
        format: 'L'
    });

</script>
</body>
</html>
