/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Pojo;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "employer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Employer.findAll", query = "SELECT e FROM Employer e"),
    @NamedQuery(name = "Employer.findById", query = "SELECT e FROM Employer e WHERE e.id = :id"),
    @NamedQuery(name = "Employer.findByTitle", query = "SELECT e FROM Employer e WHERE e.title = :title"),
    @NamedQuery(name = "Employer.findByAddress", query = "SELECT e FROM Employer e WHERE e.address = :address"),
    @NamedQuery(name = "Employer.findByCountry", query = "SELECT e FROM Employer e WHERE e.country = :country"),
    @NamedQuery(name = "Employer.findByLogo", query = "SELECT e FROM Employer e WHERE e.logo = :logo"),
    @NamedQuery(name = "Employer.findBySlogan", query = "SELECT e FROM Employer e WHERE e.slogan = :slogan")})
public class Employer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 250)
    @Column(name = "title")
    private String title;
    @Size(max = 100)
    @Column(name = "country")
    private String country;
    @Size(max = 100)
    @Column(name = "logo")
    private String logo;
    @Size(max = 250)
    @Column(name = "slogan")
    private String slogan;
    @OneToMany(mappedBy = "idEmployer")
    private Collection<Tintuyendung> tintuyendungCollection;
    @Transient
    private MultipartFile fileLogo;
    @JoinColumn(name = "idUser", referencedColumnName = "id")
    @ManyToOne
    private User idUser;
    @JoinColumn(name = "address", referencedColumnName = "id")
    @ManyToOne
    private Province address;
    private String email;
    public Employer() {
    }

    public Employer(Integer id) {
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


    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getSlogan() {
        return slogan;
    }

    public void setSlogan(String slogan) {
        this.slogan = slogan;
    }


    @XmlTransient
    public Collection<Tintuyendung> getTintuyendungCollection() {
        return tintuyendungCollection;
    }

    public void setTintuyendungCollection(Collection<Tintuyendung> tintuyendungCollection) {
        this.tintuyendungCollection = tintuyendungCollection;
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
        if (!(object instanceof Employer)) {
            return false;
        }
        Employer other = (Employer) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.pts.Pojo.Employer[ id=" + id + " ]";
    }


    /**
     * @return the idUser
     */
    public User getIdUser() {
        return idUser;
    }

    /**
     * @param idUser the idUser to set
     */
    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the fileLogo
     */
    public MultipartFile getFileLogo() {
        return fileLogo;
    }

    /**
     * @param fileLogo the fileLogo to set
     */
    public void setFileLogo(MultipartFile fileLogo) {
        this.fileLogo = fileLogo;
    }

    /**
     * @return the address
     */
    public Province getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(Province address) {
        this.address = address;
    }

    
}
