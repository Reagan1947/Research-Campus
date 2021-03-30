package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.apache.commons.io.FilenameUtils;
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
import java.io.ByteArrayInputStream;
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
    @ResponseBody
    public JSONObject fileUpload(@RequestBody Map<String, String> map, HttpServletRequest request) throws IOException {
        String base64Img = map.get("base64Img");
        String fileImg = base64Img.split(",")[1];
        JSONObject jsonObject = new JSONObject();


        // 获取文件后缀名
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
