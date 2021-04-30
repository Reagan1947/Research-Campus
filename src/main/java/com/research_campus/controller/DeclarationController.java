package com.research_campus.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.domain.BusinessEntity;
import com.research_campus.domain.Declaration;
import com.research_campus.domain.ProjectEntity;
import com.research_campus.service.IDeclarationService;
import com.research_campus.service.IEntityService;
import com.research_campus.utils.activiti.IDGenerator;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author buwan
 */
@Controller
public class DeclarationController {

    IDeclarationService declarationService;

    @Autowired
    public void setDeclarationService(IDeclarationService declarationService) {
        this.declarationService = declarationService;
    }

    IEntityService entityService;

    @Autowired
    public void setEntityService(IEntityService entityService) {
        this.entityService = entityService;
    }

    CosClientTool clientTool;

    @Autowired
    public void setClientTool(CosClientTool clientTool) {
        this.clientTool = clientTool;
    }

    /**
     * 跳转至流程公告页面
     * @param businessEntityUuid businessEntityUuid
     * @return declaration pojo
     * @throws Exception IO
     */
    @RequestMapping("/toDeclarationPage")
    public ModelAndView directToDeclaration(String businessEntityUuid) throws Exception{

        // 根据 businessEntityUuid 查询 declaration
        List<Declaration> declarationList = declarationService.findDeclarationListByBusinessEntityUuid(businessEntityUuid);

        ModelAndView mv = new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject(declarationList);
        mv.setViewName("page_declaration");

        return mv;
    }

    @RequestMapping("/editDeclaration")
    public ModelAndView toEditDeclaration(String proBusUuid, String businessEntityUuid) throws Exception{
        BusinessEntity businessEntity = new BusinessEntity();

        try {
            businessEntity = entityService.getBusinessEntityByUuid(businessEntityUuid);
        }catch (Exception e){
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();

        mv.addObject("businessEntity",  businessEntity);
        mv.addObject("proBusUuid",  proBusUuid);

        mv.setViewName("page_editDeclaration");

        return mv;
    }

    @RequestMapping(value = "/getDeclaration", method = RequestMethod.POST)
    @ResponseBody
    public void getDeclaration(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        String proBusUuid = map.get("proBusUuid");
        Declaration declaration = new Declaration();
        JSONObject json = new JSONObject();
        int code = 200;

        try {
            declaration = declarationService.getDeclarationByProBusUuid(proBusUuid);
        }catch (Exception e){
            code = 400;
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("declaration", declaration);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/applyDeclaration", method = RequestMethod.POST)
    @ResponseBody
    public void applyDeclarationDetail(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        PutObjectResult putObjectResult = new PutObjectResult();
        int code = 200;

        Declaration declaration = new Declaration();

        // 获取declarationUuid
        String declarationUuid = map.get("declarationUuid");
        String proBusUuid = map.get("proBusUuid");
        String declarationPage = map.get("declarationPage");
        declaration.setDeclarationName(map.get("declarationName"));
        declaration.setDeclarationAnnouncement(map.get("declarationAnnouncement"));
        declaration.setDeclarationOverview(map.get("declarationOverview"));

        // 如果 declarationUuid 为空，表明为新创建
        if(declarationUuid == null || "".equals(declarationUuid)){
            String uuid = IDGenerator.getUuid();
            declaration.setDeclarationUuid(uuid);
            try {
                // 增加公告信息主体信息
                declarationService.addDeclaration(declaration);

                // 在关系表中增加数据
                declarationService.addProBusDeclaration(uuid, proBusUuid);

                // 处理 DeclarationPage
                String declarationPageUuid = IDGenerator.getUuid();
                declarationPage = new String(declarationPage.getBytes("GBK"));
                putObjectResult = clientTool.uploadFileWithExtension(declarationPageUuid, declarationPage, "html", "declarationDetail");
                // 向数据库添加信息
                declarationService.addDeclarationUrlByDeclarationUuid(declarationPageUuid, uuid);

            }catch (Exception e){
                code = 400;
                e.printStackTrace();
            }
        } else {
            declaration.setDeclarationUuid(declarationUuid);
            try {
                // 增加公告信息主体信息
                declarationService.modifyDeclaration(declaration);

                // 处理 DeclarationPage
                String declarationPageUuid = IDGenerator.getUuid();
                declarationPage = new String(declarationPage.getBytes("GBK"));
                putObjectResult = clientTool.uploadFileWithExtension(declarationPageUuid, declarationPage, "html", "declarationDetail");

            } catch (Exception e) {
                code = 400;
                e.printStackTrace();
            }
        }

        json.put("code", code);
//        json.put("declaration", declaration);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/declarationPage")
    public ModelAndView declarationPage(String declarationUuid, String businessEntityUuid) throws Exception{
        Declaration declaration = new Declaration();
        BusinessEntity businessEntity = new BusinessEntity();

        try {
            // 根据 declarationUuid 查询 declaration
            declaration = declarationService.getDeclarationByUuid(declarationUuid);
            businessEntity = entityService.getBusinessEntityByUuid(businessEntityUuid);
        }catch (Exception e){
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();

        mv.addObject("declaration",  declaration);
        mv.addObject("businessEntity", businessEntity);

        mv.setViewName("page_declarationPage");

        return mv;
    }
}
