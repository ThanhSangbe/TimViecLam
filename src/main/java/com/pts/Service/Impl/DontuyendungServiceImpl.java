/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service.Impl;

import com.pts.Pojo.Dontuyendung;
import com.pts.Repository.DontuyendungRepository;
import com.pts.Service.DontuyendungService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DontuyendungServiceImpl implements DontuyendungService{
    @Autowired
    private DontuyendungRepository dontuyendungRepository;
    @Override
    public boolean addDonTuyenDung(Dontuyendung dontuyendung) {
        dontuyendung.setDatestart(new Date());
        return this.dontuyendungRepository.addDonTuyenDung(dontuyendung);
    }
    
}
