/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository.Impl;

import com.pts.Pojo.Province;
import com.pts.Repository.ProvinceRepository;
import java.util.List;
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
public class ProvinceRepositoryIml implements ProvinceRepository{
    @Autowired
    LocalSessionFactoryBean sessionFactory;
    @Override
    public List<Province> getProvinces() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.createQuery("FROM Province", Province.class).getResultList();
    }
    
}
