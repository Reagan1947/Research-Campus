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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">



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
        #nav-brand:focus #border-bottom-need{
            border-bottom-color: rgba(255, 255, 255, .25);
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out;
            /*color: #1979ff;*/
            /*opacity: 1;*/
            /*transition-duration: 0.1s;*/
        }
        /*#nav-brand:hover #border-un-need{*/
        /*    color: #1979ff;*/
        /*    !*opacity: 1;*!*/
        /*    !*transition-duration: 0.1s;*!*/
        /*}*/


        a {
            text-decoration: none;
            font-style: normal;
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
        <h1>Cover your page.</h1>
        <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the
            text, and add your own fullscreen background photo to make it your own.</p>
        <p class="lead">
            <a href="#" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Learn more</a>
        </p>
    </main>

    <footer class="mt-auto text-white-50">
        <p><a class="text-white" href="https://github.com/Reagan1947/Research-Campus">
            <i class="bi bi-github"></i> Reagan1947/Research-Campus
        </a></p>
    </footer>
</div>


</body>
</html>
