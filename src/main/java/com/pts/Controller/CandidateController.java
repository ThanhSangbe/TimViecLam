/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Controller;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Search;
import com.pts.Pojo.User;
import com.pts.Service.CandidateService;
import com.pts.Service.JobService;
import com.pts.Service.ProvinceService;
import com.pts.Service.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author DELL
 */
@Controller
@ControllerAdvice
public class CandidateController {

    @Autowired
    private UserService userService;
    @Autowired
    private JobService jobService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private CandidateService candidateService;

    @ModelAttribute
    public void addCommon(Model model) {
        model.addAttribute("jobs", this.jobService.getJobs());
        model.addAttribute("provinces", this.provinceService.getProvinces());
    }

    @GetMapping("/c/edit")
    public String EditProfileGet(Model model) {
        User user = this.userService.getUserCurrent();
        Candidate candidate = this.candidateService.getCandidateByUser(user.getId());
        model.addAttribute("candidate", candidate);
        return "edit";
    }

    @PostMapping("/c/edit")
    public String EditProfilePost(Model model,@ModelAttribute(value = "candidate") Candidate candidate) {

        if (this.candidateService.updateCandidate(candidate)) {
            return "index";
        }
        
        model.addAttribute("candidate", candidate);
        return "edit";
    }
}
