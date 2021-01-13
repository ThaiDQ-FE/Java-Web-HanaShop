/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author thaid
 */
public class FileUpload {

    public static String uploadFile(HttpServletRequest request, String txt) throws IOException, ServletException {
        String fileName = "";
        Part filePart = request.getPart(txt);
        fileName = (String) getFileName(filePart);
        String applicationPath = request.getServletContext().getRealPath("");
        String basePath = applicationPath + "ImageDB" + File.separator;
        basePath = basePath.replace("build", "");
        InputStream inputStream = null;
        OutputStream outputStream = null;
        File outputFilePath = new File(basePath + fileName);
        String a = basePath + fileName;
        inputStream = filePart.getInputStream();
        outputStream = new FileOutputStream(outputFilePath);
        int read = 0;
        final byte[] bytes = new byte[1024];
        while ((read = inputStream.read(bytes)) != -1) {
            outputStream.write(bytes, 0, read);
        }
        return a;
    }

    public static String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
