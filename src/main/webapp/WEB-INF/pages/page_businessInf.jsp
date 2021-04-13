<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>业务信息</title>
    <link rel="stylesheet" href="https://unpkg.com/bpmn-js@8.3.0/dist/assets/diagram-js.css"/>

    <style>
        .console {
            width: 100%;
            min-height: 80px;
            border: none;
            padding: 0;
        }

        .djs-palette.two-column.open {
            display: none;
        }

        .upper {
            text-transform: uppercase;
        }

        .console textarea {
            width: 100%;
            min-height: 80px;
        }

        .bjs-container {
            min-height: 500px !important;
            width: 100%;
            text-align: center;
            display: table;
        }

        .djs-container {
            vertical-align: middle;
            text-align: center;
            display: table-cell;
            margin: 0 auto;
        }
        .djs-context-pad.open {
            display: none!important;
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
                        <h1>业务信息</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">业务信息</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6" id="leftCard">
                        <!-- 表格开始 -->
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">流程列表与表单</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <form>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>节点信息</label>
                                                <input type="text" class="form-control" placeholder="node Information" disabled=""
                                                       style="background-color: #fff;" id="nodeInf">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="input-group">
                                                <label>选择该节点对应表单</label>
                                                <div class="input-group">
                                                    <select class="form-control">
                                                        <option>选项 1</option>
                                                        <option>选项 2</option>
                                                        <option>选项 3</option>
                                                        <option>选项 4</option>
                                                        <option>选项 5</option>
                                                    </select>
                                                    <span class="input-group-append">
                                                    <button type="button" class="btn btn-default" title="预览"><i
                                                            class="fas fa-search"></i></button>
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <button class="btn btn-default" onclick="updateProper()">测试按钮</button>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <label>表单参数</label>
                                        <div id="jsGrid"></div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>

                    <div class="col-md-6 ml-md-auto" id="rightCard">
                        <!-- 表格开始 -->
                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title" style="margin-top: 5px;"><span class="upper"
                                                                                      style="font-weight: bold; color: #2980bb;">BPMN</span>
                                    <span style="font-size: 20px;position: relative;bottom: 1px;">|</span>
                                    <span class="upper">${bpmnList.bpmnName} - ${bpmnList.bpmnUUID}</span>
                                </h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" onclick="CpCard()"
                                            style="margin-top: auto;" id="cPButton">
                                        <i class="fas fa-chevron-left" id="openTag"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <%--                                这里是卡片内容--%>
                                <div class="header">
                                    <h4>关联业务流程与表单</h4>
                                    <p>
                                        您可以点击下方流程图中的任务流程，在左侧设置栏中为其设置该流程所需的表单。您可在流程表单管理中，管理您的表单信息。
                                    </p>
                                </div>

                                <hr>

                                <div class="canvas">
                                    <div id="js-canvas"></div>
                                </div>

                                <hr>

                                <%--                                <div class="console">--%>
                                <%--                                    <h4>节点信息</h4>--%>
                                <%--                                    <textarea id="js-console"></textarea>--%>
                                <%--                                </div>--%>


                                <div class="form-group console">
                                    <label for="js-console">节点信息</label>
                                    <textarea class="form-control" id="js-console" rows="3"></textarea>
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>

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
    function updateProper() {
        modeling.updateProperties(taskElementClick, {
            name: '我是修改后的虚线节点',
        })

        console.log(taskElementClick);
    }

    var clients = [
        {"Name": "Otto Clay", "Age": 25, "Country": 1, "Address": "Ap #897-1459 Quam Avenue", "Married": false},
        {"Name": "Connor Johnston", "Age": 45, "Country": 2, "Address": "Ap #370-4647 Dis Av.", "Married": true},
        {"Name": "Lacey Hess", "Age": 29, "Country": 3, "Address": "Ap #365-8835 Integer St.", "Married": false},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false}
    ];

    var countries = [
        {Name: "", Id: 0},
        {Name: "United States", Id: 1},
        {Name: "Canada", Id: 2},
        {Name: "United Kingdom", Id: 3}
    ];

    $("#jsGrid").jsGrid({
        width: "100%",
        height: "400px",

        inserting: true,
        editing: true,
        sorting: true,
        paging: true,

        data: clients,

        fields: [
            {name: "参数名称", type: "text", width: 150, validate: "required"},
            {name: "参数类型", type: "number", width: 50},
            {name: "默认值", type: "text", width: 200},
            {name: "备注", type: "select", items: countries, valueField: "Id", textField: "Name"},
        ]
    });
</script>

