package com.pts.Pojo;

import com.pts.Pojo.Dontuyendung;
import com.pts.Pojo.Job;
import com.pts.Pojo.Province;
import com.pts.Pojo.User;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2022-02-17T19:58:47", comments="EclipseLink-2.7.9.v20210604-rNA")
@StaticMetamodel(Candidate.class)
public class Candidate_ { 

    public static volatile SingularAttribute<Candidate, User> idAcc;
    public static volatile SingularAttribute<Candidate, String> cv;
    public static volatile SingularAttribute<Candidate, String> major;
    public static volatile SingularAttribute<Candidate, Province> province;
    public static volatile SingularAttribute<Candidate, Job> idJob;
    public static volatile SingularAttribute<Candidate, String> phone;
    public static volatile SingularAttribute<Candidate, String> logo;
    public static volatile SingularAttribute<Candidate, Integer> id;
    public static volatile SingularAttribute<Candidate, String> fullname;
    public static volatile CollectionAttribute<Candidate, Dontuyendung> dontuyendungCollection;
    public static volatile SingularAttribute<Candidate, String> email;

}