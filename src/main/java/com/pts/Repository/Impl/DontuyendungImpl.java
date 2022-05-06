/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository.Impl;

import com.pts.Pojo.Dontuyendung;
import com.pts.Repository.DontuyendungRepository;
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
public class DontuyendungImpl implements DontuyendungRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public boolean addDonTuyenDung(Dontuyendung dontuyendung) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(dontuyendung);
            return true;
        } catch(Exception e)
        {
            System.err.println(e.getStackTrace());
        }
        return false;
    }
    
}