<script>
    $('#js-console').overlayScrollbars({ /* your options */});

    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] === variable) {
                return pair[1];
            }
        }
        return (false);
    }

    $(function () {
        $(".djs-container svg").attr("viewBox", "0 0 1083 500");
        //任何需要执行的js特效
    });

    var switchTag = "0"
    var globalUUID = getQueryVariable("uuid");

    function CpCard() {

        if (switchTag === "0") {
            $("#leftCard").hide("fade", "fast");
            $('#rightCard').delay(200).toggleClass("col-md-6 col-md-12", "fast", "swing");
            $('#openTag').delay(100).toggleClass("fa-chevron-right fa-chevron-left", "fade")
            switchTag = "1";
        } else {
            $('#rightCard').toggleClass("col-md-6 col-md-12", "fast", "swing");
            $("#leftCard").delay(200).show("fade", "fast");
            $('#openTag').toggleClass("fa-chevron-right fa-chevron-left", "slow");
            switchTag = "0";
        }

    }

</script>

<!-- viewer -->
<script src="https://unpkg.com/bpmn-js@8.3.0/dist/bpmn-viewer.development.js"></script>
<link rel="stylesheet" href="https://unpkg.com/bpmn-js@8.3.0/dist/assets/diagram-js.css"/>
<link rel="stylesheet" href="https://unpkg.com/bpmn-js@8.3.0/dist/assets/bpmn-font/css/bpmn.css"/>

