<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 页面head信息 -->
    <jsp:include page="admin_head.jsp"/>

    <!-- 设置每个页面的Title -->
    <title>${businessEntity.businessEntityName}审核表单</title>

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

        /*.el-form-item__content {*/
        /*    margin-left: 18px;*/
        /*}*/
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
                            ${businessEntity.businessEntityName}审核表单
                        </h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页
                            </a></li>
                            <li class="breadcrumb-item active">${businessEntity.businessEntityName}表单</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6" id="declarationInformation">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">${projectEntity.projectEntityName}申报表单</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body" style="margin: 0 20px 0 20px;">
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
<%--                            <div class="card-footer">--%>
<%--&lt;%&ndash;                                <button type="submit" class="btn btn-primary float-right" @click="submitFormData($event)">提交信息</button>&ndash;%&gt;--%>

<%--                                <div class="btn-group float-right">--%>
<%--                                    <button type="button" class="btn btn-primary" @click="submitFormData($event)">提交信息</button>--%>
<%--                                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-icon" data-toggle="dropdown" aria-expanded="false">--%>
<%--                                        <span class="sr-only">下拉切换</span>--%>
<%--                                        <div class="dropdown-menu" role="menu" style="">--%>
<%--                                            <a class="dropdown-item" href="#">驳回申请</a>--%>
<%--                                            <a class="dropdown-item" href="#">转交申请</a>--%>
<%--                                            <a class="dropdown-item" href="#">暂存</a>--%>
<%--                                            <div class="dropdown-divider"></div>--%>
<%--                                            <a class="dropdown-item" href="#">淘汰项目</a>--%>
<%--                                        </div>--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                        <!-- /.card -->
                    </div>


                    <!-- right column -->
                    <div class="col-md-6" id="formContent">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">${projectEntity.projectEntityName}审批表单</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body" style="margin: 0 20px 0 20px;">
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
                                <%--                                <button type="submit" class="btn btn-primary float-right" @click="submitFormData($event)">提交信息</button>--%>

                                <div class="btn-group float-right">
                                    <button type="button" class="btn btn-primary" @click="submitFormData($event)">提交信息</button>
                                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-icon" data-toggle="dropdown" aria-expanded="false">
                                        <span class="sr-only">下拉切换</span>
                                        <div class="dropdown-menu" role="menu" style="">
                                            <a class="dropdown-item" @click="dealExamine(0, $event)">驳回申请</a>
                                            <a class="dropdown-item" href="#">转交申请</a>
                                            <a class="dropdown-item" href="#">暂存</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" @click="dealExamine(2, $event)">淘汰项目</a>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
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

    <%--var eleList;--%>
    <%--eleList = JSON.parse(${dynamicForm});--%>

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
            eleList: JSON.parse(${dynamicForm}),
            labelPosition: 'top',
            formsVal: {},
        },
        components: {
            'dialogformitems': dialogformitems,
        },
        methods: {
            // 获取到页面数据
            // setFormVal: function (data) {
            //     this.eleList = data;
            // },
            // 表单验证方法
            valueCheck: function () {
                const promises = [];
                for (const key of this.eleList.list) {
                    if (key.options.required) {
                        if (key.options.defaultValue instanceof Array) {
                            if (key.options.defaultValue.length === 0) {
                                if (key.options.requiredMsg) {
                                    promises.push(Promise.reject(key.options.requiredMsg));
                                } else {
                                    promises.push(Promise.reject(key.name + "必填"));
                                }
                            }
                        } else {
                            if (!key.options.defaultValue) {
                                if (key.options.requiredMsg) {
                                    promises.push(Promise.reject(key.options.requiredMsg));
                                } else {
                                    promises.push(Promise.reject(key.name + "必填"));
                                }
                            }
                        }
                    } else {
                        promises.push(Promise.resolve());
                    }
                }
                return promises;
            },
            getFormVal: function (that) {
                return new Promise((resolve, reject) => {
                    Promise.all(that.valueCheck())
                        .then((res) => {
                            // 读取数据前先清空表单数据
                            that.formsVal = {};
                            // 循环读取表单数据
                            for (const key of that.eleList.list) {
                                if(key.options.type === "daterange") {
                                    Object.assign(that.formsVal, {
                                        [key.key]: key.options.defaultValue.toString(),
                                    });
                                } else {
                                    Object.assign(that.formsVal, {
                                        [key.key]: key.options.defaultValue,
                                    });
                                }
                            }
                            resolve(that.formsVal);
                        })
                        .catch((err) => {
                            that.$message.error(err);
                            reject();
                        });
                });
            },
            submitFormData: function (event) {
                const that = this
                event.preventDefault();
                this.$options.methods.getFormVal(that).then(function () {
                    var json_data = {
                        tableName: "dynamic_" + '${dynamicFormUuid}',
                        tableFiled: that.formsVal,
                        processId: '${task.processInstanceId}',
                        taskId: '${task.id}',
                        auditResult: 1,
                    };
                    $.ajax({
                        url : '${pageContext.request.contextPath}/addTableData',
                        type : 'post',
                        data : JSON.stringify(json_data),
                        dataType: 'json',
                        contentType : 'application/json;charset=utf-8',   //中文需要加上charset=utf-8才正确
                        success: function (data) {
                            if (data.code === 400) {
                                console.log(data);
                                toastr.error("动态表单数据添加失败！")
                            } else if (data.code === 200) {
                                console.log(data);
                                toastr.success("动态表单数据添加成功！")
                            }
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });
                })
            },

            dealExamine: function (dealTag, event) {
                event.preventDefault();
                var json_data = {
                    processId: '${task.processInstanceId}',
                    taskId: '${task.id}',
                    auditResult: dealTag,
                };
                $.ajax({
                    url : '${pageContext.request.contextPath}/dealExamine',
                    type : 'post',
                    data : JSON.stringify(json_data),
                    dataType: 'json',
                    contentType : 'application/json;charset=utf-8',   //中文需要加上charset=utf-8才正确
                    success: function (data) {
                        if (data.code === 400) {
                            console.log(data);
                            toastr.error("审批操作成功")
                        } else if (data.code === 200) {
                            console.log(data);
                            toastr.success("审批操作成功")
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }
        }
    });

    var preData = {
        eleList: JSON.parse(${dynamicFormPre}),
        labelPosition: 'top',
        formsVal: {},
        preDeclaration: {},
    };

    var vmPre = new Vue({
        el: '#declarationInformation',
        data: preData,
        components: {
            'dialogformitems': dialogformitems,
        },
        methods: {
            toRecallData: function () {
                const that = this
                for (const key of that.eleList.list) {
                    var keyInItem = key.key;
                    if(key.options.type === "daterange"){
                        var datePicker = that.preDeclaration[keyInItem].split(',');
                        key.options.defaultValue = [datePicker[0].toString(), datePicker[1].toString()];
                    } else if(key.options.type === "date") {
                        var d = new Date(that.preDeclaration[keyInItem]);
                        key.options.defaultValue = (d.getFullYear()) + "-" +
                            (d.getMonth() + 1) + "-" +
                            (d.getDate());
                    }
                    else {
                        key.options.defaultValue = that.preDeclaration[keyInItem];
                    }

                    key.options.disabled = true;
                }
            }
        },
    });

    $(function(){
        // get Pre Declaration Information
        var preDynamicFormKey = '${dynamicFormPreKey}'
        var processInstanceId = '${task.processInstanceId}'

        var json_data = {
            preDynamicFormKey: preDynamicFormKey,
            processInstanceId: processInstanceId,
        }

        $.ajax({
            url : '${pageContext.request.contextPath}/getDynamicFormInf',
            type : 'post',
            data : JSON.stringify(json_data),
            contentType : 'application/json;charset=utf-8',
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.code === 400) {
                    console.log(data);
                } else if (data.code === 200) {
                    console.log(data);
                    preData.preDeclaration = data.formInfMap;
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
        vmPre.$forceUpdate();
        vmPre.toRecallData();
    });

</script>

<script>
    function toDeclarationDetail() {
        window.location.href="${pageContext.request.contextPath}/declarationPage?declarationUuid="+ '${declaration.declarationUuid}' +"&businessEntityUuid="+ '${businessEntity.businessEntityUuid}';
    }
</script>
</body>
</html>
