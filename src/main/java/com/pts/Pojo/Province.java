/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.Pojo;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "province")
@XmlRootElement

public class Province implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Size(max = 100)
    @Column(name = "name")
    private String name;
    @Size(max = 100)
    @Column(name = "level")
    private String level;
    @OneToMany(mappedBy = "address")
    private Collection<Employer> employerCollection;
    @OneToMany(mappedBy = "province")
    private Set<Candidate> candidateCollection;

    public Province() {
    }

    public Province(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
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
        if (!(object instanceof Province)) {
            return false;
        }
        Province other = (Province) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.getName();
    }

    /**
     * @return the employerCollection
     */
    public Collection<Employer> getEmployerCollection() {
        return employerCollection;
    }

    /**
     * @param employerCollection the employerCollection to set
     */
    public void setEmployerCollection(Collection<Employer> employerCollection) {
        this.employerCollection = employerCollection;
    }

    /**
     * @return the candidateCollection
     */
    public Set<Candidate> getCandidateCollection() {
        return candidateCollection;
    }

    /**
     * @param candidateCollection the candidateCollection to set
     */
    public void setCandidateCollection(Set<Candidate> candidateCollection) {
        this.candidateCollection = candidateCollection;
    }


}
