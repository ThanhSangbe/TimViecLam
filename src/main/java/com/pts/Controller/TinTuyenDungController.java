/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Controller;

import com.pts.Pojo.Tintuyendung;
import com.pts.Service.TinTuyenDungService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author DELL
 */
@Controller
public class TinTuyenDungController {
    @Autowired
    private TinTuyenDungService tinTuyenDungService;
    //Them tin tuyen dung
    @GetMapping("/e/addTintuyendung")
    public String addTintuyendung(Model model) {
        Tintuyendung t = new Tintuyendung();
        model.addAttribute("tinTuyenDung", t);
        return "addTintuyendung";
    }
    @PostMapping("/e/addTintuyendung")
    //them tin tuyen dung
    public String addTinTuyenDungPost(@ModelAttribute(value = "tinTuyenDung") @Valid Tintuyendung tintuyendung, BindingResult error, Model model)
    {
        if(!error.hasErrors())
        {
            if(this.tinTuyenDungService.addTinTuyenDung(tintuyendung))
            {
                return "redirect:/";
            }
        }
        model.addAttribute("tinTuyenDung", tintuyendung);
        return "addTintuyendung";
    }
}
