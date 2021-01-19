/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thaidq.dao.AccountDAO;
import thaidq.dto.AccountDTO;

/**
 *
 * @author thaid
 */
public class LoginServlet extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";
    private final String HOME_PAGE = "ProductServlet";
    private final String MESSAGE = " does not exited! Please check agian!!";

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
        String url = LOGIN_PAGE;
        String username = request.getParameter("txtUsernameOrEmail");
        String password = request.getParameter("txtPassword");
        HttpSession session = request.getSession();
        try {
            AccountDAO dao = new AccountDAO();
            AccountDTO dtoGet = dao.checkLogins(username, password);
            if (dtoGet != null) {
                url = HOME_PAGE;
                String id = dao.getAccountId(dtoGet.getId());
                String role = dao.checkLogin(username, password);
                session.setAttribute("ACCOUNT", dtoGet.getFullname());
                session.setAttribute("ACCOUNT_ID", dtoGet.getId());
                session.setAttribute("ID_ACCOUNT", id);
                session.setAttribute("ROLE", role);
            } else {
                url = LOGIN_PAGE;
                session.setAttribute("ERORR_LOGIN", "ERORR_LOGIN");
                request.setAttribute("LOGIN_ERROR", username + MESSAGE);
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
