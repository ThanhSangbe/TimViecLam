/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository.Impl;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Search;
import com.pts.Pojo.Tintuyendung;
import com.pts.Repository.TinTuyenDungRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

/**
 *
 * @author DELL
 */
@Repository
@Transactional
public class TinTuyenDungRepositoryImpl implements TinTuyenDungRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Tintuyendung> getTinTuyenDung() {
        Session session = sessionFactory.getObject().getCurrentSession();
        Query query = session.createQuery("FROM Tintuyendung");
        return query.getResultList();
    }

    @Override
    public List<Tintuyendung> getTinTuyenDung(Search search) {
        Session session = sessionFactory.getObject().getCurrentSession();

        List<Tintuyendung> results = null;
        String sql = "";
        if (search != null) {
            results = new ArrayList<>();
            sql += "Select t From Tintuyendung t, Employer e Where t.idEmployer = e.id";
            if (search.getProvince().getId() != 0) {
                sql += " and e.address.id = :id";
                if (search.getKeyword() != "") {
                    sql += String.format(" and t.title like '%%%s%%'", search.getKeyword());}
                    results.addAll(session.createQuery(sql, Tintuyendung.class).setParameter("id", search.getProvince().getId()).getResultList());
                
            } else if (search.getProvince().getId() == 0 && search.getKeyword() != "") {
                sql += String.format(" and t.title like '%%%s%%'", search.getKeyword());
                results.addAll(session.createQuery(sql, Tintuyendung.class).getResultList());
            } else {
                sql = "From Tintuyendung t";
                results.addAll(session.createQuery(sql, Tintuyendung.class).getResultList());
            }

        }

        return results;
    }

    @Override
    public Tintuyendung getTinTuyenDung(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        Tintuyendung ttt = session.get(Tintuyendung.class,
                id);
        return ttt;
    }

    @Override
    public boolean addTinTuyenDung(Tintuyendung tintuyendung) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try {
            session.save(tintuyendung);
            return true;
        } catch (Exception e) {
            System.err.println(e.getStackTrace());
        }
        return false;
    }

}
