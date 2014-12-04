/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.sql.DataSource;
import model.Book;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;

/**
 *
 * @author Tianyang
 */
@Stateless
public class BookDAO {
    @Resource(lookup="jdbc/testSource3")
    DataSource ds;
    
    public List<Book> findAll() {
        String sql = "select ISBN,Name from book";

        List books = new ArrayList<>();

        try (Connection con = ds.getConnection()) {

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Book b = new Book(rs.getString("ISBN"),
                        rs.getString("Name"));
                
                books.add(b);
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

        return books;
    }
    
    public boolean create(Book b) {
        String sql = "insert into Book("
                + "ISBN, "
                + "Name)"
                + "values (?,?)";

        try (Connection con = ds.getConnection()) {

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, b.getISBN());
            pstmt.setString(2, b.getName());
            

            if (pstmt.executeUpdate() == 1) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
    public boolean delete(String isbn) {
        String sql = "delete from Book where ISBN=?";

        try (Connection con = ds.getConnection()) {

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, isbn);
            

            if (pstmt.executeUpdate() == 1) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
    public boolean update(Book b){
        String sql = "update Book set Name = ? where ISBN=?";

        try (Connection con = ds.getConnection()) {

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, b.getName());
            pstmt.setString(2, b.getISBN());
            

            if (pstmt.executeUpdate() == 1) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
}
