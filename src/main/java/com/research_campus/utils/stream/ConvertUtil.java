package com.research_campus.utils.stream;

import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author buwan
 */
@Component
public class ConvertUtil {
    /**
     * inputStream 转 outputStream
     * @param in inputStream
     * @return outputStream
     * @throws Exception IO Exception
     */
    public ByteArrayOutputStream parse(final InputStream in) throws Exception {
        final ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        int ch;
        while ((ch = in.read()) != -1) {
            swapStream.write(ch);
        }
        return swapStream;
    }


    /**
     * outputStream 转 inputStream
     * @param out outputStream
     * @return inputStream
     * @throws Exception IO Exception
     */
    public ByteArrayInputStream parse(final OutputStream out) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        baos = (ByteArrayOutputStream) out;
        return new ByteArrayInputStream(baos.toByteArray());
    }

    /**
     * inputStream 转 String
     * @param in inputStream
     * @return String
     * @throws Exception IO Exception
     */
    public String parseString(final InputStream in) throws Exception {
        final ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        int ch;
        while ((ch = in.read()) != -1) {
            swapStream.write(ch);
        }
        return swapStream.toString();
    }

    /**
     * OutputStream 转 String
     * @param out OutputStream
     * @return String
     * @throws Exception IO Exception
     */
    public String parseString(final OutputStream out) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        baos = (ByteArrayOutputStream) out;
        final ByteArrayInputStream swapStream = new ByteArrayInputStream(baos.toByteArray());
        return swapStream.toString();
    }

    /**
     * String 转 inputStream
     * @param in String
     * @return inputStream
     * @throws Exception IO Exception
     */
    public ByteArrayInputStream parseInputStream(final String in) throws Exception {
        return new ByteArrayInputStream(in.getBytes());
    }

    /**
     * String 转 outputStream
     * @param in String
     * @return outputStream
     * @throws Exception IO Exception
     */
    public ByteArrayOutputStream parseOutputStream(final String in) throws Exception {
        return parse(parseInputStream(in));
    }
}
