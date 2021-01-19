/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import thaidq.dao.OrderDAO;
import thaidq.dao.ProductDAO;
import thaidq.dao.SubProductDAO;
import thaidq.dto.CartDTO;
import thaidq.dto.SubProductDTO;

/**
 *
 * @author thaid
 */
public class CheckOutServlet extends HttpServlet {

    private final String CART_PAGE = "ViewCartServlet";
    private final String HOME_PAGE = "ProductServlet";

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
        String url = CART_PAGE;
        try {
            HttpSession session = request.getSession();
            CartDTO shoppingCart = (CartDTO) session.getAttribute("cart");
            String orderId = "OD";
            int total = shoppingCart.getTotal();
            String date = request.getParameter("txtDate");
            String status = "waiting";
            orderId += "-" + session.getAttribute("NAME") + "-";
            OrderDAO dao = new OrderDAO();
            SubProductDAO sDao = new SubProductDAO();
            ProductDAO pDao = new ProductDAO();
            ArrayList<String> list = new ArrayList();
            String lastID = dao.findByLastOrderID((String) session.getAttribute("ID_ACCOUNT"));
            if (lastID == null) {
                orderId += 1;
            } else {
                String[] tmp = lastID.split("-");
                orderId += (Integer.parseInt(tmp[2]) + 1);
            }
            for (String productIDFirst : shoppingCart.getShoppingCart().keySet()) {
                int quantityCart = shoppingCart.getShoppingCart().get(productIDFirst);
                int quantityDB = Integer.parseInt(pDao.getQuantity(productIDFirst));
                String nameShow = pDao.getProductName(productIDFirst);
                if (quantityCart > quantityDB) {
                    url = CART_PAGE;
                    String message = "\"The warning error\"\n"
                            + nameShow + " has maximum quantity is " + quantityDB;
                    JOptionPane.showMessageDialog(new JFrame(), message, "Warning !!!",
                            JOptionPane.ERROR_MESSAGE);
                    request.setAttribute("QUANTITY_ERROR", productIDFirst);
                } else {
                    url = HOME_PAGE;
                    if (dao.createOrder(orderId, Integer.parseInt((String) session.getAttribute("ID_ACCOUNT")), date, total, status)) {
                        int count = 1;
                        for (String productID : shoppingCart.getShoppingCart().keySet()) {
                            int quantity = shoppingCart.getShoppingCart().get(productID);
                            String detailID = (orderId + "-" + count);
                            String name = pDao.getProductName(productID);
                            list.add(productID);
                            dao.createOrderDetail(detailID, orderId, quantity, productID, name);
                            count++;
                        }
                        String listString = "";
                        for (String string : list) {
                            listString += string + "-";
                        }
                        SubProductDTO sDto = new SubProductDTO(listString);
                        sDao.createSubProduct(sDto);
                    }
                    shoppingCart.resetCart();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
