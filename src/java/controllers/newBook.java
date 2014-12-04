/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import model.Book;
import service.BookDAO;

/**
 *
 * @author Tianyang
 */
@WebServlet(name = "newBook", urlPatterns = {"/newBook/"})
public class newBook extends HttpServlet {

    @EJB
    BookDAO bookDao;
    private static final Logger LOG = Logger.getLogger(newBook.class.getName());
    @Resource
    Validator validator;;
    
    private Book buildBookFromRequest(HttpServletRequest request) {
        // Method sets values as null or populated, not as empty string...
        Book b = new Book();

        if (request.getParameter("ISBN")!=null && !(request.getParameter("ISBN").equals(""))) {
            b.setISBN(new String(request.getParameter("ISBN")));
        }

        if (request.getParameter("Name")!=null && !(request.getParameter("Name").equals(""))) {
            b.setName(new String(request.getParameter("Name")));
        }
        

        return b;
    }


    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/form.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // On a POST, we want to validate and persist the model
        // When implementing MVC from scratch, first we need to construct the model
        // We still need to worry about empty strings from the HTML form
        Book b = buildBookFromRequest(request);

        // Then, we need to validate it
        Set<ConstraintViolation<Book>> violations = validator.validate(b);

        LOG.info("There are " + violations.size() + " violations.");

        for (ConstraintViolation<Book> violation : violations) {
            LOG.info("### " + violation.getRootBeanClass().getSimpleName()
                    + "." + violation.getPropertyPath()
                    + " - Invalid Value = "
                    + violation.getInvalidValue()
                    + " - Error Msg = " + violation.getMessage());

        }

        // if the post is successfully validated, persist the customer
        if (violations.isEmpty()) {
            if (bookDao.create(b)) {
                request.setAttribute("successes", "The book has been created.");
                request.getRequestDispatcher("/showBook/").forward(request, response);
            } else {
                // in this condition, there was a problem with the call to create
                request.setAttribute("violations", "There was a problem creating the customer.");
                request.getRequestDispatcher("/showBook/").forward(request, response);
            }
        } else {
            // if the post was not successfully validated, set the violations
            // in the request scope
            request.setAttribute("violations", violations);
            // and forward the request back to the form, which will display the
            // violations as error messages for the end-user
            request.getRequestDispatcher("/form.jsp").forward(request, response);
        }
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
