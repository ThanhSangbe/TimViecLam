/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service;

import com.pts.Pojo.Employer;

/**
 *
 * @author DELL
 */
public interface EmployerService {
    boolean addEmployer(Employer employer);
    Employer getEmployerbyIdUser(Integer id);
}
