/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository.Impl;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Job;
import com.pts.Pojo.Province;
import com.pts.Pojo.Search;
import com.pts.Pojo.User;
import com.pts.Repository.CandidateRepository;
import com.pts.Service.UserService;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
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
public class CandidateRepositoryImpl implements CandidateRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private UserService userService;

    @Override
    public boolean addCandidate(Candidate candidate) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            session.save(candidate);
            return true;
        } catch (Exception ex) {
            System.err.println(ex.getStackTrace());
        }
        return false;
    }

    @Override
    public List<Candidate> getUserByJob(Job job) {
        Session session = sessionFactory.getObject().getCurrentSession();
        List<Candidate> candidates = session.createQuery("FROM Candidate WHERE idJob.id = :id", Candidate.class).setParameter("id", job.getId()).getResultList();
        return candidates;
    }

    @Override
    public List<Candidate> getUserByAddress(Integer address) {
        Session session = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Candidate> query = builder.createQuery(Candidate.class);
//        Root root = query.from(Candidate.class);
//        query = query.select(root);
//        if (address != null) {
//            Predicate p = builder.like(root.get("address").as(String.class), String.format("%%%s%%", address));
//            query = query.where(p);
//        }
//        return session.createQuery(query).getResultList();
        List<Candidate> list = session.createQuery("FROM Candidate WHERE province.id = :id", Candidate.class).setParameter("id", address).getResultList();
        if (list.isEmpty()) {
            list = session.createQuery("FROM Candidate", Candidate.class).getResultList();
        }
        return list;
    }

    @Override
    public List<Candidate> getCandidates(Search search) {
        List<Candidate> candidates = null;
        Session session = this.sessionFactory.getObject().getCurrentSession();
        if (search != null) {
            candidates = new ArrayList<>();
            String sql = "From Candidate";
            if (search.getProvince().getId() != 0) {
                sql += " Where province.id = :id";

                if (search.getKeyword() == "") {
                    candidates.addAll(session.createQuery(sql).setParameter("id", search.getProvince().getId()).getResultList());
                } else {
                    sql += String.format(" and (major like '%%%s%%' or idJob.title like '%%%s%%') ", search.getKeyword(), search.getKeyword());
                    candidates.addAll(session.createQuery(sql).setParameter("id", search.getProvince().getId()).getResultList());
                }
            } else if (search.getProvince().getId() == 0 && search.getKeyword() != "") {
                sql += String.format(" Where (major like '%%%s%%' or idJob.title like '%%%s%%')", search.getKeyword(), search.getKeyword());
                candidates.addAll(session.createQuery(sql).getResultList());
            } else {
                candidates.addAll(session.createQuery(sql).getResultList());
            }
            System.out.println(sql);
        }
        return candidates;
    }

    @Override
    public Candidate getCandidateByUser(Integer id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String que = "FROM Candidate WHERE idAcc.id = :id";
        Candidate candidate = session.createQuery(que, Candidate.class).setParameter("id", id).getResultList().get(0);
        return candidate;
    }

    @Override
    public boolean updateCandidate(Candidate candidate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.saveOrUpdate(candidate);
            return true;
        } catch (Exception e) {
            System.err.println(e.getMessage());

        }
        return false;
    }
}
