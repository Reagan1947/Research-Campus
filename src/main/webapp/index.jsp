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
    <script type="text/javascript" src="custom/js/jquery-3.6.0.min.js"></script>
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

        <form action="${pageContext.request.contextPath}/login.do" method="post">
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col col-7" id="input-container">
                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control research-id-input" placeholder="Research ID" name="username"
                                   aria-label="Dollar amount (with dot and two decimal places)" id="research-id-input">
                            <span class="input-group-text input-icon"><i class="bi bi-person-badge"></i></span>
                        </div>

                        <div class="gap-for"></div>

                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control research-id-input" placeholder="密码" name="password"
                                   aria-label="Dollar amount (with dot and two decimal places)" id="password-input">
                            <span class="input-group-text input-icon"><i class="bi bi-lock"></i></span>
                        </div>

                        <div class="form-check" id="rem-me-check">
                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                            <label class="form-check-label" for="defaultCheck1">
                                记住我的Research ID
                            </label>
                        </div>

                        <div class="big-gap-for"></div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn  btn-primary">登录</button>
                            <%--                        <button class="btn btn-primary" type="button">Button</button>--%>
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

</script>


</html>
