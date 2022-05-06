
package com.pts.Controller;

import com.pts.Service.StatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @Autowired
    private StatService statService;
    @GetMapping("/admin/statistics")
    public String StatisticsGet(@RequestParam(value = "quy", required = false) Integer id, Model model) {
        if(statService.MonthsStat(id).size()>0)
        {
            model.addAttribute("items", statService.MonthsStat(id));
        }
        else 
        {
            model.addAttribute("errMsg","Chưa có dữ liệu");
        }
        return "admin-statistics";
    }
}
