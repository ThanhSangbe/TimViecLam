/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service.Impl;

import com.pts.Controller.UserController;
import com.pts.Pojo.Employer;
import com.pts.Pojo.Search;
import com.pts.Pojo.Tintuyendung;
import com.pts.Pojo.User;
import com.pts.Repository.TinTuyenDungRepository;
import com.pts.Service.EmployerService;
import com.pts.Service.TinTuyenDungService;
import com.pts.Service.UserService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class TinTuyenDungServiceImpl implements TinTuyenDungService {

    @Autowired
    private TinTuyenDungRepository tinTuyenDungRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private EmployerService employerService;

    @Override
    public List<Tintuyendung> getTinTuyenDung() {
        return this.tinTuyenDungRepository.getTinTuyenDung();
    }

    @Override
    public List<Tintuyendung> getTinTuyenDung(Search search) {
        return this.tinTuyenDungRepository.getTinTuyenDung(search);
    }

    @Override
    public Tintuyendung getTinTuyenDung(int id) {
        return this.tinTuyenDungRepository.getTinTuyenDung(id);
    }

    @Override
    public boolean addTinTuyenDung(Tintuyendung tintuyendung) {

        User u = this.userService.getUserCurrent();
        Employer employer = this.employerService.getEmployerbyIdUser(u.getId());
        tintuyendung.setIdEmployer(employer);

//        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        tintuyendung.setStartdate(new Date());
        return this.tinTuyenDungRepository.addTinTuyenDung(tintuyendung);
    }
}
