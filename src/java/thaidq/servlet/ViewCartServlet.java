/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaidq.dao.ProductDAO;
import thaidq.dto.CartDTO;
import thaidq.dto.ProductDTO;

/**
 *
 * @author thaid
 */
public class ViewCartServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("ROLE") == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                CartDTO shoppingCart = (CartDTO) session.getAttribute("cart");
                List<ProductDTO> listDto = new ArrayList<>();
                ProductDAO dao = new ProductDAO();
                for (String id : shoppingCart.getShoppingCart().keySet()) {
                    ProductDTO dto = dao.findByPK(id);
                    ProductDTO dtoView = new ProductDTO();
                    dtoView.setProductId(id);
                    dtoView.setProductName(dto.getProductName());
                    dtoView.setPrice(dto.getQuantity());
                    dtoView.setQuantityCart(shoppingCart.getShoppingCart().get(id));
                    dtoView.setImage(dto.getImage());
                    listDto.add(dtoView);
                }
                System.out.println(listDto);
                request.setAttribute("INFO", listDto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("view.jsp").forward(request, response);
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
