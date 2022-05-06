/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service.Impl;

import com.pts.Pojo.Province;
import com.pts.Repository.ProvinceRepository;
import com.pts.Service.ProvinceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
    
@Service
public class ProvinceServiceImpl implements ProvinceService{
   @Autowired
    private ProvinceRepository  provinceRepository;

    @Override
    public List<Province> getProvinces() {
        return this.provinceRepository.getProvinces();
    }
}
