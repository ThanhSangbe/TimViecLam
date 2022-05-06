/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository.Impl;

import com.pts.Pojo.Dontuyendung;
import com.pts.Pojo.Job;
import com.pts.Pojo.Tintuyendung;
import com.pts.Repository.StatRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Query;
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
public class StatRepositoryImpl implements StatRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFacroty;

    @Override
    public List<Object[]> MonthsStat(Integer id) {
        Session session = this.sessionFacroty.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
//      ckeditor
        Root rootD = q.from(Dontuyendung.class);
        Root rootT = q.from(Tintuyendung.class);
        Root rootJ = q.from(Job.class);
        if (id != null) {
            List<Predicate> pri = new ArrayList<>();
            pri.add(b.equal(rootD.get("idTintuyendung"), rootT.get("id")));
            pri.add(b.equal(rootT.get("idJob"), rootJ.get("id")));
            q.multiselect(rootJ.get("title"), b.count(rootT.get("idJob")));
            SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

            switch (id) {
                case 1: {
                    try {
                        pri.add(b.greaterThanOrEqualTo(rootD.get("datestart"), f.parse("2022-1-1")));
                        pri.add(b.lessThanOrEqualTo(rootD.get("datestart"), f.parse("2022-31-3")));
                    } catch (ParseException ex) {
                        Logger.getLogger(StatRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                }
                case 2: {
                    try {
                        pri.add(b.greaterThanOrEqualTo(rootD.get("datestart"), f.parse("2022-4-1")));
                        pri.add(b.lessThanOrEqualTo(rootD.get("datestart"), f.parse("2022-31-6")));
                    } catch (ParseException ex) {
                        Logger.getLogger(StatRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                }
                case 3: {
                    try {
                        pri.add(b.greaterThanOrEqualTo(rootD.get("datestart"), f.parse("2022-7-1")));
                        pri.add(b.lessThanOrEqualTo(rootD.get("datestart"), f.parse("2022-31-9")));
                    } catch (ParseException ex) {
                        Logger.getLogger(StatRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                }
                case 4: {
                    try {
                        pri.add(b.greaterThanOrEqualTo(rootD.get("datestart"), f.parse("2022-10-1")));
                        pri.add(b.lessThanOrEqualTo(rootD.get("datestart"), f.parse("2022-31-12")));
                    } catch (ParseException ex) {
                        Logger.getLogger(StatRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                }

                default:
                    throw new AssertionError();
            }

            q.where(pri.toArray(new Predicate[]{}));
            q.groupBy(rootT.get("idJob"));
            Query query = session.createQuery(q);
            return query.getResultList();
        }
        return null;

    }

}
