package com.research_campus.utils.tencenCloudCos;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 * 用于COS Client 初始化
 * @author buwan
 */

@Component
public class CosClientTool {

    private final String pSecretId;
    private final String pSecretKey;
    private final String pRegion;
    private final String pBucketName;

    {
        ResourceBundle bundle = ResourceBundle.getBundle("tencentCloudCos");
        this.pSecretId = bundle.getString("secretId");
        this.pSecretKey = bundle.getString("secretKey");
        this.pRegion = bundle.getString("region");
        this.pBucketName = bundle.getString("bucketName");

    }

    public COSClient getCosClient() {
        COSCredentials cred = new BasicCOSCredentials(pSecretId, pSecretKey);
        Region region = new Region(pRegion);
        ClientConfig clientConfig = new ClientConfig(region);

        return new COSClient(cred, clientConfig);
    }

    public void uploadFile(String localFilePath, COSClient cosClient, String uuid) {
        File localFile = new File(localFilePath);
        PutObjectRequest putObjectRequest = new PutObjectRequest(pBucketName, uuid, localFile);
        PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
    }
}
