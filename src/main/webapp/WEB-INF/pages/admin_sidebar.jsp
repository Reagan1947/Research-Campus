<%--
  Created by IntelliJ IDEA.
  User: buwan
  Date: 2021/3/12
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 主侧边栏容器 -->
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<style>
    @font-face {
        font-family: Advent-Pro-Bold;
        src: url("${pageContext.request.contextPath}/custom/font/Advent-Pro-Bold.ttf") format("truetype");
    }

    /*暂时解决对其问题*/
    .navbar-nav .nav-item .nav-link i {
        line-height: unset;
    }
</style>
<%-- style="background-color: #444444!important;--%>
<aside class="main-sidebar elevation-4 sidebar-light-primary">
    <!-- 品牌 Logo -->
    <a href="#" class="brand-link navbar-white" style="padding-bottom: 5px;padding-top: 14px;">
        <img src="${pageContext.request.contextPath}/custom/img/icon_simple.svg"
             alt="AdminLTE Logo"
             class="brand-image  elevation-3"
             style="/*opacity: .8 8*/ box-shadow: none!important;">
        <span class="brand-text font-weight-light"
              style="font-family: Advent-Pro-Bold, 'Segoe UI', sans-seri, sans-serif;
                        color: #1979ff; font-size: 25px; position: relative; bottom: 8px;
                        left: -12px;">
            search - Campus
        </span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/${sessionScope.uuid}"
                     class="img-circle elevation-2 userIcon"
                     alt="用户头像">
            </div>
            <div class="info">
                <a href="${pageContext.request.contextPath}/profile.detail" class="d-block">
                    <security:authentication property="principal.username"></security:authentication>
                </a>
            </div>
        </div>

        <!-- 侧边栏菜单 -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- 使用 .nav-icon 类添加图标，
                     或使用 font-awesome 或其他任何图标字体库 -->
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-poll-h"></i>
                        <p>
                            总览
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon far fa-check-square"></i>
                        <p>
                            待办事项
                        </p>
                    </a>
                </li>
                <li class="nav-header">个人及活动</li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon far fa-envelope"></i>
                        <p>
                            邮箱
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="../mailbox/mailbox.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>收件箱</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../mailbox/compose.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>写信</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../mailbox/read-mail.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>查看</p>
                            </a>
                        </li>
                    </ul>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/profile.detail" class="nav-link">
                        <i class="nav-icon far fa-address-card"></i>
                        <p>
                            个人资料与活动
                        </p>
                    </a>
                </li>
                </li>
                <li class="nav-header">流程系统管理</li>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-project-diagram"></i>
                        <p>流程管理与创建
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/bpmnList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>流程管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/buildBPMN" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>创建流程</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/deploymentBPMN" class="nav-link">
                        <i class="nav-icon fas fa-tasks"></i>
                        <p>流程定义与操作</p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-columns"></i>
                        <p>表单管理与创建
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/formManager" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>流程表单管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/formBuilder" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>创建流程表单</p>
                            </a>
                        </li>
                    </ul>
                </li>

<%--                <li class="nav-item">--%>
<%--                    <a href="${pageContext.request.contextPath}/toUserGroupPage" class="nav-link">--%>
<%--                        <i class="nav-icon fas fa-id-card-alt"></i>--%>
<%--                        <p>用户与用户组</p>--%>
<%--                    </a>--%>
<%--                </li>--%>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-id-card-alt"></i>
                        <p>用户与用户组
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/toUserGroupPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>用户组管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/formBuilder" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>科研秘书用户组管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/formBuilder" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>科研处用户组管理</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-header">科研系统管理</li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/projectEntityManager" class="nav-link">
                        <i class="nav-icon fas fa-flask"></i>
                        <p>科研项目主体管理</p>
                    </a>
                </li>

                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fab fa-font-awesome"></i>
                        <p>科研业务主体管理
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/businessEntity?businessEntityUuid=7e24d034394d42c891454b289c8d6cc3" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>申报管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/businessEntity?businessEntityUuid=03e903c6b5054b45a2968adf38611dce" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>立项管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/businessEntity?businessEntityUuid=86a510f9161a4980a5afe827fb237e4a" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>中期检查管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/businessEntity?businessEntityUuid=c61e2a58d1024cb9af21f0b9877a674b" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>成果申报管理</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/businessEntity?businessEntityUuid=9c458dcff03b4614b34875594a7b2465" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>项目结项管理</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-header">科研与活动</li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/myResearchProject" class="nav-link">
                        <i class="nav-icon fas fa-landmark"></i>
                        <p>科研项目管理</p>
                    </a>
                </li>


                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-layer-group"></i>
                        <p>科研项目申请
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/toDeclarationPage?businessEntityUuid=7e24d034394d42c891454b289c8d6cc3" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>申报申请</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/toDeclarationPage?businessEntityUuid=03e903c6b5054b45a2968adf38611dce" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>立项申请</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/toDeclarationPage?businessEntityUuid=86a510f9161a4980a5afe827fb237e4a" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>中期检查申请</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/toDeclarationPage?businessEntityUuid=c61e2a58d1024cb9af21f0b9877a674b" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>成果申报申请</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/toDeclarationPage?businessEntityUuid=9c458dcff03b4614b34875594a7b2465" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>项目结项申请</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/allResearchProjectSearch" class="nav-link">
                        <i class="nav-icon fas fa-poll-h"></i>
                        <p>机构科研项目查询</p>
                    </a>
                </li>

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
