package com.research_campus.utils.SVG;

import java.io.*;

import org.apache.batik.transcoder.Transcoder;
import org.apache.batik.transcoder.TranscoderException;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.ImageTranscoder;
import org.apache.batik.transcoder.image.PNGTranscoder;
/**
 * @author buwan
 */
public class SvgUtils {

    /**
     *
     * @param in
     * @param out
     * @throws IOException
     */
    public static void convert2PNG(InputStream in,OutputStream out) throws IOException {
        Transcoder tr = new PNGTranscoder();
        try {
            TranscoderInput input = new TranscoderInput(in);
            try {
                TranscoderOutput output = new TranscoderOutput(out);
                tr.transcode(input, output);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                out.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            in.close();
        }
    }
}
