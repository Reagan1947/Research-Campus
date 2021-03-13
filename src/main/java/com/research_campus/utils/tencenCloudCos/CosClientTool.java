package com.research_campus.utils.tencenCloudCos;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.model.StorageClass;
import com.qcloud.cos.region.Region;
import org.springframework.stereotype.Component;

import java.io.*;
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

    public PutObjectResult uploadFile(String fileSuffix, COSClient cosClient, String uuid, InputStream inputStream, Integer fileLength) throws IOException {

        ObjectMetadata objectMetadata = new ObjectMetadata();
        // 从输入流上传必须制定content length, 否则http客户端可能会缓存所有数据，存在内存OOM的情况
        // 使用available()判断输入流长度
        // 默认下载时根据cos路径key的后缀返回响应的contentType, 上传时设置contentType会覆盖默认值
        // objectMetadata.setContentType("image/jpeg");
        // uuid加上文件名后缀作为key
        String key = uuid + "." + fileSuffix;
        PutObjectRequest putObjectRequest = new PutObjectRequest(pBucketName, key, inputStream, objectMetadata);
        // 设置 Content type, 默认是 application/octet-stream
        putObjectRequest.setMetadata(objectMetadata);
        // 设置存储类型, 默认是标准(Standard), 低频(standard_ia)
        putObjectRequest.setStorageClass(StorageClass.Standard_IA);
        PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);

        // String eTag = putObjectResult.getETag();
        // System.out.println(eTag);
        // 关闭客户端
        cosClient.shutdown();
        // http://{buckname}-{appid}.cosgz.myqcloud.com/image/1545012027692.jpg

        return putObjectResult;
    }
}
