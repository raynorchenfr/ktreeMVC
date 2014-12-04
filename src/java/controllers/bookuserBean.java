/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Tianyang
 */

public class bookuserBean {
    @PersistenceContext(unitName = "somePU")
    private EntityManager em;

    
    /**
     *
     * @return
     */
    protected EntityManager getEntityManager(){
        return this.em;
    }
    
    public bookUser findByUserName(String userName){
        Query query = em.createQuery("select u from bookUser u where u.userName=?1", bookUser.class);
        query.setParameter(1, userName);
        return (bookUser)query.getSingleResult();
    }
}
