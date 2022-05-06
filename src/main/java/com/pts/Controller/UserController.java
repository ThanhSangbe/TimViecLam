package com.pts.Controller;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Employer;
import com.pts.Pojo.User;
import com.pts.Service.CandidateService;
import com.pts.Service.EmployerService;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@ControllerAdvice
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private JobService jobService;
    @Autowired
    private CandidateService candidateService;
    @Autowired
    private EmployerService employerService;
    @Autowired
    private ProvinceService provinceService;
    @ModelAttribute
    public void addCommon(Model model) {
        model.addAttribute("jobs", jobService.getJobs());
        model.addAttribute("provinces", provinceService.getProvinces());
    }

    @GetMapping("/dangnhap")
    public String login() {
        return "dangnhap";
    }

    @GetMapping("/register")
    public String registerGet(Model model, @RequestParam(value = "type") Integer type) {
        User user = new User();
        if (type == 1) {
            user.setUserRole("ROLE_E");
        } else {
            user.setUserRole("ROLE_C");
        }
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register1")
    public String register1Post(@ModelAttribute(value = "user") User user, Model model) {

        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userService.addUser(user)) {
                System.out.println(user.getUsername());
                if (user.getUserRole().equals("ROLE_C") == true) {
                    Candidate c = new Candidate();
                    c.setIdAcc(user);
                    model.addAttribute("candidate", c);
                } else {
                    Employer e = new Employer();
                    e.setIdUser(user);
                    model.addAttribute("employer", e);
                }
                return "register2";
            }
        }
        model.addAttribute("errMsg", "Đã có lỗi xảy ra!");
        return "register";
    }

    @PostMapping("/register2")
    public String register2Post(Model model, @ModelAttribute(value = "candidate") @Valid Candidate candidate,
            @ModelAttribute(value = "employer") @Valid Employer employer, BindingResult error) {
        if (candidate.getFullname() != null) {
            if (!error.hasErrors()) {
                this.candidateService.addCandidate(candidate);
                return "redirect:/dangnhap";
            } else {
                model.addAttribute("candidate", candidate);

            }
        }
        if (employer != null) {
            if (!error.hasErrors()) {
                this.employerService.addEmployer(employer);
                return "redirect:/dangnhap";
            } else {
                model.addAttribute("employer", employer);
            }
        }
        return "register2";
    }

}
