package com.pts.Pojo;

import com.pts.Pojo.Dontuyendung;
import com.pts.Pojo.Employer;
import com.pts.Pojo.Job;
import java.math.BigInteger;
import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2022-02-17T19:58:47", comments="EclipseLink-2.7.9.v20210604-rNA")
@StaticMetamodel(Tintuyendung.class)
public class Tintuyendung_ { 

    public static volatile SingularAttribute<Tintuyendung, String> descrip;
    public static volatile SingularAttribute<Tintuyendung, Job> idJob;
    public static volatile SingularAttribute<Tintuyendung, Integer> id;
    public static volatile CollectionAttribute<Tintuyendung, Dontuyendung> dontuyendungCollection;
    public static volatile SingularAttribute<Tintuyendung, String> title;
    public static volatile SingularAttribute<Tintuyendung, String> experience;
    public static volatile SingularAttribute<Tintuyendung, BigInteger> salary;
    public static volatile SingularAttribute<Tintuyendung, Date> startdate;
    public static volatile SingularAttribute<Tintuyendung, String> skils;
    public static volatile SingularAttribute<Tintuyendung, Employer> idEmployer;

}