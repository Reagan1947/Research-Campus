<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 页面Head信息 -->
    <jsp:include page="P_common_head.jsp"/>
    <!-- 页面Head信息 / -->

    <style>
        body {
            margin: 20px;
        }

        .btn {
            padding-left: .75rem;
            padding-right: .75rem;
        }

        label.btn {
            margin-bottom: 0;
        }

        .d-flex > .btn {
            flex: 1;
        }

        .footer {
            font-size: .875rem;
        }

        .img-container,
        .img-preview {
            background-color: #f7f7f7;
            text-align: center;
            width: 100%;
        }

        .img-container {
            margin-bottom: 1rem;
            max-height: 497px;
            min-height: 200px;
        }

        @media (min-width: 768px) {
            .img-container {
                min-height: 497px;
            }
        }

        .img-container > img {
            max-width: 100%;
        }

        .docs-preview {
            margin-right: -1rem;
        }

        .img-preview {
            float: left;
            margin-bottom: .5rem;
            margin-right: .5rem;
            overflow: hidden;
        }

        .img-preview > img {
            max-width: 100%;
        }

        .preview-lg {
            height: 9rem;
            width: 16rem;
        }

        .preview-md {
            height: 4.5rem;
            width: 8rem;
        }

        .preview-sm {
            height: 2.25rem;
            width: 4rem;
        }

        .preview-xs {
            height: 1.125rem;
            margin-right: 0;
            width: 2rem;
        }

        .docs-data > .input-group {
            margin-bottom: .5rem;
        }

        .docs-data > .input-group > label {
            justify-content: center;
            min-width: 5rem;
        }

        .docs-data > .input-group > span {
            justify-content: center;
            min-width: 3rem;
        }

        .docs-buttons > .btn,
        .docs-buttons > .btn-group,
        .docs-buttons > .form-control {
            margin-bottom: .5rem;
            margin-right: .25rem;
        }

        .docs-toggles > .btn,
        .docs-toggles > .btn-group,
        .docs-toggles > .dropdown {
            margin-bottom: .5rem;
        }

        .docs-tooltip {
            display: block;
            margin: -.5rem -.75rem;
            padding: .5rem .75rem;
        }

        .docs-tooltip > .icon {
            margin: 0 -.25rem;
            vertical-align: top;
        }

        .tooltip-inner {
            white-space: normal;
        }

        .btn-upload .tooltip-inner,
        .btn-toggle .tooltip-inner {
            white-space: nowrap;
        }

        .btn-toggle {
            padding: .5rem;
        }

        .btn-toggle > .docs-tooltip {
            margin: -.5rem;
            padding: .5rem;
        }

        @media (max-width: 400px) {
            .btn-group-crop {
                margin-right: -1rem!important;
            }
            .btn-group-crop > .btn {
                padding-left: .5rem;
                padding-right: .5rem;
            }
            .btn-group-crop .docs-tooltip {
                margin-left: -.5rem;
                margin-right: -.5rem;
                padding-left: .5rem;
                padding-right: .5rem;
            }
        }

        .docs-options .dropdown-menu {
            width: 100%;
        }

        .docs-options .dropdown-menu > li {
            font-size: .875rem;
            padding-left: 1rem;
            padding-right: 1rem;
        }

        .docs-options .dropdown-menu > li:hover {
            background-color: #f7f7f7;
        }

        .docs-options .dropdown-menu > li > label {
            display: block;
        }

        .docs-cropped .modal-body {
            text-align: center;
        }

        .docs-cropped .modal-body > img,
        .docs-cropped .modal-body > canvas {
            max-width: 100%;
        }



    </style>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- 页面头部 -->
    <jsp:include page="P_header.jsp"/>
    <!-- 页面头部 / -->

    <!-- 页面侧边栏 -->
    <jsp:include page="P_aside.jsp"/>
    <!-- 页面侧边栏 / -->

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>发票</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">发票</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>


        <!-- Button to trigger twitter bootstrap modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" title="Zoom Out">
            <span class="fa fa-search-minus"></span> Launch Cropper in bootstrap modal
        </button>

        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                    </div>
                    <div class="modal-body">


                        <!-- Content -->
                        <div class="container">
                            <div class="row">
                                <div class="col-md-9">
                                    <!-- <h3>Demo:</h3> -->
                                    <div class="img-container">
                                        <img src="https://fengyuanchen.github.io/cropperjs/images/picture.jpg" alt="Picture">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <!-- <h3>Preview:</h3>
                              <div class="docs-preview clearfix">
                                <div class="img-preview preview-lg"></div>
                                <div class="img-preview preview-md"></div>
                                <div class="img-preview preview-sm"></div>
                                <div class="img-preview preview-xs"></div>
                              </div>
                              -->
                                    <!-- <h3>Data:</h3> -->
                                    <div class="docs-data">
                                        <div class="input-group input-group-sm">
                                            <label class="input-group-addon" for="dataX">X</label>
                                            <input type="text" class="form-control" id="dataX" placeholder="x">
                                            <span class="input-group-addon">px</span>
                                        </div>
                                        <div class="input-group input-group-sm">
                                            <label class="input-group-addon" for="dataY">Y</label>
                                            <input type="text" class="form-control" id="dataY" placeholder="y">
                                            <span class="input-group-addon">px</span>
                                        </div>
                                        <div class="input-group input-group-sm">
                                            <label class="input-group-addon" for="dataWidth">Width</label>
                                            <input type="text" class="form-control" id="dataWidth" placeholder="width">
                                            <span class="input-group-addon">px</span>
                                        </div>
                                        <div class="input-group input-group-sm">
                                            <label class="input-group-addon" for="dataHeight">Height</label>
                                            <input type="text" class="form-control" id="dataHeight" placeholder="height">
                                            <span class="input-group-addon">px</span>
                                        </div>
                                        <div class="input-group input-group-sm">
                                            <label class="input-group-addon" for="dataRotate">Rotate</label>
                                            <input type="text" class="form-control" id="dataRotate" placeholder="rotate">
                                            <span class="input-group-addon">deg</span>
                                        </div>
                                        <div class="input-group input-group-sm">
                                            <label class="input-group-addon" for="dataScaleX">ScaleX</label>
                                            <input type="text" class="form-control" id="dataScaleX" placeholder="scaleX">
                                        </div>
                                        <div class="input-group input-group-sm">
                                            <label class="input-group-addon" for="dataScaleY">ScaleY</label>
                                            <input type="text" class="form-control" id="dataScaleY" placeholder="scaleY">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="actions">
                                <div class="col-md-9 docs-buttons">
                                    <!-- <h3>Toolbar:</h3> -->
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="move" title="Move">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.setDragMode(&quot;move&quot;)">
              <span class="fa fa-arrows"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="setDragMode" data-option="crop" title="Crop">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.setDragMode(&quot;crop&quot;)">
              <span class="fa fa-crop"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.zoom(0.1)">
              <span class="fa fa-search-plus"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.zoom(-0.1)">
              <span class="fa fa-search-minus"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(-10, 0)">
              <span class="fa fa-arrow-left"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="Move Right">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(10, 0)">
              <span class="fa fa-arrow-right"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="Move Up">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(0, -10)">
              <span class="fa fa-arrow-up"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="Move Down">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.move(0, 10)">
              <span class="fa fa-arrow-down"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="Rotate Left">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.rotate(-45)">
              <span class="fa fa-rotate-left"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="Rotate Right">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.rotate(45)">
              <span class="fa fa-rotate-right"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="scaleX" data-option="-1" title="Flip Horizontal">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.scaleX(-1)">
              <span class="fa fa-arrows-h"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="scaleY" data-option="-1" title="Flip Vertical">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.scaleY(-1)">
              <span class="fa fa-arrows-v"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="crop" title="Crop">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.crop()">
              <span class="fa fa-check"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="clear" title="Clear">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.clear()">
              <span class="fa fa-remove"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="disable" title="Disable">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.disable()">
              <span class="fa fa-lock"></span>
                  </span>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="enable" title="Enable">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.enable()">
              <span class="fa fa-unlock"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.reset()">
              <span class="fa fa-refresh"></span>
                  </span>
                                        </button>
                                        <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                            <input type="file" class="sr-only" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="Import image with Blob URLs">
              <span class="fa fa-upload"></span>
                  </span>
                                        </label>
                                        <button type="button" class="btn btn-primary" data-method="destroy" title="Destroy">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.destroy()">
              <span class="fa fa-power-off"></span>
                  </span>
                                        </button>
                                    </div>

                                    <div class="btn-group btn-group-crop">
                                        <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="{ &quot;maxWidth&quot;: 4096, &quot;maxHeight&quot;: 4096 }">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.getCroppedCanvas({ maxWidth: 4096, maxHeight: 4096 })">
              Get Cropped Canvas
            </span>
                                        </button>
                                        <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 160, &quot;height&quot;: 90 }">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.getCroppedCanvas({ width: 160, height: 90 })">
              160&times;90
            </span>
                                        </button>
                                        <button type="button" class="btn btn-success" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 320, &quot;height&quot;: 180 }">
                  <span class="docs-tooltip" data-toggle="tooltip" title="cropper.getCroppedCanvas({ width: 320, height: 180 })">
              320&times;180
            </span>
                                        </button>
                                    </div>

                                    <!-- Show the cropped image in modal -->
                                    <div class="modal fade docs-cropped" id="getCroppedCanvasModal" role="dialog" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="getCroppedCanvasTitle">Cropped</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body"></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.jpg">Download</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.modal -->


                                </div>
                                <!-- /.docs-buttons -->

                                <div class="col-md-3 docs-toggles">
                                    <!-- <h3>Toggles:</h3> -->
                                    <div class="btn-group d-flex flex-nowrap" data-toggle="buttons">
                                        <label class="btn btn-primary active">
                                            <input type="radio" class="sr-only" id="aspectRatio1" name="aspectRatio" value="1.7777777777777777">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 16 / 9">
              16:9
            </span>
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1.3333333333333333">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 4 / 3">
              4:3
            </span>
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" class="sr-only" id="aspectRatio3" name="aspectRatio" value="1">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 1 / 1">
              1:1
            </span>
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" class="sr-only" id="aspectRatio4" name="aspectRatio" value="0.6666666666666666">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: 2 / 3">
              2:3
            </span>
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" class="sr-only" id="aspectRatio5" name="aspectRatio" value="NaN">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="aspectRatio: NaN">
              Free
            </span>
                                        </label>
                                    </div>

                                    <div class="btn-group d-flex flex-nowrap" data-toggle="buttons">
                                        <label class="btn btn-primary active">
                                            <input type="radio" class="sr-only" id="viewMode0" name="viewMode" value="0" checked>
                                            <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 0">
              VM0
            </span>
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" class="sr-only" id="viewMode1" name="viewMode" value="1">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 1">
              VM1
            </span>
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" class="sr-only" id="viewMode2" name="viewMode" value="2">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 2">
              VM2
            </span>
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" class="sr-only" id="viewMode3" name="viewMode" value="3">
                                            <span class="docs-tooltip" data-toggle="tooltip" title="View Mode 3">
              VM3
            </span>
                                        </label>
                                    </div>

                                    <div class="dropdown dropup docs-options">
                                        <button type="button" class="btn btn-primary btn-block dropdown-toggle" id="toggleOptions" data-toggle="dropdown" aria-expanded="true">
                                            Toggle Options
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="toggleOptions">
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="responsive" checked> responsive
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="restore" checked> restore
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="checkCrossOrigin" checked> checkCrossOrigin
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="checkOrientation" checked> checkOrientation
                                                </label>
                                            </li>

                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="modal" checked> modal
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="guides" checked> guides
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="center" checked> center
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="highlight" checked> highlight
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="background" checked> background
                                                </label>
                                            </li>

                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="autoCrop" checked> autoCrop
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="movable" checked> movable
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="rotatable" checked> rotatable
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="scalable" checked> scalable
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="zoomable" checked> zoomable
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="zoomOnTouch" checked> zoomOnTouch
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="zoomOnWheel" checked> zoomOnWheel
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="cropBoxMovable" checked> cropBoxMovable
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="cropBoxResizable" checked> cropBoxResizable
                                                </label>
                                            </li>
                                            <li class="dropdown-item">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" name="toggleDragModeOnDblclick" checked> toggleDragModeOnDblclick
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- /.dropdown -->



                                </div>
                                <!-- /.docs-toggles -->
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>


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

    $(document).ready(function() {

        var Cropper = window.Cropper;
        var URL = window.URL || window.webkitURL;
        var container = document.querySelector('.img-container');
        var image = container.getElementsByTagName('img').item(0);
        var cropper;
        var options;

        $('#myModal').on('shown.bs.modal', function(e) {

            //init_cropper();
            cropper.destroy();
            cropper = new Cropper(image, options);
        })

        window.onload = init_cropper();

        function init_cropper() {

            'use strict';

            var download = document.getElementById('download');
            var actions = document.getElementById('actions');
            var dataX = document.getElementById('dataX');
            var dataY = document.getElementById('dataY');
            var dataHeight = document.getElementById('dataHeight');
            var dataWidth = document.getElementById('dataWidth');
            var dataRotate = document.getElementById('dataRotate');
            var dataScaleX = document.getElementById('dataScaleX');
            var dataScaleY = document.getElementById('dataScaleY');
            options = {
                aspectRatio: 321 / 180,
                preview: '.img-preview',
                ready: function(e) {
                    console.log(e.type);
                },
                cropstart: function(e) {
                    console.log(e.type, e.detail.action);
                },
                cropmove: function(e) {
                    console.log(e.type, e.detail.action);
                },
                cropend: function(e) {
                    console.log(e.type, e.detail.action);
                },
                crop: function(e) {
                    var data = e.detail;

                    console.log(e.type);
                    dataX.value = Math.round(data.x);
                    dataY.value = Math.round(data.y);
                    dataHeight.value = Math.round(data.height);
                    dataWidth.value = Math.round(data.width);
                    dataRotate.value = typeof data.rotate !== 'undefined' ? data.rotate : '';
                    dataScaleX.value = typeof data.scaleX !== 'undefined' ? data.scaleX : '';
                    dataScaleY.value = typeof data.scaleY !== 'undefined' ? data.scaleY : '';
                },
                zoom: function(e) {
                    console.log(e.type, e.detail.ratio);
                }
            };
            cropper = new Cropper(image, options);
            var originalImageURL = image.src;
            var uploadedImageType = 'image/jpeg';
            var uploadedImageURL;

            // Tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Buttons
            if (!document.createElement('canvas').getContext) {
                $('button[data-method="getCroppedCanvas"]').prop('disabled', true);
            }

            if (typeof document.createElement('cropper').style.transition === 'undefined') {
                $('button[data-method="rotate"]').prop('disabled', true);
                $('button[data-method="scale"]').prop('disabled', true);
            }

            // Download
            if (typeof download.download === 'undefined') {
                download.className += ' disabled';
            }

            // Options
            actions.querySelector('.docs-toggles').onchange = function(event) {
                var e = event || window.event;
                var target = e.target || e.srcElement;
                var cropBoxData;
                var canvasData;
                var isCheckbox;
                var isRadio;

                if (!cropper) {
                    return;
                }

                if (target.tagName.toLowerCase() === 'label') {
                    target = target.querySelector('input');
                }

                isCheckbox = target.type === 'checkbox';
                isRadio = target.type === 'radio';

                if (isCheckbox || isRadio) {
                    if (isCheckbox) {
                        options[target.name] = target.checked;
                        cropBoxData = cropper.getCropBoxData();
                        canvasData = cropper.getCanvasData();

                        options.ready = function() {
                            console.log('ready');
                            cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
                        };
                    } else {
                        options[target.name] = target.value;
                        options.ready = function() {
                            console.log('ready');
                        };
                    }

                    // Restart
                    cropper.destroy();
                    cropper = new Cropper(image, options);
                }
            };

            // Methods
            actions.querySelector('.docs-buttons').onclick = function(event) {
                var e = event || window.event;
                var target = e.target || e.srcElement;
                var cropped;
                var result;
                var input;
                var data;

                if (!cropper) {
                    return;
                }

                while (target !== this) {
                    if (target.getAttribute('data-method')) {
                        break;
                    }

                    target = target.parentNode;
                }

                if (target === this || target.disabled || target.className.indexOf('disabled') > -1) {
                    return;
                }

                data = {
                    method: target.getAttribute('data-method'),
                    target: target.getAttribute('data-target'),
                    option: target.getAttribute('data-option') || undefined,
                    secondOption: target.getAttribute('data-second-option') || undefined
                };

                cropped = cropper.cropped;

                if (data.method) {
                    if (typeof data.target !== 'undefined') {
                        input = document.querySelector(data.target);

                        if (!target.hasAttribute('data-option') && data.target && input) {
                            try {
                                data.option = JSON.parse(input.value);
                            } catch (e) {
                                console.log(e.message);
                            }
                        }
                    }

                    switch (data.method) {
                        case 'rotate':
                            if (cropped) {
                                cropper.clear();
                            }

                            break;

                        case 'getCroppedCanvas':
                            try {
                                data.option = JSON.parse(data.option);
                            } catch (e) {
                                console.log(e.message);
                            }

                            if (uploadedImageType === 'image/jpeg') {
                                if (!data.option) {
                                    data.option = {};
                                }

                                data.option.fillColor = '#fff';
                            }

                            break;
                    }

                    result = cropper[data.method](data.option, data.secondOption);

                    switch (data.method) {
                        case 'rotate':
                            if (cropped) {
                                cropper.crop();
                            }

                            break;

                        case 'scaleX':
                        case 'scaleY':
                            target.setAttribute('data-option', -data.option);
                            break;

                        case 'getCroppedCanvas':
                            if (result) {
                                // Bootstrap's Modal
                                $('#getCroppedCanvasModal').modal().find('.modal-body').html(result);

                                if (!download.disabled) {
                                    download.href = result.toDataURL(uploadedImageType);
                                }
                            }

                            break;

                        case 'destroy':
                            cropper = null;

                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                                uploadedImageURL = '';
                                image.src = originalImageURL;
                            }

                            break;
                    }

                    if (typeof result === 'object' && result !== cropper && input) {
                        try {
                            input.value = JSON.stringify(result);
                        } catch (e) {
                            console.log(e.message);
                        }
                    }
                }
            };

            document.body.onkeydown = function(event) {
                var e = event || window.event;

                if (!cropper || this.scrollTop > 300) {
                    return;
                }

                switch (e.keyCode) {
                    case 37:
                        e.preventDefault();
                        cropper.move(-1, 0);
                        break;

                    case 38:
                        e.preventDefault();
                        cropper.move(0, -1);
                        break;

                    case 39:
                        e.preventDefault();
                        cropper.move(1, 0);
                        break;

                    case 40:
                        e.preventDefault();
                        cropper.move(0, 1);
                        break;
                }
            };

            // Import image
            var inputImage = document.getElementById('inputImage');

            if (URL) {
                inputImage.onchange = function() {
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
        };

    });


</script>
</body>
</html>
