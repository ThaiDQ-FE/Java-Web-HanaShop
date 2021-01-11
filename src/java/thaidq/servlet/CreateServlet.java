/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import thaidq.dao.ProductDAO;
import thaidq.dto.ProductDTO;
import java.io.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author thaid
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class CreateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("txtProductName");
        String quantity = request.getParameter("txtQuantity");
        String description = request.getParameter("txtDescription");
        String cate = request.getParameter("cboCate");
        String price = request.getParameter("txtPrice");
        String date = request.getParameter("txtDate");
        String status = request.getParameter("txtStatus");
        String file = uploadFile(request);
        ProductDTO dto = new ProductDTO(name, quantity, description, cate, price, status, date, file);
        ProductDAO dao = new ProductDAO();
        try {
            dao.createProduct(dto);

        } catch (Exception ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher dis = request.getRequestDispatcher("ProductServlet");
        dis.forward(request, response);
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        Part filePart = request.getPart("txtFile");
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

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
    }
}