<script src="https://unpkg.com/bpmn-js@8.3.0/dist/bpmn-modeler.development.js"></script>
<!-- app -->
<script>
    var consoleDom = document.querySelector('#js-console');
    var diagramXML = "";
    var taskElementClick;

    $.ajax({
        type: 'get',
        url: "https://${sessionScope.bucketName}.cos.${sessionScope.region}.myqcloud.com/bpmn/" + "${bpmnList.bpmnUUID}" + ".bpmn",
        //Servlet请求路径
        dataType: "text",
        async: false,
        success: function (data) {
            diagramXML = data;
        }
    });


    function log() {
        consoleDom.value = Array.prototype.slice.call(arguments).map(function (e) {
            return String(e);
        }).join(' ');

        // consoleDom.value += '\n';
        // consoleDom.scrollTop = consoleDom.scrollHeight;
    }

    // the diagram to display
    // you may load it asynchronously via ajax, too

    <%--var diagramXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\"\r\n             xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\"\r\n             targetNamespace=\"\"\r\n             xsi:schemaLocation=\"http://www.omg.org/spec/BPMN/20100524/MODEL http://www.omg.org/spec/BPMN/2.0/20100501/BPMN20.xsd\">\r\n<collaboration id=\"sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\">\r\n    <participant id=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\" name=\"Customer\" processRef=\"sid-C3803939-0872-457F-8336-EAE484DC4A04\">\r\n    </participant>\r\n</collaboration>\r\n<process id=\"sid-C3803939-0872-457F-8336-EAE484DC4A04\" isClosed=\"false\" isExecutable=\"false\" name=\"Customer\" processType=\"None\">\r\n    <extensionElements/>\r\n    <laneSet id=\"sid-b167d0d7-e761-4636-9200-76b7f0e8e83a\">\r\n        <lane id=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\">\r\n            <flowNodeRef>sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138</flowNodeRef>\r\n            <flowNodeRef>sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26</flowNodeRef>\r\n            <flowNodeRef>SCAN_OK</flowNodeRef>\r\n            <flowNodeRef>sid-E49425CF-8287-4798-B622-D2A7D78EF00B</flowNodeRef>\r\n            <flowNodeRef>END_EVENT</flowNodeRef>\r\n            <flowNodeRef>sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9</flowNodeRef>\r\n        </lane>\r\n    </laneSet>\r\n    <startEvent id=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" name=\"Notices&#10;QR code\">\r\n        <outgoing>sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD</outgoing>\r\n    </startEvent>\r\n    <task completionQuantity=\"1\" id=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" isForCompensation=\"false\" name=\"Scan QR code\" startQuantity=\"1\">\r\n        <incoming>sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D</incoming>\r\n        <outgoing>sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A</outgoing>\r\n    </task>\r\n    <exclusiveGateway gatewayDirection=\"Diverging\" id=\"SCAN_OK\" name=\"Scan successful?&#10;\">\r\n        <incoming>sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A</incoming>\r\n        <outgoing>sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB</outgoing>\r\n        <outgoing>sid-337A23B9-A923-4CCE-B613-3E247B773CCE</outgoing>\r\n    </exclusiveGateway>\r\n    <task completionQuantity=\"1\" id=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" isForCompensation=\"false\" name=\"Open product information in mobile  app\" startQuantity=\"1\">\r\n        <incoming>sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB</incoming>\r\n        <outgoing>sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C</outgoing>\r\n    </task>\r\n    <endEvent id=\"END_EVENT\" name=\"Is informed\">\r\n        <incoming>sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C</incoming>\r\n    </endEvent>\r\n    <exclusiveGateway gatewayDirection=\"Converging\" id=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\">\r\n        <incoming>sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD</incoming>\r\n        <incoming>sid-337A23B9-A923-4CCE-B613-3E247B773CCE</incoming>\r\n        <outgoing>sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D</outgoing>\r\n    </exclusiveGateway>\r\n    <sequenceFlow id=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\" sourceRef=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" targetRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\"/>\r\n    <sequenceFlow id=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\" sourceRef=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" targetRef=\"SCAN_OK\"/>\r\n    <sequenceFlow id=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\" sourceRef=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" targetRef=\"END_EVENT\"/>\r\n    <sequenceFlow id=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\" name=\"Yes\" sourceRef=\"SCAN_OK\" targetRef=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\"/>\r\n    <sequenceFlow id=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\" sourceRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\" targetRef=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\"/>\r\n    <sequenceFlow id=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE\" name=\"No\" sourceRef=\"SCAN_OK\" targetRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\"/>\r\n</process>\r\n<bpmndi:BPMNDiagram id=\"sid-74620812-92c4-44e5-949c-aa47393d3830\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\" id=\"sid-cdcae759-2af7-4a6d-bd02-53f3352a731d\">\r\n        <bpmndi:BPMNShape bpmnElement=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\" id=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F_gui\" isHorizontal=\"true\">\r\n            <omgdc:Bounds height=\"250.0\" width=\"933.0\" x=\"42.5\" y=\"75.0\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\r\n                <omgdc:Bounds height=\"59.142852783203125\" width=\"12.000000000000014\" x=\"47.49999999999999\" y=\"170.42857360839844\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNShape bpmnElement=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\" id=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254_gui\" isHorizontal=\"true\">\r\n            <omgdc:Bounds height=\"250.0\" width=\"903.0\" x=\"72.5\" y=\"75.0\"/>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNShape bpmnElement=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" id=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138_gui\">\r\n            <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"150.0\" y=\"165.0\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\r\n                <omgdc:Bounds height=\"22.0\" width=\"46.35714340209961\" x=\"141.8214282989502\" y=\"197.0\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNShape bpmnElement=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" id=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26_gui\">\r\n            <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"352.5\" y=\"140.0\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\r\n                <omgdc:Bounds height=\"12.0\" width=\"84.0\" x=\"360.5\" y=\"172.0\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNShape bpmnElement=\"SCAN_OK\" id=\"SCAN_OK_gui\" isMarkerVisible=\"true\">\r\n            <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"550.0\" y=\"160.0\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\r\n                <omgdc:Bounds height=\"12.0\" width=\"102.0\" x=\"521.0\" y=\"127.0\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNShape bpmnElement=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" id=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B_gui\">\r\n            <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"687.5\" y=\"140.0\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\r\n                <omgdc:Bounds height=\"36.0\" width=\"83.14285278320312\" x=\"695.9285736083984\" y=\"162.0\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNShape bpmnElement=\"END_EVENT\" id=\"END_EVENT_gui\">\r\n            <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"865.0\" y=\"166.0\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\r\n                <omgdc:Bounds height=\"11.0\" width=\"62.857147216796875\" x=\"847.5714263916016\" y=\"196.0\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNShape bpmnElement=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\" id=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9_gui\" isMarkerVisible=\"true\">\r\n            <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"160.0\"/>\r\n        </bpmndi:BPMNShape>\r\n        <bpmndi:BPMNEdge bpmnElement=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\" id=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A_gui\">\r\n            <omgdi:waypoint x=\"452.5\" y=\"180\"/>\r\n            <omgdi:waypoint x=\"550.0\" y=\"180\"/>\r\n        </bpmndi:BPMNEdge>\r\n        <bpmndi:BPMNEdge bpmnElement=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\" id=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB_gui\">\r\n            <omgdi:waypoint x=\"590.0\" y=\"180\"/>\r\n            <omgdi:waypoint x=\"687.5\" y=\"180\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\r\n                <omgdc:Bounds height=\"12.048704338048935\" width=\"16.32155963195521\" x=\"597.8850936986571\" y=\"155\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNEdge>\r\n        <bpmndi:BPMNEdge bpmnElement=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\" id=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD_gui\">\r\n            <omgdi:waypoint x=\"180.0\" y=\"180\"/>\r\n            <omgdi:waypoint x=\"240.0\" y=\"180\"/>\r\n        </bpmndi:BPMNEdge>\r\n        <bpmndi:BPMNEdge bpmnElement=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\" id=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D_gui\">\r\n            <omgdi:waypoint x=\"280.0\" y=\"180\"/>\r\n            <omgdi:waypoint x=\"352.5\" y=\"180\"/>\r\n        </bpmndi:BPMNEdge>\r\n        <bpmndi:BPMNEdge bpmnElement=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\" id=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C_gui\">\r\n            <omgdi:waypoint x=\"787.5\" y=\"180.0\"/>\r\n            <omgdi:waypoint x=\"865.0\" y=\"180.0\"/>\r\n        </bpmndi:BPMNEdge>\r\n        <bpmndi:BPMNEdge bpmnElement=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE\" id=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE_gui\">\r\n            <omgdi:waypoint x=\"570.5\" y=\"200.0\"/>\r\n            <omgdi:waypoint x=\"570.5\" y=\"269.0\"/>\r\n            <omgdi:waypoint x=\"260.5\" y=\"269.0\"/>\r\n            <omgdi:waypoint x=\"260.5\" y=\"200.0\"/>\r\n            <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\r\n                <omgdc:Bounds height=\"21.4285888671875\" width=\"12.0\" x=\"550\" y=\"205\"/>\r\n            </bpmndi:BPMNLabel>\r\n        </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n    <bpmndi:BPMNLabelStyle id=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\r\n        <omgdc:Font isBold=\"false\" isItalic=\"false\" isStrikeThrough=\"false\" isUnderline=\"false\" name=\"Arial\" size=\"11.0\"/>\r\n    </bpmndi:BPMNLabelStyle>\r\n    <bpmndi:BPMNLabelStyle id=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\r\n        <omgdc:Font isBold=\"false\" isItalic=\"false\" isStrikeThrough=\"false\" isUnderline=\"false\" name=\"Arial\" size=\"12.0\"/>\r\n    </bpmndi:BPMNLabelStyle>\r\n</bpmndi:BPMNDiagram>\r\n</definitions>\r\n\r\n";--%>


    var viewer = new BpmnJS({
        additionalModules: [
            {
                bendpoints: ["value", {}],
                paletteProvider: ["value", ""], // 禁用左面板
                labelEditingProvider: ["value", ""], // 禁用编辑
                contextPadProvider: ["value", ""], // 禁用点击出现的contextPad
                dragging: ["value", {
                    init(){

                }
                }],
            }
        ],
        container: document.querySelector('#js-canvas'),
        height: 400,
    });

    var modeling = viewer.get('modeling');


    viewer.importXML(diagramXML).then(function () {

        // diagram is loaded, add interaction to it

        // Option 1:
        // directly hook into internal diagram events
        // this allows you to access the clicked element directly
        var elementRegistry = viewer.get('elementRegistry');
        // var userTaskElement = elementRegistry.get('UserTask_0yt5vgw'),
        //     userTask = userTaskElement.businessObject;
        console.log(elementRegistry) // 开始

        var eventBus = viewer.get('eventBus');

        // you may hook into any of the following events
        var events = [
            'element.hover',
            'element.out',
            'element.click',
            'element.dblclick',
            'element.mousedown',
            'element.mouseup'
        ];

        events.forEach(function (event) {

            eventBus.on(event, function (e) {

                // e.element = the model element
                // e.gfx = the graphical element

                // log(event, 'on', e.element.id);
                if (e.element.id.split("_")[0] !== "leaveProcess" && new RegExp('Task').test(e.element.id)) {
                    var taskElement = elementRegistry.get(e.element.id);
                    var taskNode = taskElement.businessObject;
                    var nodeName = taskNode.name;
                    if (nodeName === undefined) {
                        log("类型: " + e.element.id.split("_")[0] + "   节点Key: " + e.element.id)
                    } else {
                        log("类型: " + e.element.id.split("_")[0] + "   名称: " + nodeName + "   节点Key: " + e.element.id)
                    }
                    if (event === "element.click" && taskElement.type !== undefined) {
                        if (taskElement.type === 'bpmn:Task' || taskElement.type === 'bpmn:UserTask') {
                            taskElementClick = elementRegistry.get(e.element.id);
                            $('#nodeInf').val(nodeName + "-" + e.element.id);
                            toastr.success("已选中流程节点: " + taskElementClick.businessObject.name);
                        }

                    }
                }
            });
        });

        // eventBus.on('element.click', function (e){
        //    alert(e.element.)
        // });


        // Option 2:
        // directly attach an event listener to an elements graphical representation

        // each model element a data-element-id attribute attached to it in HTML

        // select the end event
        // var endEventNode = $('#js-canvas[data-element-id^="EndEvent"]');
        // endEventNode.addEventListener('click', function(e) {
        //     alert('clicked the end event!');
        // });

    }).catch(function (err) {

        console.error('failed to load diagram');
        console.error(err);

        return log('failed to load diagram', err);
    });
</script>
</body>
</html>
