/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "dontuyendung")
@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Dontuyendung.findAll", query = "SELECT d FROM Dontuyendung d"),
//    @NamedQuery(name = "Dontuyendung.findById", query = "SELECT d FROM Dontuyendung d WHERE d.id = :id"),
//    @NamedQuery(name = "Dontuyendung.findByDatestart", query = "SELECT d FROM Dontuyendung d WHERE d.datestart = :datestart")})
public class Dontuyendung implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "datestart")
    @Temporal(TemporalType.DATE)
    private Date datestart;
    @JoinColumn(name = "id_candidate", referencedColumnName = "id")
    @ManyToOne
    private Candidate idCandidate;
    @JoinColumn(name = "id_tintuyendung", referencedColumnName = "id")
    @ManyToOne
    private Tintuyendung idTintuyendung;


    public Dontuyendung() {
    }

    public Dontuyendung(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDatestart() {
        return datestart;
    }

    public void setDatestart(Date datestart) {
        this.datestart = datestart;
    }

    public Candidate getIdCandidate() {
        return idCandidate;
    }

    public void setIdCandidate(Candidate idCandidate) {
        this.idCandidate = idCandidate;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Dontuyendung)) {
            return false;
        }
        Dontuyendung other = (Dontuyendung) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.pts.Pojo.Dontuyendung[ id=" + id + " ]";
    }

    /**
     * @return the idTintuyendung
     */
    public Tintuyendung getIdTintuyendung() {
        return idTintuyendung;
    }

    /**
     * @param idTintuyendung the idTintuyendung to set
     */
    public void setIdTintuyendung(Tintuyendung idTintuyendung) {
        this.idTintuyendung = idTintuyendung;
    }
    
}
