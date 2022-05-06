/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository;

import com.pts.Pojo.Job;
import com.pts.Pojo.User;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface UserRepository {
    boolean addUser(User user);
    List<User> getUser(String username);
    User getUserCurrent();
    User getLastUser();
}
