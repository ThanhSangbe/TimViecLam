/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Formatter;

import com.pts.Pojo.Province;

import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author DELL
 */
public class ProvinceFormatter implements Formatter<Province>{

    @Override
    public String print(Province object, Locale locale) {
         return String.valueOf(object.getId());
    }

    @Override
    public Province parse(String text, Locale locale) throws ParseException {
        Province j = new Province();
        j.setId(Integer.parseInt(text));
        return j;
    }
    
}
