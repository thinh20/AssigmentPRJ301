/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CheckAttendDAO;
import dal.SlotDAO;
import dal.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Slot;
import model.Student;

/**
 *
 * @author Admin
 */
public class UpdateCheckattend extends HttpServlet {

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
        SlotDAO sdao = new SlotDAO();
        CheckAttendDAO cadao = new CheckAttendDAO();
        StudentDAO studao = new StudentDAO();
        String slotid = request.getParameter("sid");
        String instructorid = request.getParameter("instructorid");
        Slot s = sdao.getSlotById(Integer.valueOf(slotid));
        ArrayList<Student> stulist = studao.getAllStudent(s.getGroup().getCode());
        cadao.deleteSlot(Integer.valueOf(slotid));
        for (Student student : stulist) {
            String checkbox = request.getParameter(String.valueOf(student.getCode()));
            int checkstatus = 0;
            if (checkbox == null) {
                checkstatus = 0;
            } else {
                checkstatus = 1;
            }
            response.getWriter().println(student.getCode() + "-" + checkbox);
            cadao.insertAttendance(Integer.valueOf(slotid), student.getId(), checkstatus, "", instructorid);
        }
        response.sendRedirect("TeachingSchedule");
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
