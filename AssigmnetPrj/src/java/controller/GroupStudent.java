/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.GroupDAO;
import dal.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Student;

/**
 *
 * @author Admin
 */
public class GroupStudent extends HttpServlet {

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
        StudentDAO sdao = new StudentDAO();
        GroupDAO gdao = new GroupDAO();
        String campus = request.getParameter("campus");
        String term = request.getParameter("term");
        String dept = request.getParameter("dept");
        String courseid = request.getParameter("courseid");
        String group = request.getParameter("group");
        ArrayList campuslist = gdao.getAllCampus();
        ArrayList termlist = gdao.getAllTerm(campus);
        ArrayList departmentlist = gdao.getAllDep(term);
        ArrayList courselist = gdao.getAllSubject(term, dept);
        ArrayList grouplist = gdao.getAllGroup(term, dept, courseid);
        ArrayList<Student> liststudent = sdao.getAllStudent(group);
        request.setAttribute("liststudent", liststudent);
        request.setAttribute("campuslist", campuslist);
        request.setAttribute("termlist", termlist);
        request.setAttribute("departmentlist", departmentlist);
        request.setAttribute("courselist", courselist);
        request.setAttribute("grouplist", grouplist);
        request.getRequestDispatcher("DisplayGroup.jsp").forward(request, response);
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
