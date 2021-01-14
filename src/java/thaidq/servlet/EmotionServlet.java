/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thaidq.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thaidq.dao.AccountDAO;
import thaidq.dao.EmotionDAO;
import thaidq.dto.EmotionDTO;

/**
 *
 * @author thaid
 */
public class EmotionServlet extends HttpServlet {

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
        String accountid = request.getParameter("txtAccountID");
        String productId = request.getParameter("txtProductId");
        String btn = request.getParameter("btnAction");
        try {
            AccountDAO dao = new AccountDAO();
            EmotionDAO eDao = new EmotionDAO();
            int isAccountCreate = eDao.checkIsCreate(productId, dao.getAccountId(accountid));
            EmotionDTO eDto = new EmotionDTO("Like", dao.getAccountId(accountid), productId);

            System.out.println(accountid);
            System.out.println(dao.getAccountId(accountid));
            System.out.println(isAccountCreate);

            System.out.println(productId);
            System.out.println(eDao.countProductId(productId));

            System.out.println("==============");
            System.out.println(eDao.checkIsCreate(productId, dao.getAccountId(accountid)));
            System.out.println("-----------");
            System.out.println(eDao.getEmotion(dao.getAccountId(accountid), productId));
            if (btn.equals("Like")) {
                if (isAccountCreate == 1) {
                    if (eDao.getEmotion(dao.getAccountId(accountid), productId).equals("Dislike")) {
                        eDao.updateEmotionToLike(dao.getAccountId(accountid), productId);
                    } else {
                        System.out.println("Đã tạo");
                    }
                } else {
                    eDao.createEmotion(eDto);
                }
            } else {
                System.out.println("Update Like to Dislike");
                eDao.updateEmotionToDislike(dao.getAccountId(accountid), productId);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
