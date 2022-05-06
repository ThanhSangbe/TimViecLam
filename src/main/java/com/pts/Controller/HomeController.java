/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Controller;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Employer;
import com.pts.Pojo.Search;
import com.pts.Pojo.Tintuyendung;
import com.pts.Pojo.User;
import com.pts.Service.CandidateService;
import com.pts.Service.EmployerService;
import com.pts.Service.JobService;
import com.pts.Service.ProvinceService;
import com.pts.Service.TinTuyenDungService;
import com.pts.Service.UserService;
import java.util.List;
import javax.persistence.Query;

import javax.transaction.Transactional;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private TinTuyenDungService tinTuyenDungService;

    @Autowired
    private JobService jobService;

    @Autowired
    private UserService userService;
    @Autowired
    private CandidateService candidateService;
    @Autowired
    private EmployerService employerService;
    @Autowired
    private ProvinceService provinceService;
    @ModelAttribute
    public void addCommon(Model model) {
        model.addAttribute("jobs", this.jobService.getJobs());
        model.addAttribute("provinces", this.provinceService.getProvinces());
        Search s = new Search();
        model.addAttribute("search", s);
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("Tintuyendungs", this.tinTuyenDungService.getTinTuyenDung());
        User user = this.userService.getUserCurrent();
        if (user != null && user.getUserRole().equals("ROLE_E")) {
            {
                Employer employer = this.employerService.getEmployerbyIdUser(user.getId());
                List<Candidate> candidates = candidateService.getUserByAddress(employer.getAddress().getId());
                if (!candidates.isEmpty()) {
                    model.addAttribute("candidates", candidates);
                } else {
                    model.addAttribute("message", "No Result");
                }
            }
        }
        if (user == null || user.getUserRole().equals("ROLE_C")) {
            model.addAttribute("Tintuyendungs", this.tinTuyenDungService.getTinTuyenDung());
        }
        if(user != null && user.getUserRole().equals("ROLE_A"))
        {
            return  "redirect:/admin/statistics";
        }

        return "index";
    }

    @GetMapping("/search")
    public String search(Model model, @ModelAttribute(value = "search") Search search) {

        User user = this.userService.getUserCurrent();
        if (user != null && user.getUserRole().equals("ROLE_E")) {
            {
                List<Candidate> candidates = this.candidateService.getCandidates(search);
                if(candidates.isEmpty())
                {
                    model.addAttribute("message", "No Result");
                }
                else
                {
                    model.addAttribute("candidates", candidates);
                }
            }
        }
        if (user == null || user.getUserRole().equals("ROLE_C")) {
            List<Tintuyendung> list = this.tinTuyenDungService.getTinTuyenDung(search);
            if (list.isEmpty()) {
                model.addAttribute("message", "No Result");
            } else {
                model.addAttribute("Tintuyendungs", list);
            }
        }
        model.addAttribute("search", new Search());
        model.addAttribute("title",search.getKeyword() + ".");
        return "index";
    }

    @GetMapping("/detail")
    public String details(Model model, @RequestParam(name = "id", required = true) Integer id) {
        model.addAttribute("item", this.tinTuyenDungService.getTinTuyenDung(id));
        return "detail";
    }

}
