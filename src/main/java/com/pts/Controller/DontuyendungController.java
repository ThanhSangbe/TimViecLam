/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Controller;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Dontuyendung;
import com.pts.Pojo.User;
import com.pts.Service.CandidateService;
import com.pts.Service.DontuyendungService;
import com.pts.Service.TinTuyenDungService;
import com.pts.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DontuyendungController {

    @Autowired
    private UserService userService;
    @Autowired
    private CandidateService candidateService;
    @Autowired
    private DontuyendungService dontuyendungService;
    @Autowired
    private TinTuyenDungService tinTuyenDungService;

    @GetMapping("/addDontuyendung")
    public String addDontuyendung(@RequestParam(value = "id") Integer id, Model model) {
        User user = this.userService.getUserCurrent();
        if (user != null) {
            Candidate candidate = this.candidateService.getCandidateByUser(user.getId());
            if(candidate.getCv() == "")
            {
                model.addAttribute("errMsg", "Vui lòng cập nhật CV của bạn.");
                return "redirect:/";
            }
            Dontuyendung d = new Dontuyendung();
            d.setIdCandidate(candidate);
            d.setIdTintuyendung(tinTuyenDungService.getTinTuyenDung(id));
            this.dontuyendungService.addDonTuyenDung(d);
        }
        return "redirect:/";
    }
}
