/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Pojo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Collection;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "tintuyendung")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tintuyendung.findAll", query = "SELECT t FROM Tintuyendung t"),
    @NamedQuery(name = "Tintuyendung.findById", query = "SELECT t FROM Tintuyendung t WHERE t.id = :id"),
    @NamedQuery(name = "Tintuyendung.findByTitle", query = "SELECT t FROM Tintuyendung t WHERE t.title = :title"),
    @NamedQuery(name = "Tintuyendung.findByDescrip", query = "SELECT t FROM Tintuyendung t WHERE t.descrip = :descrip"),
    @NamedQuery(name = "Tintuyendung.findBySkils", query = "SELECT t FROM Tintuyendung t WHERE t.skils = :skils"),
    @NamedQuery(name = "Tintuyendung.findByExperience", query = "SELECT t FROM Tintuyendung t WHERE t.experience = :experience"),
    @NamedQuery(name = "Tintuyendung.findBySalary", query = "SELECT t FROM Tintuyendung t WHERE t.salary = :salary"),
    @NamedQuery(name = "Tintuyendung.findByStartdate", query = "SELECT t FROM Tintuyendung t WHERE t.startdate = :startdate")})
public class Tintuyendung implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Size(max = 500)
    @Column(name = "title")
    @NotNull
    private String title;
    @Size(max = 10000)
    @NotNull
    @Column(name = "descrip")
    private String descrip;
    @Column(name = "Skils")
    @NotNull
    private String skils;
    @NotNull
    @Column(name = "experience")
    private String experience;
    @Column(name = "salary")
    @NotNull
    private BigInteger salary;
    @Column(name = "startdate")
    @Temporal(TemporalType.DATE)
    private Date startdate;
    @JoinColumn(name = "id_employer", referencedColumnName = "id")
    @ManyToOne
    private Employer idEmployer;
    @JoinColumn(name = "id_job", referencedColumnName = "id")
    @ManyToOne
    private Job idJob;

    @OneToMany(mappedBy = "idTintuyendung")
    private Collection<Dontuyendung> dontuyendungCollection;

    public Tintuyendung() {
    }

    public Tintuyendung(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public String getSkils() {
        return skils;
    }

    public void setSkils(String skils) {
        this.skils = skils;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public BigInteger getSalary() {
        return salary;
    }

    public void setSalary(BigInteger salary) {
        this.salary = salary;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Employer getIdEmployer() {
        return idEmployer;
    }

    public void setIdEmployer(Employer idEmployer) {
        this.idEmployer = idEmployer;
    }

    public Job getIdJob() {
        return idJob;
    }

    public void setIdJob(Job idJob) {
        this.idJob = idJob;
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
        if (!(object instanceof Tintuyendung)) {
            return false;
        }
        Tintuyendung other = (Tintuyendung) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.pts.Pojo.Tintuyendung[ id=" + id + " ]";
    }

}
