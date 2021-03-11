<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="./js/vue.min.js"></script>

    <!-- import CSS -->
    <link rel="stylesheet" href="./css/index.css">
    <!-- import Vue before Element -->
    <!-- import JavaScript -->
    <script src="./js/index.js"></script>

</head>
<body>
<%--<img  src="<%=request.getContextPath()%>/static/images/icon_03.svg" alt="Smiley face" width="42" height="42">--%>

<el-container id="main_page">
    <el-menu :default-active="activeIndex" id="menu" mode="horizontal" @select="handleSelect"
             style="z-index:999; background-color:#ffffffde; position:relative; top:-10px; border-bottom:none;">
        <el-menu-item id="menu_icon">
<%--            <el-image :src="url_icon" style="height: 38px"></el-image>--%>
            <img  src="./images/icon_03.svg" alt="Smiley face" width="42" height="42">
        </el-menu-item>
        <el-menu-item index="1">登录</el-menu-item>
        <el-menu-item index="2">创建您的Research ID</el-menu-item>
        <el-menu-item index="3">常见问题解答</el-menu-item>
    </el-menu>
    <el-main id="test">
        <div style="position: absolute; top:200px; z-index:2; text-align: center; width:1200px; margin:auto;">
            <div id="login_form" style="text-align: center; width:480px; margin:auto;">
                <p style="font-size:40px; font-weight:600; color: white; margin:5px 0 8px 0;">Research ID</p>
                <p style="font-size:17px; font-weight:500; color: white; margin:0 0 15px 0;">管理您的Research账户</p>
                <el-input v-model="input" placeholder="Research ID" style="width:300px"
                          :suffix-icon="login_icon"></el-input>
            </div>
        </div>
        <div id="cover_container" style="width:1200px; height:660px">
<%--            <el-image :src="url_main" fit="fill" id="main_cover" style="height:100%; width:100%; padding: 0"></el-image>--%>
        </div>
        <div id="login_infor_container">
            <p id="login_infor">提供完善的科研项目管理服务</p>
            <p style="width: 460px; margin:auto; font-size: 17px; margin-bottom:20px">使用一个 Research ID 和密码即可访问所有
                Research 服务。 <a href="">了解有关 Research ID 的更多信息<i style="font-size:15px" class="el-icon-arrow-right"></i></a>
            </p>
            <i class="el-icon-chat-line-square infor_icon"></i>
            <i class="el-icon-finished infor_icon"></i>
            <i class="el-icon-key infor_icon"></i>
            <i class="el-icon-notebook-2 infor_icon"></i>
            <i class="el-icon-coin infor_icon"></i>
            <i class="el-icon-data-analysis infor_icon"></i>
            <p id="log_infor_end"><a href="">创建您的 Research ID<i style="font-size:15px" class="el-icon-arrow-right"></i></a>
            </p>
        </div>
    </el-main>
    <el-footer>
        <div id="foot_container">
            <p class="foot_infor">项目前端开源地址：<a href="">RESEARCH-VUE-Element UI</a>
                项目开源证书：<a href="">MIT</a>
            </p>
            <p class="foot_infor">Copyright © 2021 lEE. 保留所有权利。</p>
        </div>
    </el-footer>
</el-container>
</body>

<script>
    new Main = {
        el:'#app',
        data() {
            return {
                activeIndex: '1',
                activeIndex2: '1',
                input: '',
                // url_icon: require('./static/images/icon_03.svg'),
                // url_main: require('./images/login_banner_01.jpeg'),
                login_icon: 'el-icon-right'
            }
        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath)
            }
        }
    }



</script>

<style lang="less" scoped>
    #main_page {
        width: 1200px;
        margin: 0 auto;
    }

    #menu_icon {
        width: 150px;
        /*margin-right: 1200-150-68-175.156-124px;*/
    }

    #test {
        position: relative;
        top: -100px;
        padding: 0;
    }

    #login_infor {
        font-size: 40px;
        font-weight: 600;
        margin-bottom: 10px;
        padding-top: 35px;
        margin-top: 0;
    }

    #login_infor_container {
        text-align: center;
    }

    /*包含以下四种的链接*/
    a {
        text-decoration: none;
        color: #1979ff;
    }

    /*正常的未被访问过的链接*/
    a:link {
        text-decoration: none;
    }

    /*已经访问过的链接*/
    a:visited {
        text-decoration: none;
    }

    /*鼠标划过(停留)的链接*/
    a:hover {
        text-decoration: underline;
    }

    /* 正在点击的链接*/
    a:active {
        text-decoration: none;
    }

    .infor_icon {
        font-size: 100px;
        margin: 20px;
    / / color: #1979ff;
    }

    #foot_container {
        height: 70px;
        background-color: #f5f5f7;
    }

    #log_infor_end {
        padding-bottom: 80px;
        font-size: 17px;
    }

    #foot_container {
        font-size: 12px;
        color: #86868b;
        padding: 15px 0 0 20px;
        font-weight: 400;
    }

    .foot_infor {
        margin: 5px;
        padding: 0;
    }
</style>

</html>
