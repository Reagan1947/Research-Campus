<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!doctype html>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>Research Campus Login Page</title>
    <%--    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">--%>
    <!-- Bootstrap core CSS -->
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="./custom/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.bundle.min.js"></script>
    <%--    <script type="text/javascript" src="./custom/js/popper.min.js"></script>--%>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        @font-face {
            font-family: Advent-Pro-Bold;
            src: url("./custom/font/Advent-Pro-Bold.ttf") format("truetype");
        }

        #nav-brand {
            font-family: Advent-Pro-Bold, "Segoe UI", sans-seri, serif;
            display: inline-flex;
        }

        #border-bottom-need {
            border-bottom: .25rem solid #FFFFFF;
            display: inline-flex;
        }

        /*Nav brand hover style*/
        #nav-brand:hover #border-bottom-need,
        #nav-brand:focus #border-bottom-need {
            border-bottom-color: rgba(255, 255, 255, .25);
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out;
        }

        a {
            text-decoration: none;
            font-style: normal;
        }

        .input-group > .form-control {
            width: 100%;
            border-radius: .25rem !important;
        }

        .input-icon {
            position: absolute;
            right: 0;
            z-index: 999;
            border-radius: 0 .3rem .3rem 0 !important;
        }

        #create-id-info {
            font-weight: 600;
        }

        .research-id-input {
            padding-right: 62px !important;
        }

        /*error 颜色变化样式*/
        .research-id-input-error {
            color: #212529;
            background-color: #fff;
            border-color: #d7bac2;
            outline: 0;
            box-shadow: 0 0 0 0.25rem rgb(204 61 80 / 38%);
        }

        .border-red {
            border: 1px solid #d7bac2 !important;
        }

        /*error 颜色样式变化 END*/

        .gap-for {
            height: 13px;
            display: block;
        }

        #input-container {
            text-align: center;
            margin: auto;
        }

        .form-check {
            width: fit-content;
            text-align: center;
            margin: auto;
        }

        #rem-me-check {
            float: left;
            margin-bottom: 10px;
            margin-top: 10px;
            font-size: 15px;
            color: white;
        }

        .big-gap-for {
            height: 60px;
        }

        #forget-inf {
            color: #0070c9;
            font-size: 15px;
        }

        #forget-inf:hover {
            color: #0070c9;
            text-decoration: underline;
        }

        body {
            font-family: 'Roboto', sans-serif;
        }

        .display-block {
            display: block;
        }


        .ahashakeheartache {
            -webkit-animation: kf_shake 0.4s 1 linear;
            -moz-animation: kf_shake 0.4s 1 linear;
            -o-animation: kf_shake 0.4s 1 linear;
        }

        @-webkit-keyframes kf_shake {
            0% {
                -webkit-transform: translate(30px);
            }
            20% {
                -webkit-transform: translate(-30px);
            }
            40% {
                -webkit-transform: translate(15px);
            }
            60% {
                -webkit-transform: translate(-15px);
            }
            80% {
                -webkit-transform: translate(8px);
            }
            100% {
                -webkit-transform: translate(0px);
            }
        }

        @-moz-keyframes kf_shake {
            0% {
                -moz-transform: translate(30px);
            }
            20% {
                -moz-transform: translate(-30px);
            }
            40% {
                -moz-transform: translate(15px);
            }
            60% {
                -moz-transform: translate(-15px);
            }
            80% {
                -moz-transform: translate(8px);
            }
            100% {
                -moz-transform: translate(0px);
            }
        }

        @-o-keyframes kf_shake {
            0% {
                -o-transform: translate(30px);
            }
            20% {
                -o-transform: translate(-30px);
            }
            40% {
                -o-transform: translate(15px);
            }
            60% {
                -o-transform: translate(-15px);
            }
            80% {
                -o-transform: translate(8px);
            }
            100% {
                -o-origin-transform: translate(0px);
            }
        }

    </style>


    <!-- Custom styles for this template -->
    <link href="./custom/css/cover.css" rel="stylesheet">
