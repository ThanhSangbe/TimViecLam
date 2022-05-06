/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Repository;

import com.pts.Pojo.Search;
import com.pts.Pojo.Tintuyendung;
import java.util.List;

public interface TinTuyenDungRepository {
    List<Tintuyendung> getTinTuyenDung();
    List<Tintuyendung> getTinTuyenDung(Search search);
    Tintuyendung getTinTuyenDung(int id);
    boolean addTinTuyenDung(Tintuyendung tintuyendung);
    
}
