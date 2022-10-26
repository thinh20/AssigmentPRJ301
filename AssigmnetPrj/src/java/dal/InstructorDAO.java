/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Instructor;

/**
 *
 * @author Admin
 */
public class InstructorDAO extends DBContext {

    

    public ArrayList<Instructor> getAllInstructor() {
        ArrayList<Instructor> ilist = new ArrayList<>();
        String sql = "  select * from Instructor";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Instructor i = new Instructor(rs.getInt(1), rs.getString(2), rs.getString(3));
                ilist.add(i);
            }
        } catch (Exception e) {
        }
        return ilist;
    }
}
