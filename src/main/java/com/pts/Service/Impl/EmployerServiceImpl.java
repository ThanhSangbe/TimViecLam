/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pts.Pojo.Employer;
import com.pts.Repository.EmployerRepository;
import com.pts.Service.EmployerService;
import com.pts.Service.UserService;
import java.io.IOException;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployerServiceImpl implements EmployerService{
    @Autowired
    private EmployerRepository employerRepository;
    @Autowired
    private Cloudinary cloudinary; 
    @Autowired
    private  UserService userService;
    @Override
    public boolean addEmployer(Employer employer) {
        Map r;
        try {
            r = cloudinary.uploader().upload(employer.getFileLogo().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            employer.setLogo(r.get("secure_url").toString());
            employer.setIdUser(this.userService.getLastUser());
        } catch (IOException ex) {
           return false;
        }
       return this.employerRepository.addEmployer(employer);
    }

    @Override
    public Employer getEmployerbyIdUser(Integer id) {
        return this.employerRepository.getEmployerbyIdUser(id);
    }
    
}
