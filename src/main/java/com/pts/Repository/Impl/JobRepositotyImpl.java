/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository.Impl;

import com.pts.Pojo.Job;
import com.pts.Repository.JobRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
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
public class JobRepositotyImpl implements JobRepository{

     @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Job> getJobs() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.createQuery("FROM Job",Job.class).getResultList();
    }
    
}
