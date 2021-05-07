<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>
    <link href="${pageContext.request.contextPath}/jquery-transfer/css/jquery.transfer.css" media="screen"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/jquery-transfer/icon_font/css/icon_font.css" media="screen"
          rel="stylesheet" type="text/css">

    <!-- 设置每个页面的Title -->
    <title>用户群组成员编辑</title>

    <style>
        .transfer-double {
            border: none;
            box-shadow: none;
            -webkit-box-shadow: none;
            width: 100%;
        }

        .transfer-double-content-left {
            width: 45%;
            height: auto;
        }

        .transfer-double-content-right {
            width: 45%;
            height: auto;
        }

        .transfer-double-content-param .param-item {
            font-weight: 600;
            font-size: 17px;
        }

        .transfer-double-list-search-input {
            width: 100%;
            height: 32px;
        }

        .transfer-double-selected-list-search-input {
            width: 100%;
            height: 32px;
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
                        <h1>
                            用户群组成员编辑
                            <span style="margin-left: 5px; display: inline-block; text-decoration:underline; font-size: 15px;">
              <a href="${pageContext.request.contextPath}/toUserGroupPage">← 返回用户组管理</a></span>
                        </h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">用户群组成员编辑</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content" id="app">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-5">
                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title">${group.name}组成员管理</h3>
                            </div>

                            <div class="card-body">
                                <component-user-inf
                                        v-for="userinf in userInGroupDetail"
                                        v-bind:key="userinf.id"
                                        v-bind:userinf="userinf"
                                ></component-user-inf>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title">更改群组成员</h3>
                            </div>
                            <div class="card-body">

                                <div class="transfer"></div>

                            </div>

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary" onclick="saveUsersOfGroup()">保存设置</button>
                            </div>

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
<script src="${pageContext.request.contextPath}/jquery-transfer/js/jquery.transfer.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    var userInGroup = {};

    var ComponentUserInf = {
        props: ['userinf'],
        template: `
     <div class="col-12">
        <div class="card bg-light">
            <div class="card-header text-muted border-bottom-0">
                {{  userinf.username }}
            </div>
            <div class="card-body pt-0">
                <div class="row">
                    <div class="col-12">
                        <h2 class="lead"><b>{{  userinf.chineseName }}</b></h2>
                        <p class="text-muted text-sm"><b>二级部门: </b> {{ userinf.explanatory }} </p>
                        <ul class="ml-4 mb-0 fa-ul text-muted" style="margin-left: 0!important;">
                            <li class="small"><i class="fas fa-envelope"></i> E-Mail: {{ userinf.email }}</li>
                            <li class="small"><i class="fas fa-phone-square-alt"></i> Phone Number: {{ userinf.phoneNumber }}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="text-right">
                    <a href="#" class="btn btn-sm btn-primary">
                        <i class="fas fa-user"></i> 查看资料
                    </a>
                </div>
            </div>
        </div>
    </div>
  `
    }


    var vue_data = {
        userInGroupDetail: {}
    };

    var vm = new Vue({
        el: '#app',
        data: vue_data,
        components: {
            'component-user-inf': ComponentUserInf,
        }
    })

    $(function () {
        getUserInGroup();

        // 查找已选择用户的详细信息
        getUserInGroupDetail();

        $.ajax({
            url: "${pageContext.request.contextPath}/getUsersGroupBySubject",
            type: "POST",
            processData: false, //告诉ajax不要处理和编码这些数据，直接提交
            contentType: false, //不使用默认的内容类型
            dataType: 'json',
            async: false,

            success: function (data) {
                console.log(userInGroup);
                for (var i = 0; i < data.length; i++) {
                    var groupArray = data[i].groupArray;
                    for (var j = 0; j < groupArray.length; j++) {
                        var uuid = groupArray[j].uuid;
                        for (var k = 0; k < userInGroup.length; k++) {
                            var id = userInGroup[k].id;
                            if (uuid === id) {
                                groupArray[j]['selected'] = true;
                            }
                        }
                    }
                }
                showTransfer(data);
            },
            error: function (e) {
                console.log(e);
            }
        });
    })
</script>
<script>
    var transfer;

    function showTransfer(data) {
        var settings = {
            groupDataArray: data,
            tabNameText: "备选用户",
            rightTabNameText: "已选择用户",
            searchPlaceholderText: "搜索......",
            itemName: "chineseName",
            valueName: "uuid",
            callable: function (items) {
                // your code
            }
        };

        transfer = $(".transfer").transfer(settings);
        // get selected items
        transfer.getSelectedItems();
    }
</script>

<script>
    function saveUsersOfGroup() {
        // 获取选择的项目
        var usersOfSelect = transfer.getSelectedItems();

        var json_data = {usersOfSelect: usersOfSelect, userGroupId: '${group.id}'};
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/setUsersOfGroup',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                    toastr.error("群组成员用户信息配置失败！")
                } else if (data.code === 200) {
                    console.log(data);
                    toastr.success("群组成员用户信息配置成功！")
                    getUserInGroupDetail();
                    // $("#jsGrid1").jsGrid("loadData");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function getUserInGroup() {
        var json_data = {userGroupId: '${group.id}'};
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/getUserInGroup',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            async: false,
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                } else if (data.code === 200) {
                    console.log(data);
                    userInGroup = data.userList;
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function getUserInGroupDetail() {
        var json_data = {userGroupId: '${group.id}'};
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath }/getUserInGroupDetail',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(json_data),
            async: false,
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                } else if (data.code === 200) {
                    console.log(data);
                    vue_data.userInGroupDetail = data.userInfoList;
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
