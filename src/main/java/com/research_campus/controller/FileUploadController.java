package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/**
 * @author buwan
 */

@Controller
public class FileUploadController {


    CosClientTool clientTool;

    @Autowired
    public void setClientTool(CosClientTool clientTool) {
        this.clientTool = clientTool;
    }

    @RequestMapping("/fileUpload.do")
    public void fileUpload(MultipartFile uploadFile, Model model, HttpServletRequest request) throws IOException {

        // String extension = FilenameUtils.getExtension( uploadFile.getOriginalFilename());

        PutObjectResult putObjectResult = null;
        HttpSession session = request.getSession();
        try {
            putObjectResult =
            clientTool.uploadFileWithoutExtension((String) session.getAttribute("uuid"), fileImg);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject .put("code", 400);
            jsonObject .put("Msg", "上传失败");

        }

        jsonObject .put("code", 200);
        jsonObject .put("Msg", "上传成功");
        assert putObjectResult != null;
        String eTag = putObjectResult.getETag();

        // 用于调试
        System.out.println(eTag);

        return jsonObject;
    }
}
