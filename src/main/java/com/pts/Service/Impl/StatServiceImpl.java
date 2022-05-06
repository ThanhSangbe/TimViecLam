/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service.Impl;

import com.pts.Repository.StatRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class StatServiceImpl implements com.pts.Service.StatService{
    @Autowired
    private StatRepository StatRepository;
    @Override
    public List<Object[]> MonthsStat(Integer id) {
        return this.StatRepository.MonthsStat(id);
    }
    
}
