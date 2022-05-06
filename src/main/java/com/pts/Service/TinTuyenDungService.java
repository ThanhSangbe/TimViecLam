/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Service;

import com.pts.Pojo.Search;
import com.pts.Pojo.Tintuyendung;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface TinTuyenDungService {
    List<Tintuyendung> getTinTuyenDung();
    List<Tintuyendung> getTinTuyenDung(Search search);
    Tintuyendung getTinTuyenDung(int id);
    boolean addTinTuyenDung(Tintuyendung tintuyendung);
}
