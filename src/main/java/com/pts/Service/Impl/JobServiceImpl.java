/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service.Impl;

import com.pts.Pojo.Job;
import com.pts.Repository.JobRepository;
import com.pts.Service.JobService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class JobServiceImpl implements JobService{
    @Autowired
    private JobRepository jobRepository; 

    @Override
    public List<Job> getJobs() {
        return this.jobRepository.getJobs();
    }
}
