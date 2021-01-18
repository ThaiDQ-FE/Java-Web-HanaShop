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
import thaidq.dao.AccountDAO;
import thaidq.dao.ProductDAO;
import thaidq.dao.SubProductDAO;
import thaidq.dto.CartDTO;
import thaidq.dto.CloneProductDTO;

/**
 *
 * @author thaid
 */
public class AddToCartServlet extends HttpServlet {

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
                AccountDAO dao = new AccountDAO();
                SubProductDAO sDao = new SubProductDAO();
                ArrayList list = new ArrayList();
                ProductDAO pDao = new ProductDAO();
                List<CloneProductDTO> listDto = new ArrayList<>();
                String id = request.getParameter("txtProductId");
                String accountid = request.getParameter("txtAccountID");
                CartDTO shoppingCart = (CartDTO) session.getAttribute("cart");
                String string = sDao.getSubProduct(id);
                if (string != null) {
                    String[] splits = string.split("-");
                    for (String item : splits) {
                        list.add(item);
                    }
                    list.remove(id);
                    for (Object object : list) {
                        if (object != "") {
                            listDto.add(pDao.getSuggestProduct((String) object));
                        }
                    }
                } else {
                }

                String name = dao.getFullname(accountid);
                if (shoppingCart == null) {
                    shoppingCart = new CartDTO(name);
                }
                shoppingCart.addToCart(id);
                session.setAttribute("cart", shoppingCart);
                session.setAttribute("NAME", name);
                request.setAttribute("FINAL", listDto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("ProductServlet").forward(request, response);
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
