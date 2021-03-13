package com.research_campus.controller;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.utils.tencenCloudCos.CosClientTool;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

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

        PutObjectResult putObjectResult = null;

        HttpSession session = request.getSession();
        // 获取文件后缀名
        String extension = FilenameUtils.getExtension( uploadFile.getOriginalFilename());
        byte [] byteArr = uploadFile.getBytes();
        int fileLength = byteArr.length;
        InputStream inputStream = new ByteArrayInputStream(byteArr);
        COSClient cosClient = clientTool.getCosClient();
        try {
            putObjectResult =
            clientTool.uploadFile(extension, cosClient, (String) session.getAttribute("uuid"), inputStream, fileLength);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "上传失败");
        }

        assert putObjectResult != null;
        String eTag = putObjectResult.getETag();
        // 用于调试
        System.out.println(eTag);
    }

    // 返回什么？
}
