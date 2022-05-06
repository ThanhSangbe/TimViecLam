/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Job;
import com.pts.Pojo.Search;
import com.pts.Pojo.User;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface CandidateRepository {
    boolean addCandidate(Candidate candidate);
    List<Candidate> getUserByJob(Job job);
    List<Candidate> getUserByAddress(Integer address);
    List<Candidate> getCandidates(Search search);
    Candidate getCandidateByUser(Integer id);
    boolean updateCandidate(Candidate candidate);
}
