package com.research_campus.utils.tencentCloudCos;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.model.StorageClass;
import com.qcloud.cos.region.Region;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * 用于COS Client 初始化
 * @author buwan
 */

@Component
public class CosClientTool {

    /**
     *
     * 根据配置文件自动注入
     */
    @Value("#{configProperties['secretId']}")
    private String PSecretId;
    @Value("#{configProperties['secretKey']}")
    private String PSecretKey;
    @Value("#{configProperties['region']}")
    private String PRegion;
    @Value("#{configProperties['bucketName']}")
    private String PBucketName;

    public String getPSecretId() {
        return PSecretId;
    }

    public String getPSecretKey() {
        return PSecretKey;
    }

    public String getPRegion() {
        return PRegion;
    }

    public String getPBucketName() {
        return PBucketName;
    }

    public COSClient getCosClient(){
        COSCredentials cred = new BasicCOSCredentials(PSecretId, PSecretKey);
        Region region = new Region(PRegion);
        ClientConfig clientConfig = new ClientConfig(region);

        return new COSClient(cred, clientConfig);
    }

    public PutObjectResult uploadFileWithExtension(String uuid, MultipartFile uploadFile, String extension) throws IOException {
        // 加上文件名extension作为key
        String key = uuid + "." + extension;

        return uploadFileCommon(key, uploadFile);
    }

    public PutObjectResult uploadFileWithoutExtension(String uuid, MultipartFile uploadFile) throws IOException {

        // uuid 作为key
        return uploadFileCommon(uuid, uploadFile);
    }

    public PutObjectResult uploadFileCommon(String key, MultipartFile uploadFile) throws IOException {
        COSClient cosClient = getCosClient();
        // byte化上传数据
        byte [] byteArr = uploadFile.getBytes();
        // 获取上传文件长度
        int fileLength = byteArr.length;
        // 创建ObjectMetadata对象
        ObjectMetadata objectMetadata = new ObjectMetadata();
        // 增加Ob对象长度信息
        objectMetadata.setContentLength(fileLength);

        // 从输入流上传必须制定content length, 否则http客户端可能会缓存所有数据，存在内存OOM的情况
        // 默认下载时根据cos路径key的后缀返回响应的contentType, 上传时设置contentType会覆盖默认值
        // objectMetadata.setContentType("image/jpeg");
        InputStream inputStream = new ByteArrayInputStream(byteArr);
        PutObjectRequest putObjectRequest = new PutObjectRequest(PBucketName, key, inputStream, objectMetadata);
        // 设置 Content type, 默认是 application/octet-stream
        putObjectRequest.setMetadata(objectMetadata);
        // 设置存储类型, 默认是标准(Standard), 低频(standard_ia)
        putObjectRequest.setStorageClass(StorageClass.Standard);
        PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);

        // 根据对象内容计算出的 MD5 算法校验值，例如"22ca88419e2ed4721c23807c678adbe4c08a7880"，注意前后携带双引号
        // String eTag = putObjectResult.getETag();
        // System.out.println(eTag);
        // 关闭客户端
        cosClient.shutdown();
        // http://{buckname}-{appid}.cosgz.myqcloud.com/image/1545012027692.jpg

        return putObjectResult;
    }
}
