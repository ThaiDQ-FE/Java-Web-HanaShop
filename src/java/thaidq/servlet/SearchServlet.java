/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thaidq.dao.ProductDAO;
import thaidq.dto.ProductDTO;

/**
 *
 * @author thaid
 */
public class SearchServlet extends HttpServlet {

    private final String SEARCH_PAGE = "search.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String searchOption = request.getParameter("searchOption");
        String searchValue = request.getParameter("searchValue");
        String page = request.getParameter("page") != null ? request.getParameter("page") : "1";
        if (Integer.parseInt(page) < 1) {
            page = "1";
        }
        String url = SEARCH_PAGE;
        try {
            ProductDAO dao = new ProductDAO();
            if (searchOption.equals("Name")) {
                List<ProductDTO> dto = dao.searchProductByName(searchValue, page);
                int totalRecord = dao.countProduct();
                int totalPage = 1;
                if (totalRecord % 20 == 0) {
                    totalPage = totalRecord / 20;
                } else {
                    totalPage = (totalRecord / 20) + 1;
                }
                request.setAttribute("SEARCH_RESULT", dto);
                request.setAttribute("SEARCH_RESULT_PAGINATION", totalPage);
                request.setAttribute("SEARCH_RESULT_CURRENT_PAGE", page);
                System.out.println(dto);
            } else if (searchOption.equals("Price")) {
                List<ProductDTO> dto = dao.searchProductByPrice(searchValue);
                request.setAttribute("SEARCH_RESULT", dto);
                System.out.println(dto);
            } else {
                List<ProductDTO> dto = dao.searchProductByCategory(searchValue);
                request.setAttribute("SEARCH_RESULT", dto);
                System.out.println(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            RequestDispatcher dis = request.getRequestDispatcher(url);
            dis.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
