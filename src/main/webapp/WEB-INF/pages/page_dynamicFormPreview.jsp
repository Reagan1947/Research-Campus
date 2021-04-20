<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>动态表单预览</title>

    <style>
        .formitem-style {
            /*display: inline-block;*/
        }

        span.el-input-number__decrease > i {
            line-height: 30px;
        }

        span.el-input-number__decrease.is-disabled > i {
            line-height: 30px;
        }

        span.el-input-number__increase > i {
            line-height: 30px;
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
                        <h1>动态表单预览</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">动态表单预览</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content" id="formContent">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6">
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

                                        <div v-if="eleList">
                                            <!-- 表单生成器 -->
                                            <el-form
                                                    v-if="eleList.list.length > 0"
                                                    :size="eleList.config.size"
                                                    :label-position="eleList.config.labelPosition"
                                                    :label-width="eleList.config.labelWidth + 'px'"
                                                    ref="c_form"
                                            >
                                                <!-- 循环显示表单信息 -->
                                                <div
                                                        v-for="(item, index) in eleList.list"
                                                        :key="index"
                                                        class="formitem-style"
                                                >
                                                    <el-form-item :label="item.name" :required="item.options.required">
                                                        <dialogformitems
                                                                :ele-item="item"
                                                                :ele-config="eleList.config"
                                                        ></dialogformitems>
                                                    </el-form-item>
                                                </div>
                                            </el-form>
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
                                                <h3 class="timeline-header no-border"><a href="#">填写申请表</a></h3>
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
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>

<script>
    //Date picker
    $('#reservation').daterangepicker();


    $('#reservationdate').datetimepicker({
        format: 'L'
    });

    var eleList;
    eleList = JSON.parse(${dynamicForm});

    var dialogformitems = {
        props: ["eleItem", "eleConfig"],
        template: `<div v-if="eleItem.type === 'input'">
      <el-input
        v-model="eleItem.options.defaultValue"
        :placeholder="eleItem.options.placeholder"
        :style="{ width: eleItem.options.width }"
        :disabled="eleItem.options.disabled"
        :clearable="eleItem.options.clearable"
        :show-password="eleItem.options.password"
        :maxlength="eleItem.options.maxlength"
        show-word-limit
      ></el-input>
    </div>
    <div v-else-if="eleItem.type === 'textarea'">
      <el-input
        type="textarea"
        :style="{ width: eleItem.options.width }"
        :rows="eleItem.options.rows"
        v-model="eleItem.options.defaultValue"
        :placeholder="eleItem.options.placeholder"
        :disabled="eleItem.options.disabled"
        :maxlength="eleItem.options.maxlength"
        show-word-limit
      >
      </el-input>
    </div>
    <div v-else-if="eleItem.type === 'radio'">
      <el-radio-group v-model="eleItem.options.defaultValue">
        <el-radio
          v-for="(item, index) in eleItem.options.valueData"
          :key="index"
          :label="item.label"
          :style="{ display: eleItem.options.inline }"
          :class="{ radioLineHeight: !eleItem.options.border }"
          :disabled="eleItem.options.disabled"
          :border="eleItem.options.border"
          >{{ item.value }}</el-radio
        >
      </el-radio-group>
    </div>
    <div v-else-if="eleItem.type === 'checkbox'">
      <el-checkbox-group
        v-model="eleItem.options.defaultValue"
        :max="eleItem.options.max"
      >
        <el-checkbox
          v-for="(item, index) in eleItem.options.valueData"
          :key="index"
          :label="item.label"
          :style="{ display: eleItem.options.inline }"
          :disabled="eleItem.options.disabled"
          :border="eleItem.options.border"
          >{{ item.value }}</el-checkbox
        >
      </el-checkbox-group>
    </div>
    <div v-else-if="eleItem.type === 'inputNumber'">
      <el-input-number
        v-model="eleItem.options.defaultValue"
        :min="eleItem.options.min"
        :max="eleItem.options.max"
        :controls-position="eleItem.options.position"
        :disabled="eleItem.options.disabled"
      ></el-input-number>
    </div>
    <div v-else-if="eleItem.type === 'select'">
      <el-select
        v-model="eleItem.options.defaultValue"
        placeholder="请选择一个选项"
        :style="{ width: eleItem.options.width }"
        :multiple="eleItem.options.multiple"
        :clearable="eleItem.options.clearable"
        :disabled="eleItem.options.disabled"
      >
        <el-option
          v-for="item in eleItem.options.valueData"
          :key="item.label"
          :label="item.value"
          :value="item.label"
        >
        </el-option>
      </el-select>
    </div>
    <div v-else-if="eleItem.type === 'slider'">
      <el-slider
        v-model="eleItem.options.defaultValue"
        :disabled="eleItem.options.disabled"
        :min="eleItem.options.min"
        :max="eleItem.options.max"
      ></el-slider>
    </div>
    <div v-else-if="eleItem.type === 'rate'">
      <el-rate
        v-model="eleItem.options.defaultValue"
        :max="eleItem.options.max"
        :disabled="eleItem.options.disabled"
        :show-text="eleItem.options.text"
        style="margin-top: 6px"
      ></el-rate>
    </div>
    <div v-else-if="eleItem.type === 'timePicker'">
      <el-time-picker
        :style="{ width: eleItem.options.width }"
        v-model="eleItem.options.defaultValue"
        placeholder="选择时间"
        :disabled="eleItem.options.disabled"
        :clearable="eleItem.options.clearable"
        :default-value="new Date()"
        value-format="HH:mm:ss"
        format="HH:mm:ss"
      >
      </el-time-picker>
    </div>
    <div v-else-if="eleItem.type === 'datePicker'">
      <el-date-picker
        v-model="eleItem.options.defaultValue"
        placeholder="选择日期"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        :value-format="eleItem.options.valueFormat"
        :default-value="new Date()"
        :style="{ width: eleItem.options.width }"
        :type="eleItem.options.type"
        :disabled="eleItem.options.disabled"
        :clearable="eleItem.options.clearable"
      >
      </el-date-picker>
    </div>
    <div v-else-if="eleItem.type === 'text'">
      <div
        :class="{ 'form-text': eleConfig.labelPosition !== 'top' }"
        :style="{
          display: 'grid',
          'justify-content': eleItem.options.position,
          'font-size': eleItem.options.size + 'px',
          color: eleItem.options.color,
          'line-height': eleItem.options.lineHeight + 'px',
          'font-weight': eleItem.options.weight,
        }"
      >
        <div
          :style="{
            'padding-left': eleItem.options.leftPadding + 'px',
            'font-style': eleItem.options.style,
            'text-indent': eleItem.options.indent + 'em',
          }"
        >
          {{ eleItem.options.defaultValue }}
        </div>
      </div>
    </div>
    <div v-else-if="eleItem.type === 'divider'">
      <div :class="{ 'form-text': eleConfig.labelPosition !== 'top' }">
        <el-divider :content-position="eleItem.options.position">
          {{ eleItem.options.defaultValue }}
        </el-divider>
      </div>
    </div>
  </div>
</div>`,
    }
    var vm = new Vue({
        el: '#formContent',
        data: {
            eleList,
            labelPosition: 'top',
        },
        methods: {},
        components: {
            'dialogformitems': dialogformitems,
        }
    })

</script>
</body>
</html>
