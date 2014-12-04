/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Tianyang
 */
public class Book {
    private String ISBN;
    private String Name;

    public Book(String ISBN, String Name) {
        this.ISBN = ISBN;
        this.Name = Name;
    }

    public Book() {
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    @Override
    public String toString() {
        return "Book{" + "ISBN=" + ISBN + ", Name=" + Name + '}';
    }


   
    
}
