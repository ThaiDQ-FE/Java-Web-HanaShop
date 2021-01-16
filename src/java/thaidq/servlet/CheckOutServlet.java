/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaidq.dao.OrderDAO;
import thaidq.dto.CartDTO;

/**
 *
 * @author thaid
 */
public class CheckOutServlet extends HttpServlet {

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
            CartDTO shoppingCart = (CartDTO) session.getAttribute("cart");
            
            System.out.println(session.getAttribute("ID_ACCOUNT"));

            String orderId = "OD";

            int total = shoppingCart.getTotal();
            String date = request.getParameter("txtDate");
            String status = "waiting";

            orderId += "-" + session.getAttribute("NAME") + "-";

            OrderDAO dao = new OrderDAO();
            System.out.println(session.getAttribute("NAME"));
            String lastID = dao.findByLastOrderID((String) session.getAttribute("ID_ACCOUNT"));
            System.out.println();
            
            if (lastID == null) {
                orderId += 1; //OD-TuongNT-1
            } else {
                String[] tmp = lastID.split("-");
                orderId += (Integer.parseInt(tmp[2]) + 1);
            }
            if (dao.createOrder(orderId, Integer.parseInt((String) session.getAttribute("ID_ACCOUNT")), date, total, status)) {
                int count = 1;
                for (String productID : shoppingCart.getShoppingCart().keySet()) {
                    int quantity = shoppingCart.getShoppingCart().get(productID);
                    String detailID = (orderId + "-" + count);
                    dao.createOrderDetail(detailID, orderId, quantity, productID);
                    count++;
                }
            }
            shoppingCart.resetCart();
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
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
