/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thaid
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class MainServlet extends HttpServlet {

    private static final String ERROR = "invalid.jsp";
    private static final String LOGIN = "LoginServlet";
    private static final String LOGOUT = "LogoutServlet";
    private static final String SEARCH = "SearchServlet";
    private static final String DELETE = "DeleteServlet";
    private static final String GET_INFO = "GetInfoServlet";
    private static final String PRODUCT = "ProductServlet";
    private static final String UPDATE_NO_IMG = "UpdateNoImgServlet";
    private static final String UPDATE_WITH_IMG = "UpdateWithImageServlet";
    private static final String CREATE = "CreateServlet";
    private static final String EMOTION = "EmotionServlet";
    private static final String ADD_CART = "AddToCartServlet";
    private static final String VIEW_CART = "ViewCartServlet";
    private static final String REMOVE_ITEM_IN_CART = "RemoveItemInCartServlet";
    private static final String UPDATE_ITEM_IN_CART = "UpdateQuantityInCartServlet";
    private static final String ORDER_HISTORY = "OrderHistoryServlet";
    private static final String ORDER_SEARCH = "SearchOrderHistoryServlet";

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
        String url = ERROR;
        try {
            String action = request.getParameter("btnAction");
            if (action.equals("Sign in")) {
                url = LOGIN;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Delete")) {
                url = DELETE;
            } else if (action.equals("Info")) {
                url = GET_INFO;
            } else if (action.equals("Cancel")) {
                url = PRODUCT;
            } else if (action.equals("Update")) {
                url = UPDATE_NO_IMG;
            } else if (action.equals("Insert")) {
                url = CREATE;
            } else if (action.equals("Update With Image")) {
                url = UPDATE_WITH_IMG;
            } else if (action.equals("Like")) {
                url = EMOTION;
            } else if (action.equals("Dislike")) {
                url = EMOTION;
            } else if (action.equals("Add Cart")) {
                url = ADD_CART;
            }else if (action.equals("ViewCart")) {
                url = VIEW_CART;
            }else if (action.equals("Remove")) {
                url = REMOVE_ITEM_IN_CART;
            }else if (action.equals("Update !")) {
                url = UPDATE_ITEM_IN_CART;
            }else if (action.equals("Order History")) {
                url = ORDER_HISTORY;
            }else if (action.equals("Search Order")) {
                url = ORDER_SEARCH;
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