</head>
<body class="d-flex h-100 text-center text-white bg-dark">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <h3 id="nav-brand" class="float-md-start mb-0">
                <div id="border-bottom-need">Re</div>
                <div id="border-un-need">search</div>
            </h3>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <a class="nav-link active" aria-current="page" href="#">登录</a>
                <a class="nav-link" href="#">创建您的Research ID</a>
                <a class="nav-link" href="#">常见问题解答</a>
            </nav>
        </div>
    </header>

    <main class="px-3">

        <h1 id="create-id-info">Research ID</h1>
        <p class="lead" id="create-id-info-after">管理您的Research ID</p>

        <form class="needs-validation" novalidate>
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col col-7" id="input-container">
                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control research-id-input" placeholder="Research ID"
                                   name="username"
                                   aria-label="Dollar amount (with dot and two decimal places)" id="research-id-input">
                            <span class="input-group-text input-icon"><i class="bi bi-person-badge"></i></span>
                            <div class="invalid-tooltip" id="id-tooplip">
                                请输入Research ID
                            </div>
                        </div>

                        <div class="gap-for"></div>

                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control research-id-input" placeholder="密码" name="password"
                                   aria-label="Dollar amount (with dot and two decimal places)" id="password-input"
                                   required>
                            <span class="input-group-text input-icon"><i class="bi bi-lock"></i></span>
                            <div class="invalid-tooltip" id="password-tooltip">
                                请输入Research ID账户密码.
                            </div>
                        </div>

                        <div class="form-check" id="rem-me-check">
                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                            <label class="form-check-label" for="defaultCheck1">
                                <a data-bs-toggle="tooltip" data-bs-placement="bottom" title="选择此项，将保持三天自动登录">记住我的Research
                                    ID</a>
                            </label>
                        </div>

                        <div class="big-gap-for"></div>

                        <div class="d-grid gap-2">
                            <button type="button" class="btn  btn-primary" onclick="login()" id="login-button">
                                <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"
                                      id="login-loading" style="width: 1.07rem; height: 1.07rem; display: none"></span>
                                登录
                            </button>
                            <%--                            <input type="submit" />--%>

                            <%-- <button class="btn btn-primary" type="button">Button</button>--%>
                        </div>

                        <div class="gap-for"></div>

                        <p><a id="forget-inf" href="">忘记Research ID或密码?</a></p>
                    </div>
                </div>
            </div>
        </form>

    </main>

    <footer class="mt-auto text-white-50">
        <p><a class="text-white" href="https://github.com/Reagan1947/Research-Campus">
            <i class="bi bi-github"></i> Reagan1947/Research-Campus
        </a></p>
    </footer>
</div>
</body>


<script type="text/javascript">
    // 登录窗口shake动画
    function shakeInputBox() {
        // alert("toch")
        // e.preventDefault();
        $('.research-id-input').addClass('research-id-input-error')
        $('.input-icon').addClass('border-red')
        $('form').addClass('ahashakeheartache');
    }

    // 表格shake后的样式清理
    $('form').on('webkitAnimationEnd oanimationend msAnimationEnd animationend', function (e) {
        $('form').delay(200).removeClass('ahashakeheartache');
        $('.research-id-input').removeClass('research-id-input-error')
        $('.input-icon').removeClass('border-red')
    });

    function login() {
        var username = $.trim($("#research-id-input").val());
        var password = $.trim($("#password-input").val());
        var tag = 0;
        if (username === "") {
            $('#id-tooplip').addClass('display-block');
            setTimeout(function () {
                $('#id-tooplip').removeClass('display-block');
            }, 1500);
            tag = 1;
        }
        if (password === "") {
            $('#password-tooltip').addClass('display-block');
            setTimeout(function () {
                $('#password-tooltip').removeClass('display-block');
            }, 1500);
            tag = 1;
        }
        if (tag === 1) {
            return false;
        }
        //ajax去服务器端校验
        var data = {username: username, password: password};

        $('#login-loading').css('display','inline-block');
        $('#login-button').attr("disabled",true);

        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/login.do',
            data: data,
            dataType: 'json',
            success: function (data) {
                // console.log(data); //打印服务端返回的数据(调试用)
                if (data.code === 400) {
                    shakeInputBox();
                    $('#login-loading').css('display','none');
                    $('#login-button').removeAttr("disabled");
                } else if (data.code === 200) {
                    window.location.href="${pageContext.request.contextPath}/page.main";
                }
            }
        });
    }


</script>


</html>
