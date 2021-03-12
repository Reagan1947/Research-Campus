<%--
  Created by IntelliJ IDEA.
  User: buwan
  Date: 2021/3/12
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 导航栏 -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- 左侧导航栏链接 -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button" style="text-align: center;display: table;">
                <i class="fas fa-bars" style="vertical-align: middle;display: table-cell;"></i>
            </a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="../../index3.html" class="nav-link">首页</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="#" class="nav-link">联系</a>
        </li>
    </ul>

    <!-- 搜索表单 -->
    <form class="form-inline ml-3" style="margin-bottom: 0;">
        <div class="input-group input-group-sm">
            <input class="form-control form-control-navbar" type="search" placeholder="搜索" aria-label="Search">
            <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- 右侧导航栏链接 -->
    <ul class="navbar-nav ml-auto">
        <!-- 消息下拉菜单 -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#" style="text-align: center;display: table;">
                <i class="far fa-comments" style="vertical-align: middle;display: table-cell;"></i>
                <span class="badge badge-danger navbar-badge">3</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <a href="#" class="dropdown-item">
                    <!-- 消息开始 -->
                    <div class="media">
                        <img src="${pageContext.request.contextPath}/dist/img/user1-128x128.jpg" alt="用户头像" class="img-size-50 mr-3 img-circle">
                        <div class="media-body">
                            <h3 class="dropdown-item-title">
                                Brad Diesel
                                <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                            </h3>
                            <p class="text-sm">有空的话就打电话给我...</p>
                            <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 小时前</p>
                        </div>
                    </div>
                    <!-- 消息结束 -->
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <!-- 消息开始 -->
                    <div class="media">
                        <img src="${pageContext.request.contextPath}/dist/img/user8-128x128.jpg" alt="用户头像" class="img-size-50 img-circle mr-3">
                        <div class="media-body">
                            <h3 class="dropdown-item-title">
                                John Pierce
                                <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                            </h3>
                            <p class="text-sm">我收到你的消息了</p>
                            <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 小时前</p>
                        </div>
                    </div>
                    <!-- 消息结束 -->
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <!-- 消息开始 -->
                    <div class="media">
                        <img src="${pageContext.request.contextPath}/dist/img/user3-128x128.jpg" alt="用户头像" class="img-size-50 img-circle mr-3">
                        <div class="media-body">
                            <h3 class="dropdown-item-title">
                                Nora Silvester
                                <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                            </h3>
                            <p class="text-sm">主题在这里</p>
                            <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 小时前</p>
                        </div>
                    </div>
                    <!-- 消息结束 -->
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item dropdown-footer">查看所有消息</a>
            </div>
        </li>
        <!-- 通知下拉菜单 -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#" style="text-align: center;display: table;">
                <i class="far fa-bell" style="vertical-align: middle;display: table-cell;"></i>
                <span class="badge badge-warning navbar-badge">15</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-item dropdown-header">15 条通知</span>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-envelope mr-2"></i> 4 条新消息
                    <span class="float-right text-muted text-sm">3 分钟前</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-users mr-2"></i> 8 个好友请求
                    <span class="float-right text-muted text-sm">12 小时前</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-file mr-2"></i> 3 个新报告
                    <span class="float-right text-muted text-sm">2 天前</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item dropdown-footer">查看所有通知</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button" style="text-align: center;display: table;">
                <i class="fas fa-th-large" style="vertical-align: middle;display: table-cell;"></i>
            </a>
        </li>
    </ul>
</nav>