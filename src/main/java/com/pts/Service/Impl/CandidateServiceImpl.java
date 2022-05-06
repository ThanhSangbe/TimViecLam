/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pts.Pojo.Candidate;
import com.pts.Pojo.Job;
import com.pts.Pojo.Search;
import com.pts.Pojo.User;
import com.pts.Repository.CandidateRepository;
import com.pts.Service.CandidateService;
import com.pts.Service.UserService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class CandidateServiceImpl implements CandidateService{
    @Autowired
    private CandidateRepository candidateRepository;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private UserService userService;
    @Override
    public boolean addCandidate(Candidate candidate) {
        Map r;
        try {
            r = cloudinary.uploader().upload(candidate.getFileCV().getBytes(), ObjectUtils.emptyMap());
            candidate.setCv(r.get("secure_url").toString());
            candidate.setIdAcc(this.userService.getLastUser());
        } catch (IOException ex) {
           return false;
        }
       return this.candidateRepository.addCandidate(candidate);
    }

    @Override
    public List<Candidate> getUserByJob(Job job) {
        return this.candidateRepository.getUserByJob(job);
    }

    @Override
    public List<Candidate> getUserByAddress(Integer address) {
        return this.candidateRepository.getUserByAddress(address);
    }

    @Override
    public List<Candidate> getCandidates(Search search) {
       return this.candidateRepository.getCandidates(search);
    }

    @Override
    public Candidate getCandidateByUser(Integer id) {
        return this.candidateRepository.getCandidateByUser(id);
    }

    @Override
    public boolean updateCandidate(Candidate candidate) {
       return this.candidateRepository.updateCandidate(candidate);
    }
    
    
    
}
