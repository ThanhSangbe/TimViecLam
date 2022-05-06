/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository.Impl;

import com.pts.Pojo.Employer;
import com.pts.Pojo.Tintuyendung;
import com.pts.Repository.EmployerRepository;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author DELL
 */
@Repository
@Transactional
public class EmployerRepositoryImpl implements EmployerRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addEmployer(Employer employer) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            session.save(employer);
            return true;
        } catch (Exception e) {
            System.err.println(e.getStackTrace());
        }
        return false;
    }

    @Override
    public Employer getEmployerbyIdUser(Integer id) {
        Session session = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Employer> query = builder.createQuery(Employer.class);
//        Root<Employer> root = query.from(Employer.class);
//        query.where(builder.equal(root.get("idUser").as(Integer.class), id));
        String que = "FROM Employer WHERE idUser.id = :id";
       
        Employer em = session.createQuery(que, Employer.class).setParameter("id", id).uniqueResult();
        
        return em;
    }

}
